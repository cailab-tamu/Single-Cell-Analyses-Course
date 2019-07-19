W=[0 .8 .6 0 .1 0; .8 0 .8 0 0 0; .6 .8 0 .2 0 0;...
   0 0 .2 0 .8 .7; .1 0 0 .8 0 .8; 0 0 0 .7 .8 0];
D=diag(sum(W));
L=D-W;

[V,~]=eigs(L,2,'smallestreal')

%%
G=graph(W);
figure; 
plot(G,'EdgeLabel',G.Edges.Weight);
L2=full(laplacian(G));
[V2,~]=eigs(L2,2,'smallestreal')
