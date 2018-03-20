function varargout = lab09(varargin)
% LAB09 MATLAB code for lab09.fig
%      LAB09, by itself, creates a new LAB09 or raises the existing
%      singleton*.
%
%      H = LAB09 returns the handle to a new LAB09 or the handle to
%      the existing singleton*.
%
%      LAB09('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB09.M with the given input arguments.
%
%      LAB09('Property','Value',...) creates a new LAB09 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab09_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab09_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab09

% Last Modified by GUIDE v2.5 11-Dec-2017 19:29:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab09_OpeningFcn, ...
                   'gui_OutputFcn',  @lab09_OutputFcn, ...
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


% --- Executes just before lab09 is made visible.
function lab09_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab09 (see VARARGIN)

% Choose default command line output for lab09
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
%set(gcf, 'WindowButtonDownFcn', @my_func);

% UIWAIT makes lab09 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab09_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%axes(handles.axeImage);
%disp(handles.axeImage);
%handles.filename
%imshow(handles.filename);

    

% Get default command line output from handles structure
%varargout{1} = handles.output;


% --- Executes on selection change in find.
function find_Callback(hObject, eventdata, handles)
% hObject    handle to find (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filepath = uigetdir;
% Hints: contents = cellstr(get(hObject,'String')) returns find contents as cell array
%        contents{get(hObject,'Value')} returns selected item from find


% --- Executes during object creation, after setting all properties.
function find_CreateFcn(hObject, eventdata, handles)
% hObject    handle to find (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in dir.
function dir_Callback(hObject, eventdata, handles)
% hObject    handle to dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
filepath = uigetdir;
n = cd(filepath);          %!!!!!!
%k0 = cellstr(filepath);
%handles.struct = k0;
%handles
%g = get(handles.struct, 'String')
n1 = dir(filepath);
files = dir(fullfile(filepath, '*.jpg'));

k = struct2cell(files);
%handles.struct = k;
pic_num = size(k, 2);

disp(pic_num);
slash = '/';
str = [];
for i = 1:size(k, 2)
    if (i ~= size(k, 2))
        str = strcat(str, files(i).name, slash);
    else
        str = strcat(str, files(i).name);
    end
end
%path_record = get(handles.find, 'String');
%c_p_r = char(path_record);
%c_fp = char(filepath);
%tmp = sprintf('%s\n', c_fp);
%c_tmp = char(tmp);

%path_record  = sprintf('%s  \n%s', c_p_r, c_tmp);
set(handles.find, 'String', filepath);
set(handles.slider1, 'String', str);
set(handles.slider1, 'Min', 1);
set(handles.slider1, 'Max', pic_num);
set(handles.slider1, 'Value', 1);


set(handles.slider1, 'SliderStep', [1/(pic_num-1) , 1/(pic_num-1)]);
guidata(hObject, handles);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles = guidata(hObject);
B = [0.94;0.94;0.94];
imshow(B, 'Parent', handles.axeHighlight);
ah = findobj('Tag', 'axeHighlight');
set(ah, 'Visible', 'off');
a = get(handles.slider1, 'Value')
set(handles.slider1, 'Value', round(a));
b = get(handles.slider1, 'SliderStep');

%disp(a);
str = get(handles.slider1, 'String');



counter = 1;
filename_i = [];
len = size(str, 2);
for i = 1:len
    %disp(str(i));
    if(str(i) - '/' == 0)
        counter = counter + 1;
    elseif(a == counter)
        filename_i(end+1) = str(i);
    end
end
filename = char(filename_i);
now_x = 320;
now_y = 240;
half_height = 160;
half_width = 120;
set(handles.dir, 'Value', now_x); % cord x = dir
set(handles.filename, 'Value', now_y); % cord y = filename
set(handles.hh, 'Value', half_height); % h_h = z_i
set(handles.hw, 'Value', half_width); % h_w = z_o
h_hh = findobj('Tag', 'hh');
set(h_hh, 'Visible', 'off');
h_hw = findobj('Tag', 'hw');
set(h_hw, 'Visible', 'off');
h_pr = findobj('Tag', 'p_r');
set(h_pr, 'Visible', 'off');

% check if *.jpg
if(a ~= 0)
    A = imread(filename);
    if((size(A, 1) / 3) >= (size(A, 2) / 4))
        rrr = (size(A, 1)) / 480;
        %disp('A1 beg');
    elseif((size(A, 1) / 3) < (size(A, 2) / 4))
        rrr = (size(A, 2)) / 640;
        %disp('A1 blt');
    end
    %rrr
    B = imresize(A, [(size(A, 1))/rrr (size(A, 2))/rrr]);
    pad = [480 640 0] - size(B);
    pad(pad<0) = 0;
    merged = padarray(B, floor(pad./2));
    imshow(merged, 'Parent', handles.axeImage);
    
    pic_num = get(handles.slider1, 'Max');
    left = num2str((size(A, 2)));
    mul = 'x';
    right = num2str((size(A, 1)));
    pic_size = strcat(left, mul, right);
    ra = (640*480) / (size(A, 1) * size(A, 2) ) *100;
    if(ra > 100)
            ra = 100;
    end
    c_ra = num2str(round(ra));
    pa = '%';
    ratio = strcat(c_ra, pa); 
    
    ssttrr = ['Picture = ' num2str(a), ' of ' num2str(pic_num), ' (' filename , ') '  pic_size, ' @ ' ratio];
    
    set(handles.hh, 'String', filename);
    set(handles.filename, 'String', ssttrr);
end
min = get(handles.slider1, 'Min');
max = get(handles.slider1, 'Max');


guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in up_button.
function up_button_Callback(hObject, eventdata, handles)
% hObject    handle to up_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

r11 = get(handles.dir, 'Value');
r12 = get(handles.filename, 'Value');
half_height = get(handles.hh, 'Value'); % h_h = z_i
half_width = get(handles.hw, 'Value'); % h_w = z_o
file = get(handles.hh, 'String'); %h_h_string = pic_filename
if((r12 - half_width) > 0)
    r12 = r12 - 10;
end
%r12
    C = imread(file);
    if((size(C, 1) / 3) >= (size(C, 2) / 4))
        rrr = (size(C, 1)) / 480;
        %disp('A1 beg');
    elseif((size(C, 1) / 3) < (size(C, 2) / 4))
        rrr = (size(C, 2)) / 640;
        %disp('A1 blt');
    end
    %rrr
    D = imresize(C, [(size(C, 1))/rrr (size(C, 2))/rrr]);
    pad = [480 640 0] - size(D);
    pad(pad<0) = 0;
    merged = padarray(D, floor(pad./2));
    cla
    imshow(merged, 'Parent', handles.axeImage);
hold on
rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
Gr = imcrop(merged,[r11-half_height r12-half_width half_height*2 half_width*2]);
GGr = imresize(Gr, [300 400]);
imshow(GGr, 'Parent', handles.axeHighlight);
set(handles.dir, 'Value', r11); % cord x = dir
set(handles.filename, 'Value', r12); % cord y = filename
set(handles.hh, 'Value', half_height); % h_h = z_i
set(handles.hw, 'Value', half_width); % h_w = z_o
guidata(hObject, handles);

% --- Executes on button press in left_button.
function left_button_Callback(hObject, eventdata, handles)
% hObject    handle to left_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

r11 = get(handles.dir, 'Value');
r12 = get(handles.filename, 'Value');
half_height = get(handles.hh, 'Value'); % h_h = z_i
half_width = get(handles.hw, 'Value'); % h_w = z_o
file = get(handles.hh, 'String');
if((r11 - half_height) > 0)
    r11 = r11 - 15;
end
%r11
C = imread(file);
    if((size(C, 1) / 3) >= (size(C, 2) / 4))
        rrr = (size(C, 1)) / 480;
        %disp('A1 beg');
    elseif((size(C, 1) / 3) < (size(C, 2) / 4))
        rrr = (size(C, 2)) / 640;
        %disp('A1 blt');
    end
    %rrr
    D = imresize(C, [(size(C, 1))/rrr (size(C, 2))/rrr]);
    pad = [480 640 0] - size(D);
    pad(pad<0) = 0;
    merged = padarray(D, floor(pad./2));
    cla
    imshow(merged, 'Parent', handles.axeImage);
hold on
rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
Gr = imcrop(merged,[r11-half_height r12-half_width half_height*2 half_width*2]);
GGr = imresize(Gr, [300 400]);
imshow(GGr, 'Parent', handles.axeHighlight);
set(handles.dir, 'Value', r11); % cord x = dir
set(handles.filename, 'Value', r12); % cord y = filename
set(handles.hh, 'Value', half_height); % h_h = z_i
set(handles.hw, 'Value', half_width); % h_w = z_o
guidata(hObject, handles); 
% --- Executes on button press in right_button.
function right_button_Callback(hObject, eventdata, handles)
% hObject    handle to right_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%handles = guidata(hObject);

r11 = get(handles.dir, 'Value');
r12 = get(handles.filename, 'Value');
half_height = get(handles.hh, 'Value'); % h_h = z_i
half_width = get(handles.hw, 'Value'); % h_w = z_o
file = get(handles.hh, 'String');
if((r11 + half_height) < 640)
    r11 = r11 + 15;
end
C = imread(file);
    if((size(C, 1) / 3) >= (size(C, 2) / 4))
        rrr = (size(C, 1)) / 480;
        %disp('A1 beg');
    elseif((size(C, 1) / 3) < (size(C, 2) / 4))
        rrr = (size(C, 2)) / 640;
        %disp('A1 blt');
    end
    %rrr
    D = imresize(C, [(size(C, 1))/rrr (size(C, 2))/rrr]);
    pad = [480 640 0] - size(D);
    pad(pad<0) = 0;
    merged = padarray(D, floor(pad./2));
    cla
    imshow(merged, 'Parent', handles.axeImage);
hold on
rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
Gr = imcrop(merged,[r11-half_height r12-half_width half_height*2 half_width*2]);
GGr = imresize(Gr, [300 400]);
imshow(GGr, 'Parent', handles.axeHighlight);
set(handles.dir, 'Value', r11); % cord x = dir
set(handles.filename, 'Value', r12); % cord y = filename
set(handles.hh, 'Value', half_height); % h_h = z_i
set(handles.hw, 'Value', half_width); % h_w = z_o
%guidata(hObject, handles);

% --- Executes on button press in down_button.
function down_button_Callback(hObject, eventdata, handles)
% hObject    handle to down_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

r11 = get(handles.dir, 'Value');
r12 = get(handles.filename, 'Value');
half_height = get(handles.hh, 'Value'); % h_h = z_i
half_width = get(handles.hw, 'Value'); % h_w = z_o
file = get(handles.hh, 'String');
if((r12 + half_width) < 480)
    r12 = r12 + 10;
end
    C = imread(file);
    if((size(C, 1) / 3) >= (size(C, 2) / 4))
        rrr = (size(C, 1)) / 480;
        %disp('A1 beg');
    elseif((size(C, 1) / 3) < (size(C, 2) / 4))
        rrr = (size(C, 2)) / 640;
        %disp('A1 blt');
    end
    %rrr
    D = imresize(C, [(size(C, 1))/rrr (size(C, 2))/rrr]);
    pad = [480 640 0] - size(D);
    pad(pad<0) = 0;
    merged = padarray(D, floor(pad./2));
    cla
    imshow(merged, 'Parent', handles.axeImage);
hold on
rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
Gr = imcrop(merged,[r11-half_height r12-half_width half_height*2 half_width*2]);
GGr = imresize(Gr, [300 400]);
imshow(GGr, 'Parent', handles.axeHighlight);
set(handles.dir, 'Value', r11); % cord x = dir
set(handles.filename, 'Value', r12); % cord y = filename
set(handles.hh, 'Value', half_height); % h_h = z_i
set(handles.hw, 'Value', half_width); % h_w = z_o
guidata(hObject, handles);

% --- Executes on button press in zoom_in.
function zoom_in_Callback(hObject, eventdata, handles)
% hObject    handle to zoom_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

r11 = get(handles.dir, 'Value');
r12 = get(handles.filename, 'Value');
half_height = get(handles.hh, 'Value'); % h_h = z_i
half_width = get(handles.hw, 'Value'); % h_w = z_o
file = get(handles.hh, 'String');
half_width = half_width*0.9;
half_height = half_height*0.9;
    C = imread(file);
    if((size(C, 1) / 3) >= (size(C, 2) / 4))
        rrr = (size(C, 1)) / 480;
        %disp('A1 beg');
    elseif((size(C, 1) / 3) < (size(C, 2) / 4))
        rrr = (size(C, 2)) / 640;
        %disp('A1 blt');
    end
    %rrr
    D = imresize(C, [(size(C, 1))/rrr (size(C, 2))/rrr]);
    pad = [480 640 0] - size(D);
    pad(pad<0) = 0;
    merged = padarray(D, floor(pad./2));
    cla
    imshow(merged, 'Parent', handles.axeImage);
hold on
rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
Gr = imcrop(merged,[r11-half_height r12-half_width half_height*2 half_width*2]);
GGr = imresize(Gr, [300 400]);
imshow(GGr, 'Parent', handles.axeHighlight);
set(handles.dir, 'Value', r11); % cord x = dir
set(handles.filename, 'Value', r12); % cord y = filename
set(handles.hh, 'Value', half_height); % h_h = z_i
set(handles.hw, 'Value', half_width); % h_w = z_o
guidata(hObject, handles);
% --- Executes on button press in zoom_out.
function zoom_out_Callback(hObject, eventdata, handles)
% hObject    handle to zoom_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

r11 = get(handles.dir, 'Value');
r12 = get(handles.filename, 'Value');
half_height = get(handles.hh, 'Value'); % h_h = z_i
half_width = get(handles.hw, 'Value'); % h_w = z_o
file = get(handles.hh, 'String');
half_width = half_width*1.1;
half_height = half_height*1.1;
    C = imread(file);
    if((size(C, 1) / 3) >= (size(C, 2) / 4))
        rrr = (size(C, 1)) / 480;
        %disp('A1 beg');
    elseif((size(C, 1) / 3) < (size(C, 2) / 4))
        rrr = (size(C, 2)) / 640;
        %disp('A1 blt');
    end
    %rrr
    D = imresize(C, [(size(C, 1))/rrr (size(C, 2))/rrr]);
    pad = [480 640 0] - size(D);
    pad(pad<0) = 0;
    merged = padarray(D, floor(pad./2));
    cla
    imshow(merged, 'Parent', handles.axeImage);
rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
Gr = imcrop(merged,[r11-half_height r12-half_width half_height*2 half_width*2]);
GGr = imresize(Gr, [300 400]);
imshow(GGr, 'Parent', handles.axeHighlight);
set(handles.dir, 'Value', r11); % cord x = dir
set(handles.filename, 'Value', r12); % cord y = filename
set(handles.hh, 'Value', half_height); % h_h = z_i
set(handles.hw, 'Value', half_width); % h_w = z_o
guidata(hObject, handles);


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.

function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
        
             %k = get(handles.filename, 'String');
             %size(k, 2)
             Cp = get(gca, 'CurrentPoint');
             if( (Cp(1, 2) > 0) & (Cp(1, 2) < 480) & (Cp(1, 1) > 0) & (Cp(1, 1) < 640))
                 Q1 = Cp(1, 1);
                 Q2 = Cp(1, 2);
                %disp('here');
                 handles = guidata(hObject);
                set(handles.filename, 'Value', Cp(1, 2));
                set(handles.dir, 'Value', Cp(1, 1));
                r11 = get(handles.dir, 'Value');
                r12 = get(handles.filename, 'Value');
                r11 = round(r11);
                r12 = round(r12);
                %r11
                %r12
                %Cp(1, 2)
                half_height = get(handles.hh, 'Value'); % h_h = z_i
                half_width = get(handles.hw, 'Value'); % h_w = z_o
                file = get(handles.hh, 'String');
                
                C = imread(file);
                if((size(C, 1) / 3) >= (size(C, 2) / 4))
                    rrr = (size(C, 1)) / 480;
                    disp('A1 beg');
                elseif((size(C, 1) / 3) < (size(C, 2) / 4))
                    rrr = (size(C, 2)) / 640;
                    disp('A1 blt');
                end
                %rrr
                D = imresize(C, [(size(C, 1))/rrr (size(C, 2))/rrr]);
                pad = [480 640 0] - size(D);
                pad(pad<0) = 0;
                merged = padarray(D, floor(pad./2));
                cla
                imshow(merged, 'Parent', handles.axeImage);
                
                hold on
                rectangle('Position',[r11-half_height r12-half_width half_height*2 half_width*2], 'LineWidth',3, 'EdgeColor', 'y');
                Gr = imcrop(merged,[r11-half_height r12-half_width half_height*2 half_width*2]);
                GGr = imresize(Gr, [300 400]);
                imshow(GGr, 'Parent', handles.axeHighlight);
                guidata(hObject, handles);
             end
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axeImage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axeImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axeImage


% --- Executes during object creation, after setting all properties.
function axeHighlight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axeHighlight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axeHighlight


% --- Executes on button press in hh.
function hh_Callback(hObject, eventdata, handles)
% hObject    handle to hh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in hw.
function hw_Callback(hObject, eventdata, handles)
% hObject    handle to hw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




