clear; close all; clc
% load and see the data
data = load('ex1data1.txt');
data(1:10,:) % for have a look at data
x = data(:,1); y = data(:,2); % both x and y will contain one column each 
m = length(y); % number of training examples

% plot the data


figure; % open a new figure window
plot(x,y, 'rx', 'Markersize', 10);
ylabel('Profit in $10,000s');
xlabel('Population of City in 10,000s');

% now we will calculate gradient descent
% add column x0 to the feature matrix

X = [ones(m,1), data(:,1)];

% initialize theta
theta = zeros(2,1);
% initialize num_of_iteration and alpha
num_of_iteration = 1500;
alpha = 0.01;
J = zeros(num_of_iteration,1);

for i = 1:num_of_iteration
    h_of_x = (X*theta).- y; % h_of_x so we should get a real number after their multiplication
	
	theta(1)=theta(1)-(alpha/m)*h_of_x'*X(:,1);
	theta(2)=theta(2)-(alpha/m)*h_of_x'*X(:,2);
	% compute cost function
	J(i)=1/(2*m)*sum(h_of_x.^2);
	
end
fprintf('theta1 = %f theta2 = %f \n', theta(1), theta(2));

hold on;
 
%First plot x, the for y calculate y. 
 
%(100X2) * ( 2 X 1) =( 100 X 1 )
 
plot(X(:,2), X*theta, 'r-','linewidth',2);
 
hold off;

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;
predict = [1, 3.5];
figure; % open a new figure window
plot(x,y, 'rx', 'Markersize', 10);
ylabel('Profit in $10,000s');
xlabel('Population of City in 10,000s');

hold on;
for i = predict
	plot(i, [1, i]*theta, 'g*', 'Markersize', 15)



figure;
plot([1:num_of_iteration], J, 'linewidth', 2);
xlabel('num_of_iteration', 'fontsize', 14);
ylabel('cost function', 'fontsize', 14);

end
