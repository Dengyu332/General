% This function does permutation test between two samples (can be multiple comparisons)

% In:
%       data1 - matrix of measurements representing one condition (m x n, m is the number of samples, n is the number of comparison times)
%       data2 - matrix of measurements representing a second condition (m x n, m is the number of samples, n is the number of comparison times)
%       n_perm - the number of permutations (default: 1000)
%
%       sidedness - whether to test one- or two-sided:
%           'both' - test two-sided (default)
%           'smaller' - test one-sided, alternative hypothesis is that
%                       the mean of sample1 is smaller than the mean of
%                       sample2
%           'larger' - test one-sided, alternative hypothesis is that
%                      the mean of sample1 is larger than the mean of
%                      sample2
%       exact - whether or not to run an exact test, in which all possible
%               combinations are considered. this is only feasible for
%               relatively small sample sizes. the 'permutations' argument
%               will be ignored for an exact test. (1|0, default 0)
%
% Out:  
%       p - row vector of p values for each comparison 
%       observeddifference - row vector of the observed difference between the two
%                            samples, i.e. mean(sample1) - mean(sample2),
%                            for each comparison
%       effectsize - row vector of the effect size for each comparison

% Dengyu Wang 08/02/2018
function [p,observeddifference,effectsize] = permTest(data1,data2,varargin)

% parsing input
p = inputParser;

default_nperm = min(1000,nchoosek(size(data1,1)+ size(data2,1),size(data1,1))); % default permutation times: minimal of 1000 and number of possible combinations

addRequired(p, 'data1', @isnumeric);
addRequired(p, 'data2', @isnumeric);

addOptional(p, 'n_perm',default_nperm, @isnumeric);

addParameter(p, 'sidedness', 'both', @(x) any(validatestring(x,{'both', 'smaller', 'larger'})));
addParameter(p, 'exact' , 0, @isnumeric);

parse(p, data1, data2,varargin{:})

data1 = p.Results.data1;
data2 = p.Results.data2;
n_perm = p.Results.n_perm;
sidedness = p.Results.sidedness;
exact = p.Results.exact;

p = []; observeddifference = []; effectsize = [];

if ~isequal(size(data1,2),size(data2,2)) % check if has same experiment number
    
    error('Experimental number should keep the same between two conditions')
else
    
    for comparison_idx = 1:size(data1,2) % loop through experiments
        allobservations = [data1(:,comparison_idx) ; data2(:,comparison_idx)]; % column vector
        observeddifference(comparison_idx) = nanmean(data1(:,comparison_idx)) - nanmean(data2(:,comparison_idx));
        effectsize(comparison_idx) = observeddifference(comparison_idx) / nanmean([std(data1(:,comparison_idx)), std(data2(:,comparison_idx))]);
        
        if ~exact && n_perm > nchoosek(numel(allobservations), numel(data1(:,comparison_idx)))
            warning(['the number of permutations (%d) is higher than the number of possible combinations (%d);\n' ...
            'consider running an exact test using the ''exact'' argument'], ...
            n_perm, nchoosek(numel(allobservations), numel(data1(:,comparison_idx))));
        end
        
        if exact
            % getting all possible combinations
            allcombinations = nchoosek(1:numel(allobservations), numel(data1(:,comparison_idx))); % each row is a selection of data1;
            n_perm = size(allcombinations, 1);
        end
        
        % running test
        randomdifferences = zeros(1, n_perm); % row vector
        
        for n = 1:n_perm

            % selecting either next combination, or random permutation
            if exact, permutation = [allcombinations(n,:), setdiff(1:numel(allobservations), allcombinations(n,:))];
            else, permutation = randperm(length(allobservations)); end

            % diving into two samples
            randomSample1 = allobservations(permutation(1:length(data1(:,comparison_idx))));
            randomSample2 = allobservations(permutation(length(data1(:,comparison_idx))+1:length(permutation)));

            % saving differences between the two samples
            randomdifferences(n) = nanmean(randomSample1) - nanmean(randomSample2);
        end        
        
        % getting probability of finding observed difference from random permutations
        if strcmp(sidedness, 'both')
            p(comparison_idx) = length(find(abs(randomdifferences) >= abs(observeddifference(comparison_idx)))) / n_perm;
        elseif strcmp(sidedness, 'smaller')
            p(comparison_idx) = length(find(randomdifferences <= observeddifference(comparison_idx))) / n_perm;
        elseif strcmp(sidedness, 'larger')
            p(comparison_idx) = length(find(randomdifferences >= observeddifference(comparison_idx))) / n_perm;
        end
    end
end
end