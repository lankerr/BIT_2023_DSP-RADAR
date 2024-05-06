function varargout = Capped_Wedge_GUI(varargin)

% CAPPED_WEDGE M-file for Capped_Wedge.fig
%      CAPPED_WEDGE, by itself, creates a new CAPPED_WEDGE or raises the existing
%      singleton*.
%
%      H = CAPPED_WEDGE returns the handle to a new CAPPED_WEDGE or the handle to
%      the existing singleton*.
%
%      CAPPED_WEDGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAPPED_WEDGE.M with the given input arguments.
%
%      CAPPED_WEDGE('Property','Value',...) creates a new CAPPED_WEDGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Capped_Wedge_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Capped_Wedge_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Capped_Wedge

% Last Modified by GUIDE v2.5 24-Jul-2003 21:26:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Capped_Wedge_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @Capped_Wedge_GUI_OutputFcn, ...
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

% --- Executes just before Capped_Wedge is made visible.
function Capped_Wedge_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Capped_Wedge (see VARARGIN)

% Choose default command line output for Capped_Wedge
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

if strcmp(get(hObject,'Visible'),'off')
    initialize_gui(hObject, handles);
end

% UIWAIT makes Capped_Wedge wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Capped_Wedge_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function density_CreateFcn(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
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



function density_Callback(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of density as text
%        str2double(get(hObject,'String')) returns contents of density as a double
density = str2double(get(hObject, 'String'));
if isnan(density)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.density = density;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function volume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
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



function volume_Callback(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of volume as text
%        str2double(get(hObject,'String')) returns contents of volume as a double
volume = str2double(get(hObject, 'String'));
if isnan(volume)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.volume = volume;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function mass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mass (see GCBO)
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


function mass_Callback(hObject, eventdata, handles)
% hObject    handle to mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mass as text
%        str2double(get(hObject,'String')) returns contents of mass as a double


% --- Executes on button press in english.
function english_Callback(hObject, eventdata, handles)
% hObject    handle to english (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of english

h2=gcf;
engll = get(findobj(h2,'Tag','english'),'Value');
if engll == 1
    SourceType = 'Line Source';       % Soutce Type 'Line Source' or 'Plane Wave' 
    set(findobj(h2,'Tag','si'),'value',0);
end


% --- Executes on button press in si.
function si_Callback(hObject, eventdata, handles)
% hObject    handle to si (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of si

h2=gcf;
engl = get(findobj(h2,'Tag','si'),'Value');
if engl == 1
    SourceType = 'Plane Wave';       % Soutce Type 'Line Source' or 'Plane Wave' 
    set(findobj(h2,'Tag','english'),'value',0);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getappdata(gcbf, 'metricdata');

mass = data.density * data.volume;
set(handles.mass, 'String', mass);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles);



function initialize_gui(fig_handle, handles)



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3

h2=gcf;
rb3value = get(findobj(h2,'Tag','radiobutton3'),'Value');
if rb3value == 1
    CapType = get(findobj(h2,'Tag','radiobutton3'),'String');
    set(findobj(h2,'Tag','radiobutton4'),'value',0);
    set(findobj(h2,'Tag','radiobutton5'),'value',0);
end

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4

h2=gcf;
rb3value = get(findobj(h2,'Tag','radiobutton4'),'Value');
if rb3value == 1
    CapType = get(findobj(h2,'Tag','radiobutton4'),'String');
    set(findobj(h2,'Tag','radiobutton3'),'value',0);
    set(findobj(h2,'Tag','radiobutton5'),'value',0);
end


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5

h2=gcf;
rb3value = get(findobj(h2,'Tag','radiobutton5'),'Value');
if rb3value == 1
    CapType = get(findobj(h2,'Tag','radiobutton5'),'String');
    set(findobj(h2,'Tag','radiobutton3'),'value',0);
    set(findobj(h2,'Tag','radiobutton4'),'value',0);
end

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes on button press in Plot_Button.
function Plot_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% close (figure(1));   close (figure(2));
% close (figure(3));   close (figure(4));
% close (figure(5));   close (figure(6));
% close (figure(7));   close (figure(8));

img = sqrt(-1);
rtd = 180/pi;   dtr = pi/180;
mu0 = 4*pi*1e-7;                % Permeability of free space      
eps0 = 8.854e-12;               % Permittivity of free space 


%  =====   Input parameters   =====
%alphad = 30;                    % above x Wedge angle
h2=gcf;

set(handles.figure1,'WindowStyle','normal')

alphad = str2num(get(findobj(h2,'Tag','edit5'),'String'));
betad = str2num(get(findobj(h2,'Tag','edit6'),'String'));
ar = str2num(get(findobj(h2,'Tag','edit8'),'String'));
rhop = str2num(get(findobj(h2,'Tag','edit9'),'String'));
phipd = str2num(get(findobj(h2,'Tag','edit10'),'String'));
freq = str2num(get(findobj(h2,'Tag','edit11'),'String'));
epsr = str2num(get(findobj(h2,'Tag','edit12'),'String'));
mur = str2num(get(findobj(h2,'Tag','edit13'),'String'));
Ie = str2num(get(findobj(h2,'Tag','edit14'),'String'));
ax = str2num(get(findobj(h2,'Tag','edit15'),'String'));
by = str2num(get(findobj(h2,'Tag','edit16'),'String'));
nx = str2num(get(findobj(h2,'Tag','edit17'),'String'));
ny = str2num(get(findobj(h2,'Tag','edit18'),'String'));


popm4 = get(findobj(h2,'Tag','popupmenu4'),'Value');
if popm4 == 1
    reference = 'on x-axis';
elseif popm4 == 2
    reference = 'top face';
elseif popm4 == 3
    reference = 'bisector';
end

popm1 = get(findobj(h2,'Tag','popupmenu1'),'Value');
if popm1 == 1
    Field = 'Near Field';
elseif popm1 == 2
    Field = 'Far Field';
end

rb3value = get(findobj(h2,'Tag','radiobutton3'),'Value');
if rb3value == 1
    CapType = get(findobj(h2,'Tag','radiobutton3'),'String');
    set(findobj(h2,'Tag','radiobutton4'),'value',0);
    set(findobj(h2,'Tag','radiobutton5'),'value',0);
end
rb4value = get(findobj(h2,'Tag','radiobutton4'),'Value');
if rb4value == 1
    CapType = get(findobj(h2,'Tag','radiobutton4'),'String');
    set(findobj(h2,'Tag','radiobutton3'),'value',0);
    set(findobj(h2,'Tag','radiobutton5'),'value',0);
end
rb5value = get(findobj(h2,'Tag','radiobutton5'),'Value');
if rb5value == 1
    CapType = get(findobj(h2,'Tag','radiobutton5'),'String');
    set(findobj(h2,'Tag','radiobutton3'),'value',0);
    set(findobj(h2,'Tag','radiobutton4'),'value',0);
end

engll = get(findobj(h2,'Tag','english'),'Value');
if engll == 1
    SourceType = 'Line Source';       % Soutce Type 'Line Source' or 'Plane Wave' 
    set(findobj(h2,'Tag','si'),'value',0);
end
engl = get(findobj(h2,'Tag','si'),'Value');
if engl == 1
    SourceType = 'Plane Wave';       % Soutce Type 'Line Source' or 'Plane Wave' 
    set(findobj(h2,'Tag','english'),'value',0);
end


% ax = 3*rhop;    by = 2*rhop;    % area for near field calculations
% nx = 45;        ny = 30;        % Number of points for near field calculations
%  =====  End of Input Data   =====

alpha = alphad*dtr;
beta = betad *dtr;

switch reference
    case 'top face'
        alpha = 0;
        vi = pi/(2*pi-beta);
    case 'bisector'
        beta = alpha;
        vi = pi/(2*pi-2*beta);
    case 'on x-axis'
        vi = pi/(2*pi-alpha-beta);
end

phip = phipd*dtr;
etar = sqrt(mur/epsr);
mu = mu0*mur;
eps = eps0*epsr;
lambda = 2.99e8/freq;
k = 2*pi/lambda;                % free space wavenumber
ka = k*ar;
k1 = k*sqrt(mur*epsr);         % wavenumber inside dielectric
k1a = k1*ar;
krhop = k*rhop;
omega =2*pi*freq;

switch SourceType
    case 'Line Source'
        
        switch Field
            case 'Far Field'
                %   <<< Far field Calculations of Ez component >>>
                % Line source excitation
                Nc =round(1+2*k*rhop);          % number of terms for series summation  
                Term   = pi*omega*mu0/(2*pi-alpha-beta);
                Term0D =  img*4*pi/(2*pi-alpha-beta);
                Term0C = -img*4*pi/(2*pi-alpha-beta);
                Term0  =      4*pi/(2*pi-alpha-beta);
                for ip = 1:360   
                    phii = (ip -1)*dtr;
                    xphi(ip) = ip-1;
                    if phii > alpha  & phii < 2*pi-beta %  outside the wedge region
                        EzFLs(ip) = 0;
                        for m = 1:Nc  
                            v = m*vi;     
                            ssterm = (img^v)*sin(v*(phip-alpha))*sin(v*(phii-alpha));
                            switch CapType
                                case 'Dielectric'                   
                                    Aterm = k * besselj(v,k1a)*(dbesselj(v,ka)*bessely(v,krhop)-dbessely(v,ka)*besselj(v,krhop)) ...
                                        +k1*dbesselj(v,k1a)*( bessely(v,ka)*besselj(v,krhop)- besselj(v,ka)*bessely(v,krhop));
                                    Bterm =k*dbesselh(v,2,ka)*besselj(v,k1a)-k1*besselh(v,2,ka)*dbesselj(v,k1a);
                                    EzLS(m) = Term0D*ssterm*Aterm/Bterm; 
                                case 'Conductor'
                                    Aterm = bessely(v,ka)*besselj(v,krhop)- besselj(v,ka)*bessely(v,krhop);
                                    Bterm = besselh(v,2,ka);                
                                    EzLS(m) = Term0C*ssterm*Aterm/Bterm;   
                                case 'None'               
                                    EzLS(m) = Term0*ssterm*besselj(v,krhop);      
                            end          
                        end
                        EzFLs(ip) = abs(sum(EzLS));
                    else 
                        EzFLs(ip)=0;
                    end
                end
                EzFLs = EzFLs/max(EzFLs);
                
                figure(1);
                plot(xphi,EzFLs,'linewidth',1.5);
                xlabel('Observation angle \phi^o'); 
                ylabel('Ez');
                axis ([0 360 0 1])
                title('Total Far Field (Ez) [Line source excitation]');
                
                figure(2)
                polardb(xphi*dtr,EzFLs,'k')
                title ('Total Far Field (Ez) [dB]')
                
            case 'Near Field'
                %   <<<   Near field observation points   >>>
                delx = 2*ax/nx; dely = 2*by/ny;
                xi = -ax;   yi = -by;           % Initial values for x and y
                
                for i = 1:nx
                    for j = 1:ny
                        x(i,j) = xi + (i-1)*delx;
                        y(i,j) = yi + (j-1) *dely;
                        rho(i,j) = sqrt(x(i,j)^2+y(i,j)^2);
                        phi(i,j) = atan2(y(i,j),x(i,j));
                        if phi(i,j) < 0
                            phi(i,j) = phi(i,j) + 2*pi;
                        end    
                        if rho(i,j) <= 0.001
                            rho(i,j) = 0.001;
                        end
                    end 
                end
                
                %    Line source excitation, near field calculations
                
                %    ====   Line source coefficients    ====
                Nc =round(1+2*k*max(max(rho)));          % number of terms for series summation  
                Term   = Ie*pi*omega*mu0/(2*pi-alpha-beta);
                
                for m = 1:Nc  
                    v = m*vi;     
                    switch CapType
                        case 'Dielectric'
                            b(m) = -Term * besselh(v,2,krhop);
                            c(m) = -b(m) * (k*dbesselj(v,ka)*besselj(v,k1a)-k1*besselj(v,ka)*dbesselj(v,k1a)) ...
                                / (k*dbesselh(v,2,ka)*besselj(v,k1a)-k1*besselh(v,2,ka)*dbesselj(v,k1a));
                            d(m) = c(m) + b(m) * besselj(v,krhop) / besselh(v,2,krhop);
                            a(m) = ( b(m) * besselj(v,ka)+c(m) * besselh(v,2,ka))/besselj(v,k1a);
                        case 'Conductor'
                            b(m) = -Term * besselh(v,2,krhop);
                            c(m) = -b(m) * besselj(v,ka)/besselh(v,2,ka);
                            d(m) = c(m) + b(m) * besselj(v,krhop) / besselh(v,2,krhop);
                            a(m) = 0;
                        case 'None'               
                            b(m) = -Term * besselh(v,2,krhop);
                            c(m) = 0;
                            d(m) = -Term * besselj(v,krhop); 
                            a(m) = b(m);  
                    end          
                end
                
                termhphi = sqrt(-1)*omega*mu0;
                termhrho = -termhphi;
                for i = 1:nx
                    for j = 1:ny
                        for m = 1:Nc
                            v = m*vi;  % Equation 
                            [Ezt,Hphit,Hrhot] = DielCappedWedgeTMFields_Ls(v,m,rho(i,j),phi(i,j),rhop, ...
                                phip,ar,k,k1,alpha,beta,a,b,c,d);
                            Eztt(m) = Ezt;
                            Hphitt(m) = Hphit;
                            Hrhott(m) = Hrhot;
                        end
                        SEz(i,j) = sum(Eztt);
                        SHphi(i,j) = sum(Hphitt)/termhphi;
                        SHrho(i,j) = sum(Hrhott)/termhrho;
                    end
                end
                figure(3);
                surf(x,y,abs(SEz));
                axis ('equal'); 
                view(45,60); 
                shading interp;
                xlabel('x'); 
                ylabel('y'); 
                zlabel('E_z');
                title('Ez [Line source excitation]');
                colorbar
                
                figure(4);
                surf(x,y,377*abs(SHrho));
                axis ('equal');
                view(45,60);  
                shading interp;
                xlabel('x'); 
                ylabel('y'); 
                zlabel('\eta_o  H\rho');
                title('\eta_o  H\rho [Line source excitation]');
                colorbar
                
                figure(5);
                surf(x,y,377*abs(SHphi));
                axis ('equal');
                view(45,60); 
                shading interp;
                xlabel('x'); 
                ylabel('y'); 
                zlabel('\eta_o  H\phi');
                title('\eta_o  H\phi [Line source excitation]')
                colorbar
        end
    case 'Plane Wave'
        
        popm2 = get(findobj(h2,'Tag','popupmenu2'),'Value');
        if popm2 == 1
            %   <<<   Near field observation points   >>>
            delx = 2*ax/nx; dely = 2*by/ny;
            xi = -ax;   yi = -by;           % Initial values for x and y
            
            for i = 1:nx
                for j = 1:ny
                    x(i,j) = xi + (i-1)*delx;
                    y(i,j) = yi + (j-1) *dely;
                    rho(i,j) = sqrt(x(i,j)^2+y(i,j)^2);
                    phi(i,j) = atan2(y(i,j),x(i,j));
                    if phi(i,j) < 0
                        phi(i,j) = phi(i,j) + 2*pi;
                    end    
                    if rho(i,j) <= 0.001
                        rho(i,j) = 0.001;
                    end
                end 
            end
            
            %   ===   Plane wave excitation, near field calculations   ===
            Nc =round(1+2*k*max(max(rho)));          % number of terms for series summation  
            Term   = 4*pi/(2*pi-alpha-beta);
            for m = 1:Nc  
                v = m*vi;     
                switch CapType
                    case 'Dielectric'
                        b(m) = Term * img^v;
                        c(m) = -b(m) * (k*dbesselj(v,ka)*besselj(v,k1a)-k1*besselj(v,ka)*dbesselj(v,k1a)) ...
                            / (k*dbesselh(v,2,ka)*besselj(v,k1a)-k1*besselh(v,2,ka)*dbesselj(v,k1a));
                        a(m) = ( b(m) * besselj(v,ka)+c(m) * besselh(v,2,ka))/besselj(v,k1a);
                    case 'Conductor'
                        b(m) = -Term * img^v;
                        c(m) = -b(m) * besselj(v,ka)/besselh(v,2,ka);
                        a(m) = 0;
                    case 'None'               
                        b(m) = -Term * img^v;
                        c(m) = 0;
                        a(m) = b(m);  
                end          
            end
            
            
            termhphi = sqrt(-1)*omega*mu0;
            termhrho = -termhphi;
            for i = 1:nx
                for j = 1:ny
                    for m = 1:Nc
                        v = m*vi;  % Equation 
                        [Ezt,Hphit,Hrhot] = DielCappedWedgeTMFields_PW(v,m,rho(i,j),phi(i,j), ...
                            phip,ar,k,k1,alpha,beta,a,b,c);
                        Eztt(m) = Ezt;
                        Hphitt(m) = Hphit;
                        Hrhott(m) = Hrhot;
                    end
                    EzPW(i,j) = sum(Eztt);
                    HphiPW(i,j) = sum(Hphitt)/termhphi;
                    HrhoPW(i,j) = sum(Hrhott)/termhrho;
                end
            end   
            
            figure(6);
            surf(x,y,abs(EzPW));
            axis ('equal');
            view(45,60); 
            shading interp;
            xlabel('x'); 
            ylabel('y'); 
            zlabel('E_z');
            colorbar
            title('Near Field (Ez) [Plane wave excitation]');
            
            figure(7);
            surf(x,y,377*abs(HrhoPW));
            axis ('equal');
            view(45,60); 
            shading interp;
            xlabel('x'); 
            ylabel('y'); 
            zlabel('\eta_o H\rho');
            title('\eta_o H\rho [Plane wave excitation]');
            colorbar
            
            figure(8);
            surf(x,y,377*abs(HphiPW));
            axis ('equal');
            view(45,60); 
            shading interp;
            xlabel('x'); 
            ylabel('y'); 
            zlabel('\eta_o H\phi');
            title('\eta_o H\phi [Plane wave excitation]');
            colorbar        
        end
end


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


