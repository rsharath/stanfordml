function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, columns(X));
sigma = zeros(1, columns(X));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       
for feat = 1 : columns(X)
	mu(1, feat) = mean(X(:, feat)); 		% compute mean for feature
	sigma(1, feat) = std(X(:, feat)); 		% compute std deviation for feature

	for rval = 1 : rows(X)
		X_norm(rval, feat) = (X(rval, feat) - mu(1, feat)) / sigma(1, feat);
	end
end

%save normalizedValues.dat X_norm

% ============================================================

end
