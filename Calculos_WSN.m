function varargout = Calculos_WSN(varargin)
% CALCULOS_WSN MATLAB code for Calculos_WSN.fig
%      CALCULOS_WSN, by itself, creates a new CALCULOS_WSN or raises the existing
%      singleton*.
%
%      H = CALCULOS_WSN returns the handle to a new CALCULOS_WSN or the handle to
%      the existing singleton*.
%
%      CALCULOS_WSN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULOS_WSN.M with the given input arguments.
%
%      CALCULOS_WSN('Property','Value',...) creates a new CALCULOS_WSN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Calculos_WSN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Calculos_WSN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calculos_WSN

% Last Modified by GUIDE v2.5 24-Mar-2022 16:31:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculos_WSN_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculos_WSN_OutputFcn, ...
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
clc
clear all;

% --- Executes just before Calculos_WSN is made visible.
function Calculos_WSN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Calculos_WSN (see VARARGIN)

% Choose default command line output for Calculos_WSN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Calculos_WSN wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%
axes(handles.axesca); 
bkgrnd=imread('zigbee.PNG'); 
imshow(bkgrnd); 



% --- Outputs from this function are returned to the command line.
function varargout = Calculos_WSN_OutputFcn(hObject, eventdata, handles) 
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

% NodosFinales
nodo1x=[50 75 50 25 150];
nodo1y=[80 250 400 200 150];
tam=length(nodo1x);
nodo2x=[120 200 180 260 260];
nodo2y=[320 360 450 360 300];

nodo3x=[150 240 275 160 300];
nodo3y=[50 220 60 200 140];

% NodosRouters
C1x=[100];
C1y=[200];
C2x=[180];
C2y=[280];
C3x=[230];
C3y=[120];


% NodosGateway
Gx=[300];
Gy=[250];

% Grafica
plot(Gx,Gy,'go');
k=5;
% figure(1)

title('Zigbee - Topologia Arbol','FontSize',10)
xlabel('Distancia (m)','FontSize',10);
ylabel('Distancia (m)','FontSize',10);
grid on
text(Gx,Gy,' Gateway', 'Color','blue','FontSize',13);

hold on
% GraficcasNodeRoter
plot(C1x,C1y);
text(C1x,C1y,' Router Node','Color','red');
hold on
plot(C2x,C2y);
text(C2x,C2y,' Router Node','Color','red');
plot(C3x,C3y);
text(C3x,C3y,' Router Node','Color','red');
% GraficarTodosLosNodos
for i=1:5
   plot(nodo1x(i),nodo1y(i),'ro')
   text(nodo1x(i),nodo1y(i),' Nodo')
   plot(nodo2x(i),nodo2y(i),'ro')
   text(nodo2x(i),nodo2y(i),' Nodo')
   plot(nodo3x(i),nodo3y(i),'ro')
   text(nodo3x(i),nodo3y(i),' Nodo')
   hold on
   axis([0 350 0 500])
end
% GraficarNodos-NodosRouters
for i=1:5
   plot(nodo1x(i),nodo1y(i))
   plot(nodo2x(i),nodo2y(i));
   plot(nodo3x(i),nodo3y(i));
   hold on
   axis([0 350 0 500])
   pause(0.5)
   comet([nodo1x(i),C1x],[nodo1y(i),C1y])
   comet([nodo2x(i),C2x],[nodo2y(i),C2y])
   comet([nodo3x(i),C3x],[nodo3y(i),C3y])
   axis([0 350 0 500])
end
% NodoRouter-NodoRouter
for i=1:1
   line([C1x(i),C2x(i)],[C1y(i),C2y(i)],'Color','red','LineStyle','-')
   line([C2x(i),C3x(i)],[C2y(i),C3y(i)],'Color','red','LineStyle','-')
end

% NodoRouter-Gateway
for i=1:1
   line([C2x(i),Gx(i)],[C2y(i),Gy(i)],'Color','blue','LineStyle','-')
   line([C3x(i),Gx(i)],[C3y(i),Gy(i)],'Color','blue','LineStyle','-')
end
axis([0 350 0 500])


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Generacion de Calculos Vtx

tasapulsos=(100e3/16);
vtx=tasapulsos*4;
set(handles.txtvtx,'String',num2str(vtx));

% Tasa Efectiva de Datos
csma_ca=2.368e-3;
dataframeTx=4.256e-3;
tiemporespTx=0.192e-3;
ackTx=0.352e-3;
t=(csma_ca+dataframeTx+tiemporespTx+ackTx);
max=114;

%EfectiveDataRare=(CargaMaximaDatos/TiempoTotal)xTasaBaudios

efectivedatarate=(114*8)/t;

set(handles.txtdata,'String',num2str(efectivedatarate));


function txtvtx_Callback(hObject, eventdata, handles)
% hObject    handle to txtvtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtvtx as text
%        str2double(get(hObject,'String')) returns contents of txtvtx as a double


% --- Executes during object creation, after setting all properties.
function txtvtx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtvtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtdata_Callback(hObject, eventdata, handles)
% hObject    handle to txtdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtdata as text
%        str2double(get(hObject,'String')) returns contents of txtdata as a double


% --- Executes during object creation, after setting all properties.
function txtdata_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Inicio
close(handles.output);