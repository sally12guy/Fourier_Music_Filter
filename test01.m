function varargout = test01(varargin)
% TEST01 MATLAB code for test01.fig
%      TEST01, by itself, creates a new TEST01 or raises the existing
%      singleton*.
%
%      H = TEST01 returns the handle to a new TEST01 or the handle to
%      the existing singleton*.
%
%      TEST01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST01.M with the given input arguments.
%
%      TEST01('Property','Value',...) creates a new TEST01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test01

% Last Modified by GUIDE v2.5 05-Jun-2017 20:17:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test01_OpeningFcn, ...
                   'gui_OutputFcn',  @test01_OutputFcn, ...
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

% --- Executes just before test01 is made visible.
function test01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test01 (see VARARGIN)

% Choose default command line output for test01
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global fs;
global head;
global block;
global p;
global p2;
block=2;
while block<fs*10
    block=block*2;
end
file=get(handles.edit1,'string');
[y,fs]=audioread(file,[1,inf]);
head=1;
axes(handles.axes1);
time=(head:head+block)/fs;
plot(time,y(head:head+block,:));
axis([ceil((head-1)/fs),floor((head+block)/fs),-1,1]);
set(handles.text8,'string','(無)');
set(handles.text10,'string','(無)');
p=audioplayer(y(head:head+block,:),fs);
p2=audioplayer(y(head:head+block,:),fs);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global y;
global fs;
global head;
global block;
head=round(length(y)*get(handles.slider1,'Value'));
if head==0;
    head=1;
end
if (head+block)>length(y)
    head=length(y)-block-1;
end
axes(handles.axes1);
time=(head:head+block)/fs;
plot(time,y(head:head+block,:));
axis([ceil((head-1)/fs),floor((head+block)/fs),-1,1]);
set(handles.text8,'string','(無)');
set(handles.text10,'string','(無)');

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global fs;
global head;
global block;
global p;
global p2;
stop(p2);
p=audioplayer(y(head:head+block,:),fs);
play(p);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
global p2;
stop(p);
stop(p2);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global fs;
global head;
global p;
global p2;
stop(p2);
p=audioplayer(y(head:length(y),:),fs);
play(p);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global fs;
global head;
global block;
global p2;
tic;
z=y(head:head+block,:);
N=block;
set(handles.text8,'string','轉換');
pause(0.001);
z=FFT01(z,1);
set(handles.text8,'string','清除頻段');
pause(0.001);
for j=1:ceil(block/2)
    % (f=(n*fs)/N)
    if (get(handles.checkbox3,'Value')==1 && ((j*fs/block)>=55 && (j*fs/block)<=440)) || (get(handles.checkbox2,'Value')==1 && ((j*fs/block)>=440 && (j*fs/block)<=3500)) || (get(handles.checkbox1,'Value')==1 && ((j*fs/block)>=3500 && (j*fs/block)<=20000))
        z(j,:)=0;
        z(block-j,:)=0;
    end
end
set(handles.text8,'string','逆轉換');
pause(0.001);
z=FFT01(z,-1);
set(handles.text8,'string','完成');
pause(0.001);
tt=toc;
set(handles.text10,'string',tt);
pause(0.001);
p2=audioplayer(z,fs);
axes(handles.axes2);
time=(head:head+block)/fs;
plot(time,z);
axis([ceil((head-1)/fs),floor((head+block)/fs),-1,1]);


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p2;
global p;
stop(p);
play(p2);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton6.
function pushbutton6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double



% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global fs;
global block;
tic
head=1;
z=zeros(length(y),2);
z2=zeros(block,2);

while head<=length(y)
    set(handles.text8,'string','取段');
    pause(0.001);
    if head+block<=length(y)
        for j=head:head+block
            z2(j-head+1,:)=y(j,:);
        end
    else
        z2=zeros(block,2);
        for j=head:length(y)
            z2(j-head+1,:)=y(j,:);
        end
    end
    set(handles.text8,'string','轉換');
    pause(0.001);
    z2=FFT01(z2,1);
    set(handles.text8,'string','清除頻段');
    pause(0.001);
    for j=1:ceil(block/2)
        % (f=(n*fs)/N)
        if (get(handles.checkbox3,'Value')==1 && ((j*fs/block)>=55 && (j*fs/block)<=440)) || (get(handles.checkbox2,'Value')==1 && ((j*fs/block)>=440 && (j*fs/block)<=3500)) || (get(handles.checkbox1,'Value')==1 && ((j*fs/block)>=3500 && (j*fs/block)<=20000))
            z2(j,:)=0;
            z2(block-j,:)=0;
        end
    end
    set(handles.text8,'string','逆轉換');
    pause(0.001);
    z2=FFT01(z2,-1);
    set(handles.text8,'string','組合');
    pause(0.001);
    if head+block<=length(y)
        for j=head:head+block
            z(j,:)=z2(j-head+1,:);
        end
    else
        for j=head:length(y)
            z(j,:)=z2(j-head+1,:);
        end
    end
    head=head+block;
end
set(handles.text8,'string','寫入檔案');
pause(0.001);
tt=toc;
set(handles.text10,'string',tt);
file=get(handles.edit3,'string');
audiowrite(file, z, fs);
set(handles.text8,'string','完成');
pause(0.001);

function z=FFT01(y,flag)
z=y;
N=length(y)-1;
% bit-reverse
j=0;
for L=2:N
    %
    k=floor(N/2);
    j=bitxor(j,k);
    F=bitand(j,k);
    while F==0
        k=floor(k/2);
        j=bitxor(j,k);
        F=bitand(j,k);
    end
    %
    j=j+1;
    if (L>j)
        temp=z(L,:);
        z(L,:)=z(j,:);
        z(j,:)=temp;
    end
    j=j-1;
end
% main FFT
k=2;
while k<=N
    w = flag*-2.0*pi/k;
    dO=cos(w)+i*sin(w);
    j=0;
    while j<N
        j=j+1;
        O=1;
        for L=j:j+(k/2)-1
            a=z(L,:);
            b=z(L + k/2,:) * O;
            z(L,:)=a+b;
            z(L+k/2,:)=a-b;
            O=O*dO;
        end
        j=j+k;
        j=j-1;
    end
    k=k*2;
end
if flag==(-1)
    z=real(z/N);
end
