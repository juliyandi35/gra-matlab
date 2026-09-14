% Load data
X = [10 20 30; 5 10 15; 8 12 16; 12 18 24];

% Normalize data
X_norm = zscore(X);

% Determine reference sequence
ref_seq = mean(X_norm);

% Calculate grey relational coefficients
coefficients = greyrel(X_norm, ref_seq);

% Calculate grey relational grade
grade = greygrade(coefficients);

% Rank sequences
[~, rank] = sort(grade, 'descend');

% Display results
disp('Grey Relational Coefficients:');
disp(coefficients);
disp('Grey Relational Grade:');
disp(grade);
disp('Ranking:');
disp(rank);
