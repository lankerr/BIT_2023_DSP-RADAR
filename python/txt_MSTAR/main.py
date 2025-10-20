import os
import numpy as np
from skimage import io
import time


def convert_txt_to_jpg(txt_file_path, output_dir):
    """
    将单个TXT文件转换为JPG图片

    参数:
        txt_file_path: TXT文件路径
        output_dir: 输出目录路径
    """
    # 从文件路径中提取文件名
    filename = os.path.basename(txt_file_path)

    # 分割文件名获取图片名和类别
    parts = filename.split('_', 1)
    if len(parts) < 2:
        raise ValueError(f"文件名格式错误: {filename}")

    img_name = parts[0]
    # 去掉.txt扩展名获取完整类别名
    class_name = os.path.splitext(parts[1])[0]

    # 创建类别文件夹
    class_dir = os.path.join(output_dir, class_name)
    os.makedirs(class_dir, exist_ok=True)

    # 构建输出图片路径
    output_path = os.path.join(class_dir, f"{img_name}.jpg")

    # 读取TXT文件数据
    img_data = np.loadtxt(txt_file_path, dtype=np.uint8)

    # 保存为JPG图片
    io.imsave(output_path, img_data)

    return class_name, output_path


def main():
    # 设置路径
    base_dir = os.path.dirname(os.path.abspath(__file__))
    txt_root = os.path.join(base_dir, 'txt_MSTAR')
    jpg_root = os.path.join(base_dir, 'data')

    # 记录处理时间和数量
    total_time = 0.0
    processed_count = 0

    # 遍历txt_MSTAR目录
    for root, dirs, files in os.walk(txt_root):
        for filename in files:
            if filename.lower().endswith('.txt'):
                txt_path = os.path.join(root, filename)

                # 确定输出目录（保持train/test结构）
                relative_path = os.path.relpath(root, txt_root)
                output_dir = os.path.join(jpg_root, relative_path)

                try:
                    start_time = time.time()

                    # 转换文件
                    class_name, jpg_path = convert_txt_to_jpg(txt_path, output_dir)

                    elapsed = time.time() - start_time
                    total_time += elapsed
                    processed_count += 1

                    print(f"转换成功: {filename} -> {jpg_path} (类别: {class_name}, 耗时: {elapsed:.4f}s)")

                except Exception as e:
                    print(f"处理文件 {filename} 时出错: {str(e)}")

    # 输出统计信息
    if processed_count > 0:
        avg_time = total_time / processed_count
        print(f"\n处理完成! 共转换 {processed_count} 个文件")
        print(f"每张图片平均处理时间: {avg_time:.4f} 秒")
    else:
        print("未找到可处理的TXT文件")


if __name__ == "__main__":
    main()