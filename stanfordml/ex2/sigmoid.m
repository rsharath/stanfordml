function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

fprintf("size of z = %d %d\n",rows(z), columns(z));
g = 1 ./ (1 + exp(-z));
fprintf("size of sigmoid = %d %d\n", rows(g), columns(g));


% =============================================================

end