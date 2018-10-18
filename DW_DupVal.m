function [repeatedValues, numberOfAppearancesOfRepeatedValues] = DW_DupVal(X)
% first retrun is an array of repeatedValues, second return is an array of
% number of appearance of repeated values

uniqueX = unique(X);
countOfX = hist(X,uniqueX);
indexToRepeatedValue = (countOfX~=1);
repeatedValues = uniqueX(indexToRepeatedValue);
numberOfAppearancesOfRepeatedValues = countOfX(indexToRepeatedValue);
end
