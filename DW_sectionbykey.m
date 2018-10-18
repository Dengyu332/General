function c = DW_sectionbykey(str_oi,keychar)
container = '';

c= {};
cn = 0;
for i = 1:length(str_oi)
    if ~isequal(str_oi(i),keychar)
        container = [container, str_oi(i)];
    else
        
        
        container = [container,keychar];
        cn = cn + 1;
        c{cn} = container;
        container = '';
    end

end
end