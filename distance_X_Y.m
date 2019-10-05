function dis_matrix = distance_X_Y(X,Y,sigma_2)
%DISTANCE_X_Y 此处显示有关此函数的摘要
%   此处显示详细说明
[N_X,~]=size(X);
[N_Y,~]=size(Y);
dis_matrix=zeros(N_X,N_Y);
for i=1:N_X
    for j=1:N_Y
        dis_matrix(i,j)=sqrt(1+1-2*exp(-(norm(X(i,:)-Y(j,:)))^2/sigma_2));
    end
end
end

