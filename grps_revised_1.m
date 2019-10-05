d=function tao = grps_revised_1(X,K_para,theta)
%GRPS_REVISED 此处显示有关此函数的摘要
%   此处显示详细说明
[n_sample,~]=size(X);
pho_value=zeros(n_sample,1);
xi=zeros(n_sample,1);
mdis=zeros(n_sample,1);
for i=1:n_sample
    d=distance_X_Y(X,X(i,:),K_para);
    pho_value(i,1)=length(find(d<=theta))+1;
    [mdis(i,1),~]=max(d);
end
for i=1:n_sample
    index=find(pho_value>pho_value(i));
    if isempty(index)
        xi(i)=mdis(i);
    else
        d=distance_X_Y(X(index,:),X(i,:),K_para);
        [xi(i,1),~]=min(d);
    end
end
pho_value=normalize(pho_value,'range');
xi=normalize(xi,'range');
tao=min(pho_value,xi);
end
    