% Lattice ladder coefficients pole-zero IIR system
%%
clear all;
close all;

%%
% Inputs
order_num = input('Enter the max power of numerator : ');
order_den = input('Enter the max power of denominator : ');
num_coeff = input('Enter the coefficients of numerator starting from 0 : ');
den_coeff = input('Enter the coefficients of denominator starting from 0 : ');

%%
C = num_coeff;                              % C --> numerator coefficient matrix with each row starting from z^0 at column 1
A = zeros(order_den, order_den+1);          % A --> coefficient matrix with each row starting from z^0 at column 1
B = zeros(order_den, order_den+1);          % B --> coefficient matrix with each row starting from z^0 at column 1
K = zeros(1, order_den);
beta = zeros(1, length(num_coeff));         % beta --> coefficient matrix having highest order coefficient of z as last element

%%
beta(end) = C(end);                         % beta_M-1 --> highest order coefficient i.e. c_M(k) where M is order of numerator (check notes)
A(1,:) = den_coeff;
B(1,:) = fliplr(den_coeff);
K(1) = A(1,end);

%%
[A, B, K] = matrix_sub_func(A, B, K, order_den);
beta = beta_calc_func(C, B, beta, order_num);
A
B
K
beta