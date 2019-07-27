function [t,xyz1]=i_pseudotime_by_splinefit(xyz,dim)
% s_selected=s_phate0g1(cell_i,:);
if nargin<2
    dim=1;
end

x=xyz(:,1);
y=xyz(:,2);
z=xyz(:,3);

switch dim
    case 1
[~,i]=max(x);        
    case 2
[~,i]=max(y);        
    case 3
[~,i]=max(z);        
end


[~,j]=sort(pdist2(xyz,xyz(i,:)));
xyz=xyz(j,:)';

x=x(j);
y=y(j);
z=z(j);

s = cumsum([0;sqrt(diff(x(:)).^2 + diff(y(:)).^2 + diff(z(:)).^2)]);
pp1 = splinefit(s,xyz,15,0.75);
xyz1 = ppval(pp1,s);

% D=pdist2(xyz',xyz1');
% [~,t]=min(D,[],2);

% t=sqrt(sum(xyz1.^2-xyz1(:,1).^2));
% t=sqrt(sum((xyz1-xyz1(:,1)).^2));
t=pdist2(xyz1',xyz1(:,1)')';
[~, j_rev] = sort(j); 
t = t(j_rev);

% https://www.mathworks.com/matlabcentral/fileexchange/47042-pathdist
