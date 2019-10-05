function kernel_matrix = gaussian_kernel_my(X,Y,sigma_2)
%RBF_KERNEL_MY �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[N_X,~]=size(X);
[N_Y,~]=size(Y);
kernel_matrix=zeros(N_X,N_Y);
for i=1:N_X
    for j=1:N_Y
        kernel_matrix(i,j)=exp(-(norm(X(i,:)-Y(j,:)))^2/sigma_2);
    end
end
end

