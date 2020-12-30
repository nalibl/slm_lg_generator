function varargout = slm_gui(varargin)
% SLM_GUI MATLAB code for slm_gui.fig
%      SLM_GUI, by itself, creates a new SLM_GUI or raises the existing
%      singleton*.
%
%      H = SLM_GUI returns the handle to a new SLM_GUI or the handle to
%      the existing singleton*.
%
%      SLM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLM_GUI.M with the given input arguments.
%
%      SLM_GUI('Property','Value',...) creates a new SLM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before slm_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to slm_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help slm_gui

% Last Modified by GUIDE v2.5 23-Jun-2020 13:12:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @slm_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @slm_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end


% --- Executes just before slm_gui is made visible.
function slm_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to slm_gui (see VARARGIN)

handles = guidata(hObject);
handles.slm_on = false;
guidata(hObject, handles);
plot_curr(hObject, handles);
% Choose default command line output for slm_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes slm_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = slm_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
order = round(get(handles.slider1,'Value'));
plot_curr(hObject, handles);
set(handles.text2, 'String', ['Order = ' num2str(order)]);
end



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
theta = get(handles.slider2,'Value');
plot_curr(hObject, handles);
set(handles.text3, 'String', ['Theta = ' num2str(theta)]);
end


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
phi = get(handles.slider4,'Value');
plot_curr(hObject, handles);
set(handles.text4, 'String', ['Phi = ' num2str(phi)]);
end


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
plot_curr(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function plot_curr(hObject, handles)
    order = round(get(handles.slider1,'Value'));
    theta = get(handles.slider2,'Value');
    phi = get(handles.slider4,'Value');
    prop_z = get(handles.slider5,'Value');
    beam_width = get(handles.slider6,'Value');
    shift_x = get(handles.slider7,'Value');
    shift_y = get(handles.slider8,'Value');
    shift = [shift_x, shift_y];
    grid_unit = 15;
    x_blazed_flag = false;
    res = [512, 512];
    oam_complex = lg_func(res, grid_unit,order, beam_width, shift);
    linear_phase = gen_linear_phase(res,theta,phi);
    spherical_phase = gen_spherical_phase(res, prop_z,shift);
    total_complex = oam_complex.*exp(1i*(linear_phase + spherical_phase));
    total_phase = slm_amp_phase( total_complex);
    total_phase_pos = total_phase + min(total_phase(:));
    mask = out_slm_phase(total_phase_pos);
    axes(handles.axes1); 
    imagesc(abs(oam_complex));
    colorbar();
    axes(handles.axes2); 
    imagesc(mask);
    colorbar();
    handles = guidata(hObject);
    if handles.slm_on
        send_slm_image(mask);
    end
end


% --- Executes on key press with focus on slider2 and none of its controls.
function slider2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
prop_z = get(handles.slider5,'Value');
plot_curr(hObject, handles);
set(handles.text5, 'String', ['Prop = ' num2str(prop_z)]);
end

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    order = round(get(handles.slider1,'Value'));
    theta = get(handles.slider2,'Value');
    phi = get(handles.slider4,'Value');
    prop_z = get(handles.slider5,'Value');
    beam_width = get(handles.slider6,'Value');
    shift_x = get(handles.slider7,'Value');
    shift_y = get(handles.slider8,'Value');
    shift = [shift_x, shift_y];
    grid_unit = 15;
    diff_order = 1;
    res = [512, 512];
    oam_complex = lg_func(res, grid_unit,order, beam_width, shift);
    linear_phase = gen_linear_phase(res,theta,phi);
    spherical_phase = gen_spherical_phase(res, prop_z,shift);
    total_complex = oam_complex.*exp(1i*(linear_phase + spherical_phase));
    total_phase = slm_amp_phase( total_complex, grid_unit, diff_order);
    total_phase_pos = total_phase + min(total_phase(:));
    mask = out_slm_phase(total_phase_pos);
    curr_path = pwd();
    name = [curr_path '\mask' char(datetime('now','Format','d_MM_HH_mm')) '.bmp'];
    imwrite(mask, name);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
def_path = 'C:\Users\ady-lab\Desktop\slm\m_funcs';
addpath([def_path '\..']);
BNS_OpenSLM()
BNS_SetPower(true) 
handles = guidata(hObject);
handles.slm_on = true;
guidata(hObject, handles)
plot_curr(hObject, handles);
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BNS_CloseSLM()
handles = guidata(hObject);
handles.slm_on = false;
guidata(hObject, handles)
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider1, 'Value', 0);
plot_curr(hObject, handles);
set(handles.text2, 'String', ['Order = ' num2str(0)]);
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider2, 'Value', 0);
plot_curr(hObject, handles);
set(handles.text3, 'String', ['Theta = ' num2str(0)]);
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider4, 'Value', 0);
plot_curr(hObject, handles);
set(handles.text4, 'String', ['Phi = ' num2str(0)]);
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider5, 'Value', 0);
plot_curr(hObject, handles);
set(handles.text5, 'String', ['Prop = ' num2str(0)]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
beam_width = get(handles.slider6,'Value');
plot_curr(hObject, handles);
set(handles.text6, 'String', ['Width = ' num2str(beam_width)]);
end

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider6, 'Value', 500);
plot_curr(hObject, handles);
set(handles.text6, 'String', ['Width = ' num2str(500)]);
end

% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
shift_x= get(handles.slider7,'Value');
plot_curr(hObject, handles);
set(handles.text7, 'String', ['Shift x = ' num2str(shift_x)]);
end

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider7, 'Value', 0);
plot_curr(hObject, handles);
set(handles.text7, 'String', ['Shift x = ' num2str(0)]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
shift_y= get(handles.slider8,'Value');
plot_curr(hObject, handles);
set(handles.text8, 'String', ['Shift y = ' num2str(shift_y)]);
end


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider8, 'Value', 0);
plot_curr(hObject, handles);
set(handles.text8, 'String', ['Shift y = ' num2str(0)]);
end
