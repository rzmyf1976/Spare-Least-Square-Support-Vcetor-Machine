function kernel_matrix = gaussian_kernel_my(X,Y,sigma_2)
%RBF_KERNEL_MY 此处显示有关此函数的摘要
%   此处显示详细说明
[N_X,~]=size(X);
[N_Y,~]=size(Y);
kernel_matrix=zeros(N_X,N_Y);
for i=1:N_X
    for j=1:N_Y
        kernel_matrix(i,j)=exp(-(norm(X(i,:)-Y(j,:)))^2/sigma_2);
    end
end
end

