datatag='smpl0_GM12878_scRNA_seq_original';
load(datatag,'X0','core_idx0','genelist','s_phate0g1','cellcycletag0','armcells');
X=X0(:,cellcycletag0=="G1");

% X=X0(:,core_idx0);
% X=X0; withcycle=true;

s=s_phate0g1;

figure;
% scatter3(s(:,1),s(:,2),s(:,3),10,'filled');
view(-19.5,12)
title('k-NN graph');
axis equal

%%
addpath('k-NN-code\')

n=size(s,1);
samp=(n-10):(n-1);   % sample points to build bootstrap estimate of mean length function

kneighbors=4; % number of neighbors in kNN
S=s';
[dim,N] = size(S);
rrw = S(:);
[kNNgraphlength, Graph] = kNNgraphmex(rrw, N, dim, kneighbors, 1);
Graph = reshape(Graph, kneighbors+1, N );

hold on
     for i = 1 : size(Graph,2)
         for j = 1 : size(Graph,1) 
             line(s([i,Graph(j,i)],1),s([i,Graph(j,i)],2), s([i,Graph(j,i)],3))
         end
     end
%    plot3(rr(:,1),rr(:,2),rr(:,3),'r.')

[t,xyz1]=i_pseudotime_by_splinefit(s);
plot3(xyz1(1,:),xyz1(2,:),xyz1(3,:),'-r','linewidth',4);


%%
Ximp=run_magic(X,true);
figure;
i_plot_pseudotimeseries(Ximp,genelist,t,["IRF4","PRDM1","IRF8"]);
title('Plasmablast:IRF4,PRDM1; Naive B:IRF8')


figure;
scatter3(s(:,1),s(:,2),s(:,3),10,'filled');
