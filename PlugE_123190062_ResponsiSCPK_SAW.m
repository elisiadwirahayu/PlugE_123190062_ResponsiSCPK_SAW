function varargout = PlugE_123190062_ResponsiSCPK_SAW(varargin)
% PLUGE_123190062_RESPONSISCPK_SAW MATLAB code for PlugE_123190062_ResponsiSCPK_SAW.fig
%      PLUGE_123190062_RESPONSISCPK_SAW, by itself, creates a new PLUGE_123190062_RESPONSISCPK_SAW or raises the existing
%      singleton*.
%
%      H = PLUGE_123190062_RESPONSISCPK_SAW returns the handle to a new PLUGE_123190062_RESPONSISCPK_SAW or the handle to
%      the existing singleton*.
%
%      PLUGE_123190062_RESPONSISCPK_SAW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLUGE_123190062_RESPONSISCPK_SAW.M with the given input arguments.
%
%      PLUGE_123190062_RESPONSISCPK_SAW('Property','Value',...) creates a new PLUGE_123190062_RESPONSISCPK_SAW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PlugE_123190062_ResponsiSCPK_SAW_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PlugE_123190062_ResponsiSCPK_SAW_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PlugE_123190062_ResponsiSCPK_SAW

% Last Modified by GUIDE v2.5 25-Jun-2021 14:39:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PlugE_123190062_ResponsiSCPK_SAW_OpeningFcn, ...
                   'gui_OutputFcn',  @PlugE_123190062_ResponsiSCPK_SAW_OutputFcn, ...
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


% --- Executes just before PlugE_123190062_ResponsiSCPK_SAW is made visible.
function PlugE_123190062_ResponsiSCPK_SAW_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PlugE_123190062_ResponsiSCPK_SAW (see VARARGIN)

% Choose default command line output for PlugE_123190062_ResponsiSCPK_SAW
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PlugE_123190062_ResponsiSCPK_SAW wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PlugE_123190062_ResponsiSCPK_SAW_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('DATA RUMAH.xlsx');
opts.SelectedVariableNames = {'NO','HARGA','LB','LT','KT','KM','GRS'}; %mengambil data yang diperlukan
data = readtable('DATA RUMAH.xlsx',opts); %membaca tabel
data1 = table2array(data); %data yang akan ditampilkan di dalam tabel
set(handles.uitable1,'data',data1); %menampilkan data di dalam tabel


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1,'data',''); %menghapus data di dalam tabel


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('DATA RUMAH.xlsx');
opts.SelectedVariableNames = (3:8); %mengambil data yang diperlukan, yaitu kolom 3-8
inputX = readtable('DATA RUMAH.xlsx', opts);%input data berdasarkan kriteria
input = table2cell(inputX);
x = table2array(inputX); %input data berdasarkan kriteria
k=[0,1,1,1,1,1];%nilai atribut, dimana 0= atribut negatif &1= atribut positif
w=[0.3,0.2,0.23,0.10,0.07,0.10];%bobot untuk masing-masing kriteria
%menampilkan data
disp ('nilai input x =')
disp (input)
disp ('bobot yang diberikan w =')
disp (w)
disp ('atribut tiap kriteria k =')
disp (k)

%normalisasi matriks
[m n] = size (x); %matriks m x n dengan ukuran sebanyak variabel x (input)
R = zeros (m,n); %membuat matriks R, yang merupakan matriks kosong
Y = zeros (m,n); %membuat matriks Y, yang merupakan titik kosong
for j=1:n,
    if k(j)==1, %statement untuk kriteria dengan atribut keuntungan
        R(:,j) = x(:,j)./max(x(:,j));
    else %statement untuk kriteria dengan atribut biaya
        R(:,j) = min(x(:,j))./x(:,j);
    end;
end;
%menampilkan matriks yang sudah ternormalisasi
disp ('matriks yang sudah ternormalisasi R =')
disp (R)

%tahapan kedua, proses perangkingan
for i=1:m,
    V(i) = sum(w.*R(i,:));
end;

%mencari nilai 20 teratas
opts1 = detectImportOptions('DATA RUMAH.xlsx');
opts1.SelectedVariableNames = ([1,3:8]); %mengambil data yang diperlukan
inputX1 = readtable('DATA RUMAH.xlsx', opts1); %membaca tabel
input1 = table2cell(inputX1);
%proses mengurutkan
V = V.';
V = num2cell(V);
hasil = {input1; V};
hasil = horzcat(hasil{:});
hasilsort = sortrows(hasil, 8, 'descend');
ranked = hasilsort(1:20,:);
%tampilan hasil
disp('Hasil perangkingan 20 teratas =');disp(ranked);
set(handles.uitable2,'Data',ranked);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable2,'data',''); %menghapus data hasil yang ditampilkan

% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
