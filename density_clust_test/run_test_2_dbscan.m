load('dbscan_example_data');
epsilon=0.5;
MinPts=10;
clustInd=DBSCAN(X,epsilon,MinPts);
figure;
i_myscatter(X,clustInd)

%%
load s1131_cr.mat
X=t_sne;
epsilon=0.5;
MinPts=10;
clustInd=DBSCAN(X,epsilon,MinPts);
figure;
i_myscatter(X,clustInd)
