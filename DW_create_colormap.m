% This script is to create a colormap that ranges from dark green to deep
% orange

colormap parula;
cm_parula = colormap;

colormap jet;
cm_jet = colormap;

cm_g2y = cm_parula(33:64,:);

cm_lightg2orange = cm_jet(32:52,:)

cm_darkg2lightg = [linspace(cm_g2y(1,1),cm_lightg2orange(1,1),7)',...
    linspace(cm_g2y(1,2),cm_lightg2orange(1,2),7)',...
    linspace(cm_g2y(1,3),cm_lightg2orange(1,3),7)'];
cm_darkg2lightg(7,:) = [];

cm_darkg2orange = [cm_darkg2lightg;cm_lightg2orange];

figure (1);
colormap (cm_darkg2orange);
colorbar

close;



%%

another colormap
colormap jet

c = jet
new_cm = c;
new_cm(1:5,:)  = [];





