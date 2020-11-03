clear all;
clc;
close all;

%%% Массив входных данных

%%% Пусть есть матрица три на три и мы ищем 
%%% Есть ли горизонтальная и вертикальная линии

%%% Входы по срокам
for i=1:1:500
    
    [Num,inpu(i,:)]=inputting(i);
   
    target(i,:)=zeros(1,10);
    target(i,Num)=1;
    
end

inpu=[inpu./256, ones(size(inpu,1),1)];
   
%%% Верные результаты по строкам



Kol_hid=[100,60]; %%% Размеры скрытых слоёв !!!!! ЭТОТ ВЕКТОР СОЗДАЁТ ВСЮ СЕТЬ

Kol_input=size(inpu,2); %%% Количество входов
Kol_target=size(target,2);  %%% Количество выходов
Kol_sloy=[Kol_input,Kol_hid,Kol_target]; %%% Количество нейронов в слоях

N=length(Kol_sloy'); %%% Количество слоёв

weight   =cell(1,N-1);
delW     =cell(1,N-1);
errorHid =cell(1,N-1);
delta    =cell(1,N-1);
sloy     =cell(1,N);


 %%% Веса со входа до выхода
for i=2:1:N
    weight{i-1}=rand( Kol_sloy(i), Kol_sloy(i-1) )/10;
end
 

a=0.3; %%% Коэффициент обучения


for epoh=1:1:5000
    
    for i=1:1:size(inpu,1)
        
        %%% Подсчёт выхода
        sloy{1}=inpu(i,:);
        sloy=circle(sloy,weight,N);
       
        %%% Обратное распространение
        for H=N:-1:2
            if H==N
                errorHid{H-1}=target(i,:)-sloy{H};
            else
                errorHid{H-1}=errorHid{H}*weight{H};
            end
            delta{H-1}=errorHid{H-1}.*(1-sloy{H}).*sloy{H};
            delW{H-1}=a*delta{H-1}'*sloy{H-1};
        end
        
        %%% Редактирование весов
        for H=1:1:N-1
            weight{H}=weight{H}+delW{H};
        end
        
    end
    
end



in=imread('train/000002-num4.png');

j=0;
for y=1:3:size(in,1)
    for x=1:3:size(in,2)
        j=j+1;
        Im(j)=double(in(y,x));
    end
end

Im=[Im./256, ones(size(Im,1),1)];
% Im=inpu;
sloy{1}=Im;
sloy=circle(sloy,weight,N);
(sloy{end})

function f=activ(aaa)

f=1./(1 + exp(-aaa));

end

function sloy=circle(sloy,weight,N)
for i=1:1:N-1
    sloy{i+1}=activ(sloy{i}*weight{i}');
end
end






