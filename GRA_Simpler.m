% Load the data
data = Dataset;
data = table2array(data)

% Check if all elements in the dataset are numeric
isnumeric(data)

% Normalize the data using min-max normalization
data_norm = (data - min(data)) ./ (max(data) - min(data));

% Calculate the reference sequence
ref_seq = mean(data_norm, 1);

% Set the smoothing parameter
delta = 0.5;

% Calculate the grey relational coefficient
for i = 1:size(data_norm, 1)
    for j = 1:size(data_norm, 2)
        GRC(i,j) = (min([data_norm(i,j), ref_seq(j)]) + delta * max([data_norm(i,j), ref_seq(j)]) - delta * min([data_norm(i,j), ref_seq(j)])) / (max([data_norm(i,j), ref_seq(j)]) + delta * min([data_norm(i,j), ref_seq(j)]));
    end
end

% Calculate the grey relational grade
GRG = mean(GRC, 2);

% Rank the samples
[~, rank] = sort(GRG, 'descend');

% Display the ranked samples
disp(rank);

% Delete data with rank greater than 20
rank_threshold = 10;
data(rank > rank_threshold, :) = [];
GRG(rank > rank_threshold) = []

% Display the updated ranked samples
disp(rank(rank <= rank_threshold));
disp(rank)
% Create histogram
histogram(GRG);
% Label axes and title
xlabel('Grey Relational Grade');
ylabel('Frequency');
title('Distribution of Grey Relational Grade');
