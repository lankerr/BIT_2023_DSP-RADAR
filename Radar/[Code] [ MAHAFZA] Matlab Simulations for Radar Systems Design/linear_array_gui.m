function varargout = linear_array_gui(varargin)
% LINEAR_ARRAY_GUI M-file for linear_array_gui.fig
%      LINEAR_ARRAY_GUI, by itself, creates a new LINEAR_ARRAY_GUI or raises the existing
%      singleton*.
%
%      H = LINEAR_ARRAY_GUI returns the handle to a new LINEAR_ARRAY_GUI or the handle to
%      the existing singleton*.
%
%      LINEAR_ARRAY_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINEAR_ARRAY_GUI.M with the given input arguments.
%
%      LINEAR_ARRAY_GUI('Property','Value',...) creates a new LINEAR_ARRAY_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before linear_array_gui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to linear_array_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help linear_array_gui

% Last Modified by GUIDE v2.5 09-Jun-2003 15:16:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @linear_array_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @linear_array_gui_OutputFcn, ...
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


global Nr  dolr theta0 nbits

% --- Executes just before linear_array_gui is made visible.
function linear_array_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to linear_array_gui (see VARARGIN)

% Choose default command line output for linear_array_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes linear_array_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = linear_array_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;









% --- Executes during object creation, after setting all properties.
function InitializeToggleButton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InitializeToggleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','black');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function InitializeToggleButton_Callback(hObject, eventdata, handles)
% hObject    handle to InitializeToggleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InitializeToggleButton as text
%        str2double(get(hObject,'String')) returns contents of InitializeToggleButton as a double
'InitializeToggleButton_Callback'
set(handles.Nr,'String', num2str(25))
set(handles.dolr,'String',num2str(0.5))
set(handles.theta0,'String',num2str(0))
set(handles.nbits,'String',num2str(-1))







% --- Executes during object creation, after setting all properties.
function PlotToggleButton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlotToggleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','black');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function PlotToggleButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlotToggleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlotToggleButton as text
%        str2double(get(hObject,'String')) returns contents of PlotToggleButton as a double

'PlotToggleButton_Callback'
Nr = str2num(get(handles.Nr, 'String'))
dolr = str2num(get(handles.dolr, 'String'))
theta0 = str2num(get(handles.theta0, 'String'))
nbits = str2num(get(handles.nbits, 'String'))
winid = 1
win_type = get(handles.WindowChoice,'Value')
switch win_type
   case 1 
       win = ones(Nr,1);
   case 2
       win = hamming(Nr) ;
   case 3
       win = hanning(Nr) ;
   case 4
        win = kaiser(Nr,pi) ;
   case 5
       win = blackman(Nr) ;
end       
[theta,patternr,patterng] = linear_array(Nr,dolr,theta0,winid,win,nbits);
figure(1)
plot(theta,patterng,'k')
grid
xlabel('Steering angle - degrees')
ylabel('Gain pattern - dB')
axis tight



% --- Executes during object creation, after setting all properties.
function QuitToggleButton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QuitToggleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','black');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function QuitToggleButton_Callback(hObject, eventdata, handles)
% hObject    handle to QuitToggleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QuitToggleButton as text
%        str2double(get(hObject,'String')) returns contents of QuitToggleButton as a double
'QuitToggleButton_Callback'
close all
clear all





% --- Executes during object creation, after setting all properties.
function Nr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Nr_Callback(hObject, eventdata, handles)
% hObject    handle to Nr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nr as text
%        str2double(get(hObject,'String')) returns contents of Nr as a double
Nr = str2double(get(hObject,'String'))
set(handles.Nr,'Value',Nr)






% --- Executes during object creation, after setting all properties.
function dolr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dolr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dolr_Callback(hObject, eventdata, handles)
% hObject    handle to dolr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dolr as text
%        str2double(get(hObject,'String')) returns contents of dolr as a double
dolr = str2double(get(hObject,'String'))








% --- Executes during object creation, after setting all properties.
function theta0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function theta0_Callback(hObject, eventdata, handles)
% hObject    handle to theta0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta0 as text
%        str2double(get(hObject,'String')) returns contents of theta0 as a double
theta0 = str2double(get(hObject,'String'))






% --- Executes during object creation, after setting all properties.
function nbits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nbits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function nbits_Callback(hObject, eventdata, handles)
% hObject    handle to nbits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nbits as text
%        str2double(get(hObject,'String')) returns contents of nbits as a double
nbits = str2double(get(hObject,'String'))






% --- Executes during object creation, after setting all properties.
function WindowChoice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindowChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
'WindowChoice_CreateFcn'

% --- Executes on selection change in WindowChoice.
function WindowChoice_Callback(hObject, eventdata, handles)
% hObject    handle to WindowChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns WindowChoice contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WindowChoice
'WindowChoice_Callback'
get(handles.WindowChoice,'Value')
