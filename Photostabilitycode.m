clc
clear
%%
path = dir('F:\New folder\*.xlsx');%fine the file
t_LPmax2 = zeros(50,length(path));
for j=1:length(path)
    data = xlsread([path(j).folder, '\',path(j).name]);%read data
%        data = xlsread([path(j).name]);%read data
    A1 = (path(j).name);
    m1 = find(A1=='_');  
    ind=regexp(A1,'\d','start');
    nameNUM = str2double(A1(ind));
    t_LPmax2(1,j) = nameNUM;
    
    [a,b] = size(data);%data size
    t = data(:,1);%time
    for i=1:b-2
        delteLP = data(:,i+1)-data(:,end);%subtract background
        LPmax = max(delteLP);  %fine Maximum
        [~,index(i)] = min(abs(delteLP-LPmax/2));
        %     index(i) = find(delteLP<LPmax/2,1);  %fine half of the Maximum
        t_LPmax2(i+1,j) = t(index(i));  %fine the time
    end
    clear data 
end