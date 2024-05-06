function varargout = kalman_gui(varargin)
% KALMAN_GUI M-file for kalman_gui.fig
%      KALMAN_GUI, by itself, creates a new KALMAN_GUI or raises the existing
%      singleton*.
%
%      H = KALMAN_GUI returns the handle to a new KALMAN_GUI or the handle to
%      the existing singleton*.
%
%      KALMAN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KALMAN_GUI.M with the given input arguments.
%
%      KALMAN_GUI('Property','Value',...) creates a new KALMAN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kalman_gui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kalman_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kalman_gui

% Last Modified by GUIDE v2.5 17-Jun-2003 14:42:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kalman_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @kalman_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else

    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before kalman_gui is made visible.
function kalman_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kalman_gui (see VARARGIN)

% Choose default command line output for kalman_gui
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

if strcmp(get(hObject,'Visible'),'off')
    initialize_gui(hObject, handles);
end

% UIWAIT makes kalman_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kalman_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;








function initialize_gui(fig_handle, handles)
data.start_loc = zeros(3,1);
data.velocity = 0.0 ;
data.yamp = 0.0 ;
data.yperiod = 0.0 ;
data.zamp = 0.0 ;
data.zperiod = 0.0 ;
data.samplingtime = 0.0 ;
data.deltat = 0.0 ;
data.sigmaaz = 0.0 ;
data.sigmael = 0.0 ;
data.sigmarange = 0.0 ;
data.x0 = zeros(6,1) ;
data.P0 = zeros(6,6) ;
data.phi = zeros(6,6) ;
data.R = zeros(3,3) ;
data.Q = zeros(6,6) ;

set(handles.xstart, 'String', data.start_loc(1));
set(handles.ystart, 'String', data.start_loc(2));
set(handles.zstart, 'String', data.start_loc(3));
set(handles.velocity, 'String', data.velocity);
set(handles.y_amp, 'String', data.yamp);
set(handles.y_period, 'String', data.yperiod);
set(handles.z_amp, 'String', data.zamp);
set(handles.z_period, 'String', data.zperiod);
set(handles.sampletime, 'String', data.samplingtime);
set(handles.deltat, 'String', data.deltat);
set(handles.sigmaaz, 'String', data.sigmaaz);
set(handles.sigmael, 'String', data.sigmael);
set(handles.sigmarange, 'String', data.sigmarange);

set(handles.x0_1, 'String', num2str(data.x0(1)));
set(handles.x0_2, 'String', num2str(data.x0(2)));
set(handles.x0_3, 'String', num2str(data.x0(3)));
set(handles.x0_4, 'String', num2str(data.x0(4)));
set(handles.x0_5, 'String', num2str(data.x0(5)));
set(handles.x0_6, 'String', num2str(data.x0(6)));

set(handles.P11, 'String', num2str(data.P0(1,1)) );
set(handles.P12, 'String', num2str(data.P0(1,2)) );
set(handles.P13, 'String', num2str(data.P0(1,3)) );
set(handles.P14, 'String', num2str(data.P0(1,4)) );
set(handles.P15, 'String', num2str(data.P0(1,5)) );
set(handles.P16, 'String', num2str(data.P0(1,6)) );
set(handles.P21, 'String', num2str(data.P0(2,1)) );
set(handles.P22, 'String', num2str(data.P0(2,2)) );
set(handles.P23, 'String', num2str(data.P0(2,3)) );
set(handles.P24, 'String', num2str(data.P0(2,4)) );
set(handles.P25, 'String', num2str(data.P0(2,5)) );
set(handles.P26, 'String', num2str(data.P0(2,6)) );
set(handles.P31, 'String', num2str(data.P0(3,1)) );
set(handles.P32, 'String', num2str(data.P0(3,2)) );
set(handles.P33, 'String', num2str(data.P0(3,3)) );
set(handles.P34, 'String', num2str(data.P0(3,4)) );
set(handles.P35, 'String', num2str(data.P0(3,5)) );
set(handles.P36, 'String', num2str(data.P0(3,6)) );
set(handles.P41, 'String', num2str(data.P0(4,1)) );
set(handles.P42, 'String', num2str(data.P0(4,2)) );
set(handles.P43, 'String', num2str(data.P0(4,3)) );
set(handles.P44, 'String', num2str(data.P0(4,4)) );
set(handles.P45, 'String', num2str(data.P0(4,5)) );
set(handles.P46, 'String', num2str(data.P0(4,6)) );
set(handles.P51, 'String', num2str(data.P0(5,1)) );
set(handles.P52, 'String', num2str(data.P0(5,2)) );
set(handles.P53, 'String', num2str(data.P0(5,3)) );
set(handles.P54, 'String', num2str(data.P0(5,4)) );
set(handles.P55, 'String', num2str(data.P0(5,5)) );
set(handles.P56, 'String', num2str(data.P0(5,6)) );
set(handles.P61, 'String', num2str(data.P0(6,1)) );
set(handles.P62, 'String', num2str(data.P0(6,2)) );
set(handles.P63, 'String', num2str(data.P0(6,3)) );
set(handles.P64, 'String', num2str(data.P0(6,4)) );
set(handles.P65, 'String', num2str(data.P0(6,5)) );
set(handles.P66, 'String', num2str(data.P0(6,6)) );

set(handles.R_11, 'String', num2str(data.R(1,1)) );
set(handles.R_12, 'String', num2str(data.R(1,2)) );
set(handles.R_13, 'String', num2str(data.R(1,3)) );
set(handles.R_21, 'String', num2str(data.R(2,1)) );
set(handles.R_22, 'String', num2str(data.R(2,2)) );
set(handles.R_23, 'String', num2str(data.R(2,3)) );
set(handles.R_31, 'String', num2str(data.R(3,1)) );
set(handles.R_32, 'String', num2str(data.R(3,2)) );
set(handles.R_33, 'String', num2str(data.R(3,3)) );

set(handles.Q11, 'String', num2str(data.Q(1,1)) );
set(handles.Q12, 'String', num2str(data.Q(1,2)) );
set(handles.Q13, 'String', num2str(data.Q(1,3)) );
set(handles.Q14, 'String', num2str(data.Q(1,4)) );
set(handles.Q15, 'String', num2str(data.Q(1,5)) );
set(handles.Q16, 'String', num2str(data.Q(1,6)) );
set(handles.Q21, 'String', num2str(data.Q(2,1)) );
set(handles.Q22, 'String', num2str(data.Q(2,2)) );
set(handles.Q23, 'String', num2str(data.Q(2,3)) );
set(handles.Q24, 'String', num2str(data.Q(2,4)) );
set(handles.Q25, 'String', num2str(data.Q(2,5)) );
set(handles.Q26, 'String', num2str(data.Q(2,6)) );
set(handles.Q31, 'String', num2str(data.Q(3,1)) );
set(handles.Q32, 'String', num2str(data.Q(3,2)) );
set(handles.Q33, 'String', num2str(data.Q(3,3)) );
set(handles.Q34, 'String', num2str(data.Q(3,4)) );
set(handles.Q35, 'String', num2str(data.Q(3,5)) );
set(handles.Q36, 'String', num2str(data.Q(3,6)) );
set(handles.Q41, 'String', num2str(data.Q(4,1)) );
set(handles.Q42, 'String', num2str(data.Q(4,2)) );
set(handles.Q43, 'String', num2str(data.Q(4,3)) );
set(handles.Q44, 'String', num2str(data.Q(4,4)) );
set(handles.Q45, 'String', num2str(data.Q(4,5)) );
set(handles.Q46, 'String', num2str(data.Q(4,6)) );
set(handles.Q51, 'String', num2str(data.Q(5,1)) );
set(handles.Q52, 'String', num2str(data.Q(5,2)) );
set(handles.Q53, 'String', num2str(data.Q(5,3)) );
set(handles.Q54, 'String', num2str(data.Q(5,4)) );
set(handles.Q55, 'String', num2str(data.Q(5,5)) );
set(handles.Q56, 'String', num2str(data.Q(5,6)) );
set(handles.Q61, 'String', num2str(data.Q(6,1)) );
set(handles.Q62, 'String', num2str(data.Q(6,2)) );
set(handles.Q63, 'String', num2str(data.Q(6,3)) );
set(handles.Q64, 'String', num2str(data.Q(6,4)) );
set(handles.Q65, 'String', num2str(data.Q(6,5)) );
set(handles.Q66, 'String', num2str(data.Q(6,6)) );






% --- Executes during object creation, after setting all properties.
function xstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function xstart_Callback(hObject, eventdata, handles)
% hObject    handle to xstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xstart as text
%        str2double(get(hObject,'String')) returns contents of xstart as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end







% --- Executes during object creation, after setting all properties.
function ystart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ystart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function ystart_Callback(hObject, eventdata, handles)
% hObject    handle to ystart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ystart as text
%        str2double(get(hObject,'String')) returns contents of ystart as a double

temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end



% --- Executes during object creation, after setting all properties.
function zstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function zstart_Callback(hObject, eventdata, handles)
% hObject    handle to zstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zstart as text
%        str2double(get(hObject,'String')) returns contents of zstart as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end






% --- Executes during object creation, after setting all properties.
function velocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function velocity_Callback(hObject, eventdata, handles)
% hObject    handle to velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of velocity as text
%        str2double(get(hObject,'String')) returns contents of velocity as a double

temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end







% --- Executes during object creation, after setting all properties.
function y_amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function y_amp_Callback(hObject, eventdata, handles)
% hObject    handle to y_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_amp as text
%        str2double(get(hObject,'String')) returns contents of y_amp as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end






% --- Executes during object creation, after setting all properties.
function y_period_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function y_period_Callback(hObject, eventdata, handles)
% hObject    handle to y_period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_period as text
%        str2double(get(hObject,'String')) returns contents of y_period as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end



% --- Executes during object creation, after setting all properties.
function z_amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function z_amp_Callback(hObject, eventdata, handles)
% hObject    handle to z_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_amp as text
%        str2double(get(hObject,'String')) returns contents of z_amp as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end




% --- Executes during object creation, after setting all properties.
function z_period_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function z_period_Callback(hObject, eventdata, handles)
% hObject    handle to z_period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_period as text
%        str2double(get(hObject,'String')) returns contents of z_period as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end










% --- Executes during object creation, after setting all properties.
function sampletime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampletime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function sampletime_Callback(hObject, eventdata, handles)
% hObject    handle to sampletime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampletime as text
%        str2double(get(hObject,'String')) returns contents of sampletime as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end





% --- Executes during object creation, after setting all properties.
function deltat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to deltat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function deltat_Callback(hObject, eventdata, handles)
% hObject    handle to deltat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of deltat as text
%        str2double(get(hObject,'String')) returns contents of deltat as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end









% --- Executes during object creation, after setting all properties.
function sigmaaz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmaaz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function sigmaaz_Callback(hObject, eventdata, handles)
% hObject    handle to sigmaaz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmaaz as text
%        str2double(get(hObject,'String')) returns contents of sigmaaz as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end





% --- Executes during object creation, after setting all properties.
function sigmael_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmael (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function sigmael_Callback(hObject, eventdata, handles)
% hObject    handle to sigmael (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmael as text
%        str2double(get(hObject,'String')) returns contents of sigmael as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end




% --- Executes during object creation, after setting all properties.
function sigmarange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmarange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function sigmarange_Callback(hObject, eventdata, handles)
% hObject    handle to sigmarange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmarange as text
%        str2double(get(hObject,'String')) returns contents of sigmarange as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end








% --- Executes during object creation, after setting all properties.
function x0_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function x0_1_Callback(hObject, eventdata, handles)
% hObject    handle to x0_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0_1 as text
%        str2double(get(hObject,'String')) returns contents of x0_1 as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end



% --- Executes during object creation, after setting all properties.
function x0_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function x0_2_Callback(hObject, eventdata, handles)
% hObject    handle to x0_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0_2 as text
%        str2double(get(hObject,'String')) returns contents of x0_2 as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end





% --- Executes during object creation, after setting all properties.
function x0_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function x0_3_Callback(hObject, eventdata, handles)
% hObject    handle to x0_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0_3 as text
%        str2double(get(hObject,'String')) returns contents of x0_3 as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end





% --- Executes during object creation, after setting all properties.
function x0_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function x0_4_Callback(hObject, eventdata, handles)
% hObject    handle to x0_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0_4 as text
%        str2double(get(hObject,'String')) returns contents of x0_4 as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end





% --- Executes during object creation, after setting all properties.
function x0_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function x0_5_Callback(hObject, eventdata, handles)
% hObject    handle to x0_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0_5 as text
%        str2double(get(hObject,'String')) returns contents of x0_5 as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end




% --- Executes during object creation, after setting all properties.
function x0_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function x0_6_Callback(hObject, eventdata, handles)
% hObject    handle to x0_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0_6 as text
%        str2double(get(hObject,'String')) returns contents of x0_6 as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end






























% --- Executes on button press in CalculateButton.
function CalculateButton_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



start_loc = zeros(3,1);
velocity = 0.0 ;
yamp = 0.0 ;
yperiod = 0.0 ;
zamp = 0.0 ;
zperiod = 0.0 ;
samplingtime = 0.0 ;
deltat = 0.0 ;
sigmaaz = 0.0 ;
sigmael = 0.0 ;
sigmarange = 0.0 ;
x0 = zeros(6,1) ;
P0 = zeros(6,6) ;
R = zeros(3,3) ;
Q = zeros(6,6) ;

start_loc(1) =  str2num(get(handles.xstart,'String')) ;
start_loc(2) =  str2num(get(handles.ystart,'String')) ;
start_loc(3) =  str2num(get(handles.zstart,'String')) ;
start_loc
velocity =  str2num(get(handles.velocity,'String'))
yamp =  str2num(get(handles.y_amp,'String'))
yperiod =  str2num(get(handles.y_period,'String'))
zamp =  str2num(get(handles.z_amp,'String'))
zperiod =  str2num(get(handles.z_period,'String'))
samplingtime = str2num(get(handles.sampletime,'String'))
deltat =  str2num(get(handles.deltat,'String'))
sigmaaz =  str2num(get(handles.sigmaaz,'String'))
sigmael =  str2num(get(handles.sigmael,'String'))
sigmarange =  str2num(get(handles.sigmarange,'String'))

x0(1) = str2num(get(handles.x0_1,'String')) ;
x0(2) = str2num(get(handles.x0_2,'String')) ;
x0(3) = str2num(get(handles.x0_3,'String')) ;
x0(4) = str2num(get(handles.x0_4,'String')) ;
x0(5) = str2num(get(handles.x0_5,'String')) ;
x0(6) = str2num(get(handles.x0_6,'String')) ;

P0(1,1) = str2num(get(handles.P11,'String')) ;
P0(1,2) = str2num(get(handles.P12,'String')) ;
P0(1,3) = str2num(get(handles.P13,'String')) ;
P0(1,4) = str2num(get(handles.P14,'String'));
P0(1,5) = str2num(get(handles.P15,'String'));
P0(1,6) = str2num(get(handles.P16,'String'));
P0(2,1) = str2num(get(handles.P21,'String'));
P0(2,2) = str2num(get(handles.P22,'String'));
P0(2,3) = str2num(get(handles.P23,'String'));
P0(2,4) = str2num(get(handles.P24,'String'));
P0(2,5) = str2num(get(handles.P25,'String'));
P0(2,6) = str2num(get(handles.P26,'String'));
P0(3,1) = str2num(get(handles.P31,'String'));
P0(3,2) = str2num(get(handles.P32,'String'));
P0(3,3) = str2num(get(handles.P33,'String'));
P0(3,4) = str2num(get(handles.P34,'String'));
P0(3,5) = str2num(get(handles.P35,'String'));
P0(3,6) = str2num(get(handles.P36,'String'));
P0(4,1) = str2num(get(handles.P41,'String'));
P0(4,2) = str2num(get(handles.P42,'String'));
P0(4,3) = str2num(get(handles.P43,'String'));
P0(4,4) = str2num(get(handles.P44,'String'));
P0(4,5) = str2num(get(handles.P45,'String'));
P0(4,6) = str2num(get(handles.P46,'String'));
P0(5,1) = str2num(get(handles.P51,'String'));
P0(5,2) = str2num(get(handles.P52,'String'));
P0(5,3) = str2num(get(handles.P53,'String'));
P0(5,4) = str2num(get(handles.P54,'String'));
P0(5,5) = str2num(get(handles.P55,'String'));
P0(5,6) = str2num(get(handles.P56,'String'));
P0(6,1) = str2num(get(handles.P61,'String'));
P0(6,2) = str2num(get(handles.P62,'String'));
P0(6,3) = str2num(get(handles.P63,'String'));
P0(6,4) = str2num(get(handles.P64,'String'));
P0(6,5) = str2num(get(handles.P65,'String'));
P0(6,6) = str2num(get(handles.P66,'String'));




R(1,1) = str2num(get(handles.R_11,'String')) ;
R(1,2) = str2num(get(handles.R_12,'String'));
R(1,3) = str2num(get(handles.R_13,'String'));
R(2,1) = str2num(get(handles.R_21,'String'));
R(2,2) = str2num(get(handles.R_22,'String'));
R(2,3) = str2num(get(handles.R_23,'String'));
R(3,1) = str2num(get(handles.R_31,'String'));
R(3,2) = str2num(get(handles.R_32,'String'));
R(3,3) = str2num(get(handles.R_33,'String'));


Q(1,1) = str2num(get(handles.Q11,'String'));
Q(1,2) = str2num(get(handles.Q12,'String'));
Q(1,3) = str2num(get(handles.Q13,'String'));
Q(1,4) = str2num(get(handles.Q14,'String'));
Q(1,5) = str2num(get(handles.Q15,'String'));
Q(1,6) = str2num(get(handles.Q16,'String'));
Q(2,1) = str2num(get(handles.Q21,'String'));
Q(2,2) = str2num(get(handles.Q22,'String'));
Q(2,3) = str2num(get(handles.Q23,'String'));
Q(2,4) = str2num(get(handles.Q24,'String'));
Q(2,5) = str2num(get(handles.Q25,'String'));
Q(2,6) = str2num(get(handles.Q26,'String'));
Q(3,1) = str2num(get(handles.Q31,'String'));
Q(3,2) = str2num(get(handles.Q32,'String'));
Q(3,3) = str2num(get(handles.Q33,'String'));
Q(3,4) = str2num(get(handles.Q34,'String'));
Q(3,5) = str2num(get(handles.Q35,'String'));
Q(3,6) = str2num(get(handles.Q36,'String'));
Q(4,1) = str2num(get(handles.Q41,'String'));
Q(4,2) = str2num(get(handles.Q42,'String'));
Q(4,3) = str2num(get(handles.Q43,'String'));
Q(4,4) = str2num(get(handles.Q44,'String'));
Q(4,5) = str2num(get(handles.Q45,'String'));
Q(4,6) = str2num(get(handles.Q46,'String'));
Q(5,1) = str2num(get(handles.Q51,'String'));
Q(5,2) = str2num(get(handles.Q52,'String'));
Q(5,3) = str2num(get(handles.Q53,'String'));
Q(5,4) = str2num(get(handles.Q54,'String'));
Q(5,5) = str2num(get(handles.Q55,'String'));
Q(5,6) = str2num(get(handles.Q56,'String'));
Q(6,1) = str2num(get(handles.Q61,'String'));
Q(6,2) = str2num(get(handles.Q62,'String'));
Q(6,3) = str2num(get(handles.Q63,'String'));
Q(6,4) = str2num(get(handles.Q64,'String'));
Q(6,5) = str2num(get(handles.Q65,'String'));
Q(6,6) = str2num(get(handles.Q66,'String'));



x0
P0
R 
Q
kalm(start_loc, velocity, yamp, yperiod, zamp, zperiod, samplingtime, deltat, sigmaaz, sigmael, sigmarange, x0, P0, R, Q) ;





% --- Executes on button press in ResetMissileButton.
function ResetMissileButton_Callback(hObject, eventdata, handles)
% hObject    handle to ResetMissileButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


data.start_loc = [100000 ;0 ; 2000] ; % starting location
data.velocity = -150 ;              % velocity in x direction 
data.yamp = 500 ;                  % amplitude of y maneuvering
data.yperiod = 50 ;                % period of y maneuvering
data.zamp = 0 ;                     % amplitude of z maneuvering
data.zperiod = 0 ;                  % period of z maneuvering
data.samplingtime = 400 ;           % length of time sampled
data.deltat = .04 ;                 % time between samples
data.sigmaaz = 0.001 ;              % standard deviation of azimuth error in radians
data.sigmael = 0.0001 ;             % standard deviation of elevation error in radians
data.sigmarange = 12.5 ;              % standard deviation of range error in meters

% Kalman filtering information
data.x0 = [0; 0; 0 ; 0 ; 0; 0 ];    % initial state estimate
data.P0 = [100000 0 0 0 0 0 ;       % initial covariance estimate
      0    10000 0 0 0 0 ;
      0 0 1000000 0 0 0 ;
      0 0 0 10000 0 0 ;
      0 0 0 0 1000000 0 ;
      0 0 0 0 0 10000 ];
data.R =  diag([ 100 100 100]) ;    % measurement error covariance matrix
data.Q = diag([ 1 0.1 1 0.1 1 0.1]);% state error covariance matrix

set(handles.xstart, 'String', data.start_loc(1));
set(handles.ystart, 'String', data.start_loc(2));
set(handles.zstart, 'String', data.start_loc(3));
set(handles.velocity, 'String', data.velocity);
set(handles.y_amp, 'String', data.yamp);
set(handles.y_period, 'String', data.yperiod);
set(handles.z_amp, 'String', data.zamp);
set(handles.z_period, 'String', data.zperiod);
set(handles.sampletime, 'String', data.samplingtime);
set(handles.deltat, 'String', data.deltat);
set(handles.sigmaaz, 'String', data.sigmaaz);
set(handles.sigmael, 'String', data.sigmael);
set(handles.sigmarange, 'String', data.sigmarange);

set(handles.x0_1, 'String', num2str(data.x0(1)));
set(handles.x0_2, 'String', num2str(data.x0(2)));
set(handles.x0_3, 'String', num2str(data.x0(3)));
set(handles.x0_4, 'String', num2str(data.x0(4)));
set(handles.x0_5, 'String', num2str(data.x0(5)));
set(handles.x0_6, 'String', num2str(data.x0(6)));

set(handles.P11, 'String', num2str(data.P0(1,1)) );
set(handles.P12, 'String', num2str(data.P0(1,2)) );
set(handles.P13, 'String', num2str(data.P0(1,3)) );
set(handles.P14, 'String', num2str(data.P0(1,4)) );
set(handles.P15, 'String', num2str(data.P0(1,5)) );
set(handles.P16, 'String', num2str(data.P0(1,6)) );
set(handles.P21, 'String', num2str(data.P0(2,1)) );
set(handles.P22, 'String', num2str(data.P0(2,2)) );
set(handles.P23, 'String', num2str(data.P0(2,3)) );
set(handles.P24, 'String', num2str(data.P0(2,4)) );
set(handles.P25, 'String', num2str(data.P0(2,5)) );
set(handles.P26, 'String', num2str(data.P0(2,6)) );
set(handles.P31, 'String', num2str(data.P0(3,1)) );
set(handles.P32, 'String', num2str(data.P0(3,2)) );
set(handles.P33, 'String', num2str(data.P0(3,3)) );
set(handles.P34, 'String', num2str(data.P0(3,4)) );
set(handles.P35, 'String', num2str(data.P0(3,5)) );
set(handles.P36, 'String', num2str(data.P0(3,6)) );
set(handles.P41, 'String', num2str(data.P0(4,1)) );
set(handles.P42, 'String', num2str(data.P0(4,2)) );
set(handles.P43, 'String', num2str(data.P0(4,3)) );
set(handles.P44, 'String', num2str(data.P0(4,4)) );
set(handles.P45, 'String', num2str(data.P0(4,5)) );
set(handles.P46, 'String', num2str(data.P0(4,6)) );
set(handles.P51, 'String', num2str(data.P0(5,1)) );
set(handles.P52, 'String', num2str(data.P0(5,2)) );
set(handles.P53, 'String', num2str(data.P0(5,3)) );
set(handles.P54, 'String', num2str(data.P0(5,4)) );
set(handles.P55, 'String', num2str(data.P0(5,5)) );
set(handles.P56, 'String', num2str(data.P0(5,6)) );
set(handles.P61, 'String', num2str(data.P0(6,1)) );
set(handles.P62, 'String', num2str(data.P0(6,2)) );
set(handles.P63, 'String', num2str(data.P0(6,3)) );
set(handles.P64, 'String', num2str(data.P0(6,4)) );
set(handles.P65, 'String', num2str(data.P0(6,5)) );
set(handles.P66, 'String', num2str(data.P0(6,6)) );

set(handles.R_11, 'String', num2str(data.R(1,1)) );
set(handles.R_12, 'String', num2str(data.R(1,2)) );
set(handles.R_13, 'String', num2str(data.R(1,3)) );
set(handles.R_21, 'String', num2str(data.R(2,1)) );
set(handles.R_22, 'String', num2str(data.R(2,2)) );
set(handles.R_23, 'String', num2str(data.R(2,3)) );
set(handles.R_31, 'String', num2str(data.R(3,1)) );
set(handles.R_32, 'String', num2str(data.R(3,2)) );
set(handles.R_33, 'String', num2str(data.R(3,3)) );

set(handles.Q11, 'String', num2str(data.Q(1,1)) );
set(handles.Q12, 'String', num2str(data.Q(1,2)) );
set(handles.Q13, 'String', num2str(data.Q(1,3)) );
set(handles.Q14, 'String', num2str(data.Q(1,4)) );
set(handles.Q15, 'String', num2str(data.Q(1,5)) );
set(handles.Q16, 'String', num2str(data.Q(1,6)) );
set(handles.Q21, 'String', num2str(data.Q(2,1)) );
set(handles.Q22, 'String', num2str(data.Q(2,2)) );
set(handles.Q23, 'String', num2str(data.Q(2,3)) );
set(handles.Q24, 'String', num2str(data.Q(2,4)) );
set(handles.Q25, 'String', num2str(data.Q(2,5)) );
set(handles.Q26, 'String', num2str(data.Q(2,6)) );
set(handles.Q31, 'String', num2str(data.Q(3,1)) );
set(handles.Q32, 'String', num2str(data.Q(3,2)) );
set(handles.Q33, 'String', num2str(data.Q(3,3)) );
set(handles.Q34, 'String', num2str(data.Q(3,4)) );
set(handles.Q35, 'String', num2str(data.Q(3,5)) );
set(handles.Q36, 'String', num2str(data.Q(3,6)) );
set(handles.Q41, 'String', num2str(data.Q(4,1)) );
set(handles.Q42, 'String', num2str(data.Q(4,2)) );
set(handles.Q43, 'String', num2str(data.Q(4,3)) );
set(handles.Q44, 'String', num2str(data.Q(4,4)) );
set(handles.Q45, 'String', num2str(data.Q(4,5)) );
set(handles.Q46, 'String', num2str(data.Q(4,6)) );
set(handles.Q51, 'String', num2str(data.Q(5,1)) );
set(handles.Q52, 'String', num2str(data.Q(5,2)) );
set(handles.Q53, 'String', num2str(data.Q(5,3)) );
set(handles.Q54, 'String', num2str(data.Q(5,4)) );
set(handles.Q55, 'String', num2str(data.Q(5,5)) );
set(handles.Q56, 'String', num2str(data.Q(5,6)) );
set(handles.Q61, 'String', num2str(data.Q(6,1)) );
set(handles.Q62, 'String', num2str(data.Q(6,2)) );
set(handles.Q63, 'String', num2str(data.Q(6,3)) );
set(handles.Q64, 'String', num2str(data.Q(6,4)) );
set(handles.Q65, 'String', num2str(data.Q(6,5)) );
set(handles.Q66, 'String', num2str(data.Q(6,6)) );






% --- Executes on button press in ResetAirplaneButton.
function ResetAirplaneButton_Callback(hObject, eventdata, handles)
% hObject    handle to ResetAirplaneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


data.start_loc = [100000 ;0 ;7000] ; % starting location
data.velocity = -400 ;              % velocity in x direction 
data.yamp = 1000 ;                  % amplitude of y maneuvering
data.yperiod = 150 ;                % period of y maneuvering
data.zamp = 0 ;                     % amplitude of z maneuvering
data.zperiod = 0 ;                  % period of z maneuvering
data.samplingtime = 200 ;           % length of time sampled
data.deltat = .04 ;                 % time between samples
data.sigmaaz = 0.001 ;              % standard deviation of azimuth error in radians
data.sigmael = 0.0001 ;             % standard deviation of elevation error in radians
data.sigmarange = 12.5 ;              % standard deviation of range error in meters

% Kalman filtering information
data.x0 = [0; 0; 0 ; 0 ; 0; 0 ];    % initial state estimate
data.P0 = [100000 0 0 0 0 0 ;       % initial covariance estimate
      0    10000 0 0 0 0 ;
      0 0 1000000 0 0 0 ;
      0 0 0 10000 0 0 ;
      0 0 0 0 1000000 0 ;
      0 0 0 0 0 10000 ];
data.phi = [1 data.deltat 0 0 0 0 ; % state transition matrix 
     0 1 0 0 0 0 ;
     0 0 1 data.deltat 0 0 ;
     0 0 0 1 0 0 ;
     0 0 0 0 1 data.deltat ;
     0 0 0 0 0 1];
data.R =  diag([ 100 100 100]) ;    % measurement error covariance matrix
data.Q = diag([ 1 0.1 1 0.1 1 0.1]);% state error covariance matrix

set(handles.xstart, 'String', data.start_loc(1));
set(handles.ystart, 'String', data.start_loc(2));
set(handles.zstart, 'String', data.start_loc(3));
set(handles.velocity, 'String', data.velocity);
set(handles.y_amp, 'String', data.yamp);
set(handles.y_period, 'String', data.yperiod);
set(handles.z_amp, 'String', data.zamp);
set(handles.z_period, 'String', data.zperiod);
set(handles.sampletime, 'String', data.samplingtime);
set(handles.deltat, 'String', data.deltat);
set(handles.sigmaaz, 'String', data.sigmaaz);
set(handles.sigmael, 'String', data.sigmael);
set(handles.sigmarange, 'String', data.sigmarange);

set(handles.x0_1, 'String', num2str(data.x0(1)));
set(handles.x0_2, 'String', num2str(data.x0(2)));
set(handles.x0_3, 'String', num2str(data.x0(3)));
set(handles.x0_4, 'String', num2str(data.x0(4)));
set(handles.x0_5, 'String', num2str(data.x0(5)));
set(handles.x0_6, 'String', num2str(data.x0(6)));

set(handles.P11, 'String', num2str(data.P0(1,1)) );
set(handles.P12, 'String', num2str(data.P0(1,2)) );
set(handles.P13, 'String', num2str(data.P0(1,3)) );
set(handles.P14, 'String', num2str(data.P0(1,4)) );
set(handles.P15, 'String', num2str(data.P0(1,5)) );
set(handles.P16, 'String', num2str(data.P0(1,6)) );
set(handles.P21, 'String', num2str(data.P0(2,1)) );
set(handles.P22, 'String', num2str(data.P0(2,2)) );
set(handles.P23, 'String', num2str(data.P0(2,3)) );
set(handles.P24, 'String', num2str(data.P0(2,4)) );
set(handles.P25, 'String', num2str(data.P0(2,5)) );
set(handles.P26, 'String', num2str(data.P0(2,6)) );
set(handles.P31, 'String', num2str(data.P0(3,1)) );
set(handles.P32, 'String', num2str(data.P0(3,2)) );
set(handles.P33, 'String', num2str(data.P0(3,3)) );
set(handles.P34, 'String', num2str(data.P0(3,4)) );
set(handles.P35, 'String', num2str(data.P0(3,5)) );
set(handles.P36, 'String', num2str(data.P0(3,6)) );
set(handles.P41, 'String', num2str(data.P0(4,1)) );
set(handles.P42, 'String', num2str(data.P0(4,2)) );
set(handles.P43, 'String', num2str(data.P0(4,3)) );
set(handles.P44, 'String', num2str(data.P0(4,4)) );
set(handles.P45, 'String', num2str(data.P0(4,5)) );
set(handles.P46, 'String', num2str(data.P0(4,6)) );
set(handles.P51, 'String', num2str(data.P0(5,1)) );
set(handles.P52, 'String', num2str(data.P0(5,2)) );
set(handles.P53, 'String', num2str(data.P0(5,3)) );
set(handles.P54, 'String', num2str(data.P0(5,4)) );
set(handles.P55, 'String', num2str(data.P0(5,5)) );
set(handles.P56, 'String', num2str(data.P0(5,6)) );
set(handles.P61, 'String', num2str(data.P0(6,1)) );
set(handles.P62, 'String', num2str(data.P0(6,2)) );
set(handles.P63, 'String', num2str(data.P0(6,3)) );
set(handles.P64, 'String', num2str(data.P0(6,4)) );
set(handles.P65, 'String', num2str(data.P0(6,5)) );
set(handles.P66, 'String', num2str(data.P0(6,6)) );

set(handles.R_11, 'String', num2str(data.R(1,1)) );
set(handles.R_12, 'String', num2str(data.R(1,2)) );
set(handles.R_13, 'String', num2str(data.R(1,3)) );
set(handles.R_21, 'String', num2str(data.R(2,1)) );
set(handles.R_22, 'String', num2str(data.R(2,2)) );
set(handles.R_23, 'String', num2str(data.R(2,3)) );
set(handles.R_31, 'String', num2str(data.R(3,1)) );
set(handles.R_32, 'String', num2str(data.R(3,2)) );
set(handles.R_33, 'String', num2str(data.R(3,3)) );

set(handles.Q11, 'String', num2str(data.Q(1,1)) );
set(handles.Q12, 'String', num2str(data.Q(1,2)) );
set(handles.Q13, 'String', num2str(data.Q(1,3)) );
set(handles.Q14, 'String', num2str(data.Q(1,4)) );
set(handles.Q15, 'String', num2str(data.Q(1,5)) );
set(handles.Q16, 'String', num2str(data.Q(1,6)) );
set(handles.Q21, 'String', num2str(data.Q(2,1)) );
set(handles.Q22, 'String', num2str(data.Q(2,2)) );
set(handles.Q23, 'String', num2str(data.Q(2,3)) );
set(handles.Q24, 'String', num2str(data.Q(2,4)) );
set(handles.Q25, 'String', num2str(data.Q(2,5)) );
set(handles.Q26, 'String', num2str(data.Q(2,6)) );
set(handles.Q31, 'String', num2str(data.Q(3,1)) );
set(handles.Q32, 'String', num2str(data.Q(3,2)) );
set(handles.Q33, 'String', num2str(data.Q(3,3)) );
set(handles.Q34, 'String', num2str(data.Q(3,4)) );
set(handles.Q35, 'String', num2str(data.Q(3,5)) );
set(handles.Q36, 'String', num2str(data.Q(3,6)) );
set(handles.Q41, 'String', num2str(data.Q(4,1)) );
set(handles.Q42, 'String', num2str(data.Q(4,2)) );
set(handles.Q43, 'String', num2str(data.Q(4,3)) );
set(handles.Q44, 'String', num2str(data.Q(4,4)) );
set(handles.Q45, 'String', num2str(data.Q(4,5)) );
set(handles.Q46, 'String', num2str(data.Q(4,6)) );
set(handles.Q51, 'String', num2str(data.Q(5,1)) );
set(handles.Q52, 'String', num2str(data.Q(5,2)) );
set(handles.Q53, 'String', num2str(data.Q(5,3)) );
set(handles.Q54, 'String', num2str(data.Q(5,4)) );
set(handles.Q55, 'String', num2str(data.Q(5,5)) );
set(handles.Q56, 'String', num2str(data.Q(5,6)) );
set(handles.Q61, 'String', num2str(data.Q(6,1)) );
set(handles.Q62, 'String', num2str(data.Q(6,2)) );
set(handles.Q63, 'String', num2str(data.Q(6,3)) );
set(handles.Q64, 'String', num2str(data.Q(6,4)) );
set(handles.Q65, 'String', num2str(data.Q(6,5)) );
set(handles.Q66, 'String', num2str(data.Q(6,6)) );





% --- Executes on button press in ExitButton.
function ExitButton_Callback(hObject, eventdata, handles)
% hObject    handle to ExitButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% --- Executes during object creation, after setting all properties.
function R_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function R_11_Callback(hObject, eventdata, handles)
% hObject    handle to R_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_11 as text
%        str2double(get(hObject,'String')) returns contents of R_11 as a double
temp = str2double(get(hObject, 'String'));
if isnan(temp)
   set(hObject, 'String', 0);
   errordlg('Input must be a number','Error');
end








% --- Executes during object creation, after setting all properties.
function R_12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function R_12_Callback(hObject, eventdata, handles)
% hObject    handle to R_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_12 as text
%        str2double(get(hObject,'String')) returns contents of R_12 as a double







% --- Executes during object creation, after setting all properties.
function R_13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function R_13_Callback(hObject, eventdata, handles)
% hObject    handle to R_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_13 as text
%        str2double(get(hObject,'String')) returns contents of R_13 as a double









% --- Executes during object creation, after setting all properties.
function R_21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function R_21_Callback(hObject, eventdata, handles)
% hObject    handle to R_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_21 as text
%        str2double(get(hObject,'String')) returns contents of R_21 as a double









% --- Executes during object creation, after setting all properties.
function R_22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function R_22_Callback(hObject, eventdata, handles)
% hObject    handle to R_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_22 as text
%        str2double(get(hObject,'String')) returns contents of R_22 as a double






% --- Executes during object creation, after setting all properties.
function R_23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function R_23_Callback(hObject, eventdata, handles)
% hObject    handle to R_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_23 as text
%        str2double(get(hObject,'String')) returns contents of R_23 as a double






% --- Executes during object creation, after setting all properties.
function R_31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function R_31_Callback(hObject, eventdata, handles)
% hObject    handle to R_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_31 as text
%        str2double(get(hObject,'String')) returns contents of R_31 as a double






% --- Executes during object creation, after setting all properties.
function R_32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function R_32_Callback(hObject, eventdata, handles)
% hObject    handle to R_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_32 as text
%        str2double(get(hObject,'String')) returns contents of R_32 as a double







% --- Executes during object creation, after setting all properties.
function R_33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function R_33_Callback(hObject, eventdata, handles)
% hObject    handle to R_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_33 as text
%        str2double(get(hObject,'String')) returns contents of R_33 as a double
















% --- Executes during object creation, after setting all properties.
function P11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P11_Callback(hObject, eventdata, handles)
% hObject    handle to P11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P11 as text
%        str2double(get(hObject,'String')) returns contents of P11 as a double







% --- Executes during object creation, after setting all properties.
function P12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P12_Callback(hObject, eventdata, handles)
% hObject    handle to P12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P12 as text
%        str2double(get(hObject,'String')) returns contents of P12 as a double








% --- Executes during object creation, after setting all properties.
function P13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function P13_Callback(hObject, eventdata, handles)
% hObject    handle to P13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P13 as text
%        str2double(get(hObject,'String')) returns contents of P13 as a double




% --- Executes during object creation, after setting all properties.
function P14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P14_Callback(hObject, eventdata, handles)
% hObject    handle to P14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P14 as text
%        str2double(get(hObject,'String')) returns contents of P14 as a double







% --- Executes during object creation, after setting all properties.
function P15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P15_Callback(hObject, eventdata, handles)
% hObject    handle to P15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P15 as text
%        str2double(get(hObject,'String')) returns contents of P15 as a double






% --- Executes during object creation, after setting all properties.
function P16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P16_Callback(hObject, eventdata, handles)
% hObject    handle to P16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P16 as text
%        str2double(get(hObject,'String')) returns contents of P16 as a double













% --- Executes during object creation, after setting all properties.
function P21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P21_Callback(hObject, eventdata, handles)
% hObject    handle to P21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P21 as text
%        str2double(get(hObject,'String')) returns contents of P21 as a double






% --- Executes during object creation, after setting all properties.
function P22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function P22_Callback(hObject, eventdata, handles)
% hObject    handle to P22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P22 as text
%        str2double(get(hObject,'String')) returns contents of P22 as a double





% --- Executes during object creation, after setting all properties.
function P23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P23_Callback(hObject, eventdata, handles)
% hObject    handle to P23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P23 as text
%        str2double(get(hObject,'String')) returns contents of P23 as a double









% --- Executes during object creation, after setting all properties.
function P24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P24_Callback(hObject, eventdata, handles)
% hObject    handle to P24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P24 as text
%        str2double(get(hObject,'String')) returns contents of P24 as a double








% --- Executes during object creation, after setting all properties.
function P25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P25_Callback(hObject, eventdata, handles)
% hObject    handle to P25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P25 as text
%        str2double(get(hObject,'String')) returns contents of P25 as a double








% --- Executes during object creation, after setting all properties.
function P26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P26_Callback(hObject, eventdata, handles)
% hObject    handle to P26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P26 as text
%        str2double(get(hObject,'String')) returns contents of P26 as a double







% --- Executes during object creation, after setting all properties.
function P31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function P31_Callback(hObject, eventdata, handles)
% hObject    handle to P31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P31 as text
%        str2double(get(hObject,'String')) returns contents of P31 as a double






% --- Executes during object creation, after setting all properties.
function P32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function P32_Callback(hObject, eventdata, handles)
% hObject    handle to P32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P32 as text
%        str2double(get(hObject,'String')) returns contents of P32 as a double






% --- Executes during object creation, after setting all properties.
function P33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P33_Callback(hObject, eventdata, handles)
% hObject    handle to P33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P33 as text
%        str2double(get(hObject,'String')) returns contents of P33 as a double






% --- Executes during object creation, after setting all properties.
function P34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P34_Callback(hObject, eventdata, handles)
% hObject    handle to P34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P34 as text
%        str2double(get(hObject,'String')) returns contents of P34 as a double






% --- Executes during object creation, after setting all properties.
function P35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P35_Callback(hObject, eventdata, handles)
% hObject    handle to P35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P35 as text
%        str2double(get(hObject,'String')) returns contents of P35 as a double





% --- Executes during object creation, after setting all properties.
function P36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P36_Callback(hObject, eventdata, handles)
% hObject    handle to P36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P36 as text
%        str2double(get(hObject,'String')) returns contents of P36 as a double






% --- Executes during object creation, after setting all properties.
function P41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P41_Callback(hObject, eventdata, handles)
% hObject    handle to P41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P41 as text
%        str2double(get(hObject,'String')) returns contents of P41 as a double






% --- Executes during object creation, after setting all properties.
function P42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P42_Callback(hObject, eventdata, handles)
% hObject    handle to P42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P42 as text
%        str2double(get(hObject,'String')) returns contents of P42 as a double






% --- Executes during object creation, after setting all properties.
function P43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P43_Callback(hObject, eventdata, handles)
% hObject    handle to P43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P43 as text
%        str2double(get(hObject,'String')) returns contents of P43 as a double




% --- Executes during object creation, after setting all properties.
function P44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function P44_Callback(hObject, eventdata, handles)
% hObject    handle to P44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P44 as text
%        str2double(get(hObject,'String')) returns contents of P44 as a double







% --- Executes during object creation, after setting all properties.
function P45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P45_Callback(hObject, eventdata, handles)
% hObject    handle to P45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P45 as text
%        str2double(get(hObject,'String')) returns contents of P45 as a double







% --- Executes during object creation, after setting all properties.
function P46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P46_Callback(hObject, eventdata, handles)
% hObject    handle to P46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P46 as text
%        str2double(get(hObject,'String')) returns contents of P46 as a double







% --- Executes during object creation, after setting all properties.
function P51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P51_Callback(hObject, eventdata, handles)
% hObject    handle to P51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P51 as text
%        str2double(get(hObject,'String')) returns contents of P51 as a double







% --- Executes during object creation, after setting all properties.
function P52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P52_Callback(hObject, eventdata, handles)
% hObject    handle to P52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P52 as text
%        str2double(get(hObject,'String')) returns contents of P52 as a double






% --- Executes during object creation, after setting all properties.
function P53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P53_Callback(hObject, eventdata, handles)
% hObject    handle to P53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P53 as text
%        str2double(get(hObject,'String')) returns contents of P53 as a double





% --- Executes during object creation, after setting all properties.
function P54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P54_Callback(hObject, eventdata, handles)
% hObject    handle to P54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P54 as text
%        str2double(get(hObject,'String')) returns contents of P54 as a double







% --- Executes during object creation, after setting all properties.
function P55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P55_Callback(hObject, eventdata, handles)
% hObject    handle to P55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P55 as text
%        str2double(get(hObject,'String')) returns contents of P55 as a double






% --- Executes during object creation, after setting all properties.
function P56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P56_Callback(hObject, eventdata, handles)
% hObject    handle to P56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P56 as text
%        str2double(get(hObject,'String')) returns contents of P56 as a double








% --- Executes during object creation, after setting all properties.
function P61_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P61_Callback(hObject, eventdata, handles)
% hObject    handle to P61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P61 as text
%        str2double(get(hObject,'String')) returns contents of P61 as a double




% --- Executes during object creation, after setting all properties.
function P62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P62_Callback(hObject, eventdata, handles)
% hObject    handle to P62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P62 as text
%        str2double(get(hObject,'String')) returns contents of P62 as a double







% --- Executes during object creation, after setting all properties.
function P63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P63_Callback(hObject, eventdata, handles)
% hObject    handle to P63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P63 as text
%        str2double(get(hObject,'String')) returns contents of P63 as a double






% --- Executes during object creation, after setting all properties.
function P64_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P64_Callback(hObject, eventdata, handles)
% hObject    handle to P64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P64 as text
%        str2double(get(hObject,'String')) returns contents of P64 as a double






% --- Executes during object creation, after setting all properties.
function P65_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function P65_Callback(hObject, eventdata, handles)
% hObject    handle to P65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P65 as text
%        str2double(get(hObject,'String')) returns contents of P65 as a double






% --- Executes during object creation, after setting all properties.
function P66_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function P66_Callback(hObject, eventdata, handles)
% hObject    handle to P66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P66 as text
%        str2double(get(hObject,'String')) returns contents of P66 as a double
























% --- Executes during object creation, after setting all properties.
function Q11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Q11_Callback(hObject, eventdata, handles)
% hObject    handle to Q11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q11 as text
%        str2double(get(hObject,'String')) returns contents of Q11 as a double









% --- Executes during object creation, after setting all properties.
function Q12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q12_Callback(hObject, eventdata, handles)
% hObject    handle to Q12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q12 as text
%        str2double(get(hObject,'String')) returns contents of Q12 as a double










% --- Executes during object creation, after setting all properties.
function Q13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q13_Callback(hObject, eventdata, handles)
% hObject    handle to Q13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q13 as text
%        str2double(get(hObject,'String')) returns contents of Q13 as a double





% --- Executes during object creation, after setting all properties.
function Q14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Q14_Callback(hObject, eventdata, handles)
% hObject    handle to Q14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q14 as text
%        str2double(get(hObject,'String')) returns contents of Q14 as a double






% --- Executes during object creation, after setting all properties.
function Q15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q15_Callback(hObject, eventdata, handles)
% hObject    handle to Q15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q15 as text
%        str2double(get(hObject,'String')) returns contents of Q15 as a double









% --- Executes during object creation, after setting all properties.
function Q16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q16_Callback(hObject, eventdata, handles)
% hObject    handle to Q16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q16 as text
%        str2double(get(hObject,'String')) returns contents of Q16 as a double








% --- Executes during object creation, after setting all properties.
function Q21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q21_Callback(hObject, eventdata, handles)
% hObject    handle to Q21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q21 as text
%        str2double(get(hObject,'String')) returns contents of Q21 as a double






% --- Executes during object creation, after setting all properties.
function Q22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q22_Callback(hObject, eventdata, handles)
% hObject    handle to Q22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q22 as text
%        str2double(get(hObject,'String')) returns contents of Q22 as a double








% --- Executes during object creation, after setting all properties.
function Q23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q23_Callback(hObject, eventdata, handles)
% hObject    handle to Q23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q23 as text
%        str2double(get(hObject,'String')) returns contents of Q23 as a double








% --- Executes during object creation, after setting all properties.
function Q24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q24_Callback(hObject, eventdata, handles)
% hObject    handle to Q24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q24 as text
%        str2double(get(hObject,'String')) returns contents of Q24 as a double







% --- Executes during object creation, after setting all properties.
function Q25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q25_Callback(hObject, eventdata, handles)
% hObject    handle to Q25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q25 as text
%        str2double(get(hObject,'String')) returns contents of Q25 as a double










% --- Executes during object creation, after setting all properties.
function Q26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q26_Callback(hObject, eventdata, handles)
% hObject    handle to Q26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q26 as text
%        str2double(get(hObject,'String')) returns contents of Q26 as a double







% --- Executes during object creation, after setting all properties.
function Q31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q31_Callback(hObject, eventdata, handles)
% hObject    handle to Q31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q31 as text
%        str2double(get(hObject,'String')) returns contents of Q31 as a double






% --- Executes during object creation, after setting all properties.
function Q32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q32_Callback(hObject, eventdata, handles)
% hObject    handle to Q32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q32 as text
%        str2double(get(hObject,'String')) returns contents of Q32 as a double





% --- Executes during object creation, after setting all properties.
function Q33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q33_Callback(hObject, eventdata, handles)
% hObject    handle to Q33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q33 as text
%        str2double(get(hObject,'String')) returns contents of Q33 as a double










% --- Executes during object creation, after setting all properties.
function Q34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q34_Callback(hObject, eventdata, handles)
% hObject    handle to Q34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q34 as text
%        str2double(get(hObject,'String')) returns contents of Q34 as a double







% --- Executes during object creation, after setting all properties.
function Q35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q35_Callback(hObject, eventdata, handles)
% hObject    handle to Q35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q35 as text
%        str2double(get(hObject,'String')) returns contents of Q35 as a double






% --- Executes during object creation, after setting all properties.
function Q36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q36_Callback(hObject, eventdata, handles)
% hObject    handle to Q36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q36 as text
%        str2double(get(hObject,'String')) returns contents of Q36 as a double








% --- Executes during object creation, after setting all properties.
function Q41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q41_Callback(hObject, eventdata, handles)
% hObject    handle to Q41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q41 as text
%        str2double(get(hObject,'String')) returns contents of Q41 as a double









% --- Executes during object creation, after setting all properties.
function Q42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q42_Callback(hObject, eventdata, handles)
% hObject    handle to Q42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q42 as text
%        str2double(get(hObject,'String')) returns contents of Q42 as a double











% --- Executes during object creation, after setting all properties.
function Q43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q43_Callback(hObject, eventdata, handles)
% hObject    handle to Q43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q43 as text
%        str2double(get(hObject,'String')) returns contents of Q43 as a double







% --- Executes during object creation, after setting all properties.
function Q44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q44_Callback(hObject, eventdata, handles)
% hObject    handle to Q44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q44 as text
%        str2double(get(hObject,'String')) returns contents of Q44 as a double








% --- Executes during object creation, after setting all properties.
function Q45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q45_Callback(hObject, eventdata, handles)
% hObject    handle to Q45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q45 as text
%        str2double(get(hObject,'String')) returns contents of Q45 as a double







% --- Executes during object creation, after setting all properties.
function Q46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q46_Callback(hObject, eventdata, handles)
% hObject    handle to Q46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q46 as text
%        str2double(get(hObject,'String')) returns contents of Q46 as a double










% --- Executes during object creation, after setting all properties.
function Q51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q51_Callback(hObject, eventdata, handles)
% hObject    handle to Q51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q51 as text
%        str2double(get(hObject,'String')) returns contents of Q51 as a double








% --- Executes during object creation, after setting all properties.
function Q52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q52_Callback(hObject, eventdata, handles)
% hObject    handle to Q52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q52 as text
%        str2double(get(hObject,'String')) returns contents of Q52 as a double






% --- Executes during object creation, after setting all properties.
function Q53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q53_Callback(hObject, eventdata, handles)
% hObject    handle to Q53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q53 as text
%        str2double(get(hObject,'String')) returns contents of Q53 as a double






% --- Executes during object creation, after setting all properties.
function Q54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q54_Callback(hObject, eventdata, handles)
% hObject    handle to Q54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q54 as text
%        str2double(get(hObject,'String')) returns contents of Q54 as a double







% --- Executes during object creation, after setting all properties.
function Q55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q55_Callback(hObject, eventdata, handles)
% hObject    handle to Q55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q55 as text
%        str2double(get(hObject,'String')) returns contents of Q55 as a double








% --- Executes during object creation, after setting all properties.
function Q56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Q56_Callback(hObject, eventdata, handles)
% hObject    handle to Q56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q56 as text
%        str2double(get(hObject,'String')) returns contents of Q56 as a double








% --- Executes during object creation, after setting all properties.
function Q61_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Q61_Callback(hObject, eventdata, handles)
% hObject    handle to Q61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q61 as text
%        str2double(get(hObject,'String')) returns contents of Q61 as a double






% --- Executes during object creation, after setting all properties.
function Q62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Q62_Callback(hObject, eventdata, handles)
% hObject    handle to Q62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q62 as text
%        str2double(get(hObject,'String')) returns contents of Q62 as a double








% --- Executes during object creation, after setting all properties.
function Q63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q63_Callback(hObject, eventdata, handles)
% hObject    handle to Q63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q63 as text
%        str2double(get(hObject,'String')) returns contents of Q63 as a double



% --- Executes during object creation, after setting all properties.
function Q64_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q64_Callback(hObject, eventdata, handles)
% hObject    handle to Q64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q64 as text
%        str2double(get(hObject,'String')) returns contents of Q64 as a double






% --- Executes during object creation, after setting all properties.
function Q65_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Q65_Callback(hObject, eventdata, handles)
% hObject    handle to Q65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q65 as text
%        str2double(get(hObject,'String')) returns contents of Q65 as a double





% --- Executes during object creation, after setting all properties.
function Q66_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Q66_Callback(hObject, eventdata, handles)
% hObject    handle to Q66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q66 as text
%        str2double(get(hObject,'String')) returns contents of Q66 as a double

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



