function y = beta_calc_func(C, B, beta_1, order_num)
% Calculating beta

[rows, columns] = size(B);

for i = order_num:-1:1
    for k = i+1:order_num+1
        beta_1(i) = beta_1(i) + beta_1(k)*B(columns-k+1,i);
        if k == length(C)
            beta_1(i) = C(i) - beta_1(i);
        end
    end
end
y = beta_1;
end