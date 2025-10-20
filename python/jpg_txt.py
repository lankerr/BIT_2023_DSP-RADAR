import os
from skimage import io as skio
import numpy as np

if __name__ == '__main__':
    in_data_dir = '/home/lwc/data'
    out_data_dir = '/home/lwc/txt_MSTAR'
    for root, dirs, files in os.walk(in_data_dir):
        for name in files:
            if name.endswith('.jpg') or name.endswith('.JPG'):
                in_file_path = os.path.join(root, name)
                out_file_dir = os.path.dirname(in_file_path).replace(in_data_dir, out_data_dir)
                os.makedirs(out_file_dir, exist_ok=True)
                out_file_path = in_file_path.replace(in_data_dir, out_data_dir).rsplit('.', 1)[0] + '.txt'
                img_data = skio.imread(in_file_path)
                np.savetxt(out_file_path, img_data, fmt="%d")
