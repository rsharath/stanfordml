function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
% find indices of +ve and -ve examples
pos = find(y==1);
neg = find(y==0);

%plot it
plot (X(pos, 1), X(pos,2), 'b+', 'LineWidth', 2,'MarkerSize', 3);
plot (X(neg, 1), X(neg,2), 'bo', 'MarkerFaceColor', 'r','MarkerSize', 3);

% =========================================================================



hold off;

end
