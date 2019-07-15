load('dbscan_example_data');
clustInd=kmeans(X,2);
figure;
i_myscatter(X,clustInd)

%%
load s1131_cr.mat
X=t_sne;
clustInd=kmeans(X,3);
figure;
i_myscatter(X,clustInd)
