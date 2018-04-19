clc;clear all;close all;
p = [0.56 0 0.67 1 45 566;0 0 1 0 566 778];

a = (p > 0);

s = zeros(2,3);
for i = 1 : 2
    j = 1;
    while j <= 6
        %fprintf("The value of sum is %d\n",sum(a(i,j:j + 1)));
        s(i,floor(j / 2) + 1) = sum(a(i,j : j + 1));
        j = j + 2;
    end
end
s
[value,p] = max(s,[],2);

p