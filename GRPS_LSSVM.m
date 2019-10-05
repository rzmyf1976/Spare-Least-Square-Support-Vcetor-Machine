function [alpha, b, S, Ctime] = GRPS_LSSVM(X,Y,K_para,C,L,theta1,theta2)
%GRPS_LSSVM 此处显示有关此函数的摘要
%   此处显示详细说明
Begin_clock=tic;
[N,~]=size(X);
index_positive=find(Y(:,1)==1);
index_negative=find(Y(:,1)==-1);
N_positive=length(index_positive);

ratio_positive=N_positive/N;
M_1=round(L*ratio_positive);
  if M_1==0
      M_1=1;
  else
      if M_1==L
          M_1=M_1-1;
      end
  end
M_2=L-M_1;
tao_positive=grps_revised_1(X(index_positive,:),K_para,theta1);
tao_negative=grps_revised_1(X(index_negative,:),K_para,theta2);
[~,index]=sort(tao_positive,'descend');
grp_index_positive=index_positive(index(1:M_1));
[~,index]=sort(tao_negative,'descend');
grp_index_negative=index_negative(index(1:M_2));
S=[grp_index_positive;grp_index_negative];


sum_xi_xi=N;
A=zeros(L+1,L+1);
A(1:L,1:L)=gaussian_kernel_my(X(S,:),X(S,:),K_para)*(1+C*sum_xi_xi);
for i=1:L
    sum_temp=0;
    for k=1:N
        sum_temp=sum_temp+exp(-(norm(X(k,:)-X(S(i),:)))^2/K_para);
    end
    A(i,L+1)=C*sum_temp;
end
A(L+1,1:L)=A(1:L,L+1);
A(L+1,L+1)=C*N;
A=A+eye(L+1)*0.00001;

B=zeros(L+1,1);
for i=1:L
    sum_temp=0;
    for k=1:N
        sum_temp=sum_temp+Y(k,1)*exp(-(norm(X(k,:)-X(S(i),:)))^2/K_para);
    end
    B(i,1)=C*sum_temp;
end
B(L+1,1)=C*sum(Y(:,1));
miu=inv(A)*B;
alpha=miu(1:L,1);
b=miu(L+1,1);
Ctime=toc(Begin_clock);
fprintf('train Ctime=%f\n',Ctime);
end

