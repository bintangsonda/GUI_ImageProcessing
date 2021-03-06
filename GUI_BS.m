function varargout = GUI_BS(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_BS_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_BS_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before GUI_BS is made visible.
function GUI_BS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUI_BS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_BS wait for user response (see UIRESUME)
% uiwait(handles.figure1);
buat_axes = axes('unit', 'normalized', 'position', [0 0  1 1]);
backgroundnya = imread('bg15.jpg');
imagesc(backgroundnya);
set(buat_axes, 'handlevisibility', 'off', 'visible', 'off')

% --- Outputs from this function are returned to the command line.
function varargout = GUI_BS_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)%Histogram
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes2);
imhist(input);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)%measure distance by pixel
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l=imdistline();
msgbox('Measured in Pixels');
dist = getDistance(l);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)%RGB to Red
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
red=a;
red(:,:,2:3)=0;
setappdata(0,'filename', red);
setappdata(0,'ImRotation', red);
axes(handles.axes2);
imshow(red);

% --- Executes on button press in pushbutton1111.
function pushbutton1111_Callback(hObject, eventdata, handles) %rotate 45degree
% hObject    handle to pushbutton1111 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0, 'a');
rotate=imrotate(a,45);
axes(handles.axes2);
imshow(rotate);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)%Flip horizontal
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I2=flipdim(I,2);
axes(handles.axes2);
imshow(I2);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)%Complement of Image
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
IM2=imcomplement(a);
axes(handles.axes2);
imshow(IM2);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)%RGB to Green
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
green=a;
green(:,:,1)=0;
green(:,:,3)=0;
setappdata(0,'filename', green);
setappdata(0,'ImRotation', green);
axes(handles.axes2);
imshow(green);


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)%RGB to Blue
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
blue=a;
blue(:,:,1)=0;
blue(:,:,2)=0;
setappdata(0,'filename', blue);
setappdata(0,'ImRotation', blue);
axes(handles.axes2);
imshow(blue);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)%Salt pepper noise
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
noise=imnoise(a, 'salt & pepper');
axes(handles.axes2);
imshow(noise);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)%Gaussian noise
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
noise=imnoise(a, 'gaussian');
axes(handles.axes2);
imshow(noise);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)%Flip Vertical
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I3=flipdim(I,1);
axes(handles.axes2);
imshow(I3);


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)%Flip horizontal & Vertical
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I2=flipdim(I,2);
I3=flipdim(I,1);
I4=flipdim(I3,2);
axes(handles.axes2);
imshow(I4);

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)%edge Detection Canny
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I=rgb2gray(I);
BW2=edge(I,'canny');
axes(handles.axes2);
imshow(BW2);


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)%Edge detection Sobel
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I=rgb2gray(I);
BW1=edge(I,'sobel');
axes(handles.axes2);
imshow(BW1);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)% import Image
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('*');
filename=a;
setappdata(0,'filename',filename);
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a);
setappdata(0,'filename',a);
plot(handles.axes1,'a');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%grayscale
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=rgb2gray(a);
setappdata(0,'filename', a_gray);
axes(handles.axes2);
imshow(a_gray);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
adjust=imadjust(a);
axes(handles.axes2);
imshow(adjust);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles) %Black and White
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_bw=im2bw(a,.57);
axes(handles.axes2);
imshow(a_bw);
setappdata(0,'filename',a_bw);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)%Reset button
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(a);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)%exit button
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Thankyou Mam Rosalina, Have a Good Day ^ ^');
pause(5);
close();
close();

% --- Executes on button press in pushbutton82.
function pushbutton82_Callback(hObject, eventdata, handles)%resize based on Height and Width
% hObject    handle to pushbutton82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
w=str2double(get(handles.edit3,'string'));
h=str2double(get(handles.edit4,'string'));
axes(handles.axes2);
y=imresize(a,[w,h]);
imshow(y);


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)%Brightness
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a=getappdata(0,'a');
val=0.5*get(hObject, 'value')-0.5;
imbright= a+val;
axes(handles.axes2);
imshow(imbright);
guidata(hObject, handles);

% --- Executes on button press in pushbutt  on83.
function pushbutton83_Callback(hObject, eventdata, handles)%sharpen image
% hObject    handle to pushbutton83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b = imsharpen(a,'Radius',2,'Amount',1);
axes(handles.axes2);
imshow(b)


% --- Executes on button press in pushbutton84.
function pushbutton84_Callback(hObject, eventdata, handles)%save Image
% hObject    handle to pushbutton84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= getimage(handles.axes2);
[filename, foldername] = uiputfile();
complete_name = fullfile(foldername, filename);
imwrite(a, complete_name);


% --- Executes on button press in pushbutton85.
function pushbutton85_Callback(hObject, eventdata, handles)%image restoration
% hObject    handle to pushbutton85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getimage(handles.axes1);
Output_med = medfilt3(a, [5 5 3]);
axes(handles.axes2);
imshow(Output_med);


