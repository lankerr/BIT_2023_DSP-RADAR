function varargout = array(varargin)
% ARRAY M-file for array.fig
%      ARRAY, by itself, creates a new ARRAY or raises the existing
%      singleton*.
%
%      H = ARRAY returns the handle to a new ARRAY or the handle to
%      the existing singleton*.
%
%      ARRAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARRAY.M with the given input arguments.
%
%      ARRAY('Property','Value',...) creates a new ARRAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before array_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to array_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help array

% Last Modified by GUIDE v2.5 13-Jun-2003 14:44:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @array_OpeningFcn, ...
                   'gui_OutputFcn',  @array_OutputFcn, ...
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


% --- Executes just before array is made visible.
function array_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to array (see VARARGIN)

% Choose default command line output for array
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes array wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = array_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% initialization values
data.Nx = 51 ;
data.Ny = 21 ;
data.Ncirc = 51 ;
data.dolxr = 0.5 ;
data.dolyr = 0.5 ;
data.theta0 = 20 ;
data.phi0 = 30 ;
data.nbits = -1 ;
data.winchoice = 1 ; % 1=none, 2=Hamming, 3=Hanning, 4=Kaiser, 5=Blackman
data.arraychoice = 1 ; % 1=rectangular, 2=circular, 3 = triangular


set(handles.Nx,'String', num2str(51)) ;
set(handles.Ny,'String', num2str(21)) ;
set(handles.Ncirc,'String', num2str(51)) ;
set(handles.dolxr,'String', num2str(0.5)) ;
set(handles.dolyr,'String', num2str(0.5)) ;
set(handles.theta0,'String', num2str(20)) ;
set(handles.phi0,'String',num2str(30)) ;
set(handles.nbits,'String',num2str(-1)) ;

set(handles.Nx,'Enable','on');        
set(handles.Ny, 'Enable','on') ;
set(handles.Ncirc,'Enable','off');
      


% --- Executes during object creation, after setting all properties.
function Nx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
   set(hObject,'BackgroundColor','white');
else
   set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Nx_Callback(hObject, eventdata, handles)
% hObject    handle to Nx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nx as text
%        str2double(get(hObject,'String')) returns contents of Nx as a double







% --- Executes during object creation, after setting all properties.
function Ny_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
   set(hObject,'BackgroundColor','white');
else
   set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Ny_Callback(hObject, eventdata, handles)
% hObject    handle to Ny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ny as text
%        str2double(get(hObject,'String')) returns contents of Ny as a double











% --- Executes during object creation, after setting all properties.
function Ncirc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ncirc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Ncirc_Callback(hObject, eventdata, handles)
% hObject    handle to Ncirc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ncirc as text
%        str2double(get(hObject,'String')) returns contents of Ncirc as a double










% --- Executes during object creation, after setting all properties.
function dolxr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dolxr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
   set(hObject,'BackgroundColor','white');
else
   set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dolxr_Callback(hObject, eventdata, handles)
% hObject    handle to dolxr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dolxr as text
%        str2double(get(hObject,'String')) returns contents of dolxr as a double


















% --- Executes during object creation, after setting all properties.
function dolyr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dolyr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
   set(hObject,'BackgroundColor','white');
else
   set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dolyr_Callback(hObject, eventdata, handles)
% hObject    handle to dolyr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dolyr as text
%        str2double(get(hObject,'String')) returns contents of dolyr as a double




















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


















% --- Executes during object creation, after setting all properties.
function phi0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phi0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function phi0_Callback(hObject, eventdata, handles)
% hObject    handle to phi0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phi0 as text
%        str2double(get(hObject,'String')) returns contents of phi0 as a double















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












% --- Executes on button press in PlotButton.
function PlotButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Nx = str2num(get(handles.Nx, 'String')) ;
Ny = str2num(get(handles.Ny, 'String')) ;
Ncirc = str2num(get(handles.Ncirc, 'String')) ;
dolxr = str2num(get(handles.dolxr, 'String')) ;
dolyr = str2num(get(handles.dolyr, 'String')) ;
theta0 = str2num(get(handles.theta0, 'String')) ;
phi0 = str2num(get(handles.phi0, 'String')) ;
nbits = str2num(get(handles.nbits, 'String')) ;



win_type = get(handles.winlist,'Value') ;
switch win_type
   case 1 
       win = ones(Nx,1)*ones(Ny,1)';
   case 2
       win = hamming(Nx)*hamming(Ny)' ;
   case 3
       win = hanning(Nx)*hanning(Ny)' ;
   case 4
        win = kaiser(Nx,pi)*kaiser(Ny,pi)' ;
   case 5
      win = blackman(Nx)*blackman(Ny)' ;
end       


win_type = get(handles.winlist,'Value') ;
switch win_type
   case 1 
       wincirc = ones(Ncirc,1)*ones(Ncirc,1)';
   case 2
       wincirc = hamming(Ncirc)*hamming(Ncirc)' ;
   case 3
       wincirc = hanning(Ncirc)*hanning(Ncirc)' ;
   case 4
      wincirc = kaiser(Ncirc,pi)*kaiser(Ncirc,pi)' ;
   case 5
      wincirc = blackman(Ncirc)*blackman(Ncirc)' ;
end      



array_type = get(handles.arraylist,'Value') ;
switch array_type
   case 1
      [pattern] = rect_array(Nx, Ny, dolxr, dolyr, theta0, phi0, 1, win, nbits);
   case 2
      [pattern,amn] = circ_array(Ncirc, dolxr, dolyr , theta0, phi0 , 1 ,wincirc, nbits);      
end




% --- Executes on button press in ExitButton.
function ExitButton_Callback(hObject, eventdata, handles)
% hObject    handle to ExitButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
clear all







% --- Executes during object creation, after setting all properties.
function winlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to winlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
   set(hObject,'BackgroundColor','white');
else
   set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in winlist.
function winlist_Callback(hObject, eventdata, handles)
% hObject    handle to winlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns winlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from winlist









% --- Executes during object creation, after setting all properties.
function arraylist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to arraylist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
   set(hObject,'BackgroundColor','white');
else
   set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on selection change in arraylist.
function arraylist_Callback(hObject, eventdata, handles)
% hObject    handle to arraylist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns arraylist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from arraylist

array_type = get(handles.arraylist,'Value') ;
switch array_type
   case 1  % rectangular
      set(handles.Nx,'Enable','on');        
      set(handles.Ny, 'Enable','on') ;
      set(handles.Ncirc,'Enable','off');
      
  case 2  % circular      
      set(handles.Nx,'Enable','off');        
      set(handles.Ny, 'Enable','off') ;
      set(handles.Ncirc,'Enable','on');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%