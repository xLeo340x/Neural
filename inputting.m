function [Num,Im]=inputting(i)
i=60000-i;
try
    s=strcat('train/0',num2str(i),'-num1.png');
    I=imread(s);
    Num=1;
catch
end
try
    s=strcat('train/0',num2str(i),'-num2.png');
    I=imread(s);
    Num=2;
catch
end
try
    s=strcat('train/0',num2str(i),'-num3.png');
    I=imread(s);
    Num=3;
catch
end
try
    s=strcat('train/0',num2str(i),'-num4.png');
    I=imread(s);
    Num=4;
catch
end
try
    s=strcat('train/0',num2str(i),'-num5.png');
    I=imread(s);
    Num=5;
catch
end
try
    s=strcat('train/0',num2str(i),'-num6.png');
    I=imread(s);
    Num=6;
catch
end
try
    s=strcat('train/0',num2str(i),'-num7.png');
    I=imread(s);
    Num=7;
catch
end
try
    s=strcat('train/0',num2str(i),'-num8.png');
    I=imread(s);
    Num=8;
catch
end
try
    s=strcat('train/0',num2str(i),'-num9.png');
    I=imread(s);
    Num=9;
catch
end
try
    s=strcat('train/0',num2str(i),'-num0.png');
    I=imread(s);
    Num=10;
catch
end

j=0;
for y=1:3:size(I,1)
    for x=1:3:size(I,2)
        j=j+1;
        Im(j)=double(I(y,x));
    end
end


size(Im);

end






