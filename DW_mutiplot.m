%multi_plot

nrows = 3;
ncolumns = 18;
leftmargin = 0.05;
bottommargin = 0.05;
rowspacing = 0.01;
colspacing = 0.005;


figure;
for row=1:nrows
    for col=1:ncolumns
        ncontact = ncolumns*(row-1)+col;
        hh(ncontact)=subplot('Position',... %Specify pos as a four-element vector of the form [left bottom width height]
            [leftmargin+(col-1)*(1-leftmargin)/ncolumns, ...
            1-row*(1-bottommargin)/nrows, ...
            (1-leftmargin)/ncolumns-colspacing, ...
            (1-bottommargin)/nrows-rowspacing]);
        fprintf('here: %d\n', ncontact)
        %if ~max(ncontact==badch)
        plot(qualified_trial{1}(ncontact,:))
        %end
        if row~=nrows
            hh(ncontact).XTick = []; % only keep the xticks of the last row
        end
        if col~=1
            hh(ncontact).YTick = [];%only keep the yticks of the first column
        end
    end
end