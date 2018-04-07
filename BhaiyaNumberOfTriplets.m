clc;
clear all;
close all;

%p=[1,1,100;1,0,200;2,0,300;3,0,400;4,0,500;5,0,600];
%function [t] = NumberOfTriplets(p)
OP1=[]; % Output 1
OP2=[]; % Output 2
t1=[];  % Return Output 1
t2=[];  % Return Output 2
n=length(p);
c=1;
for i=1:n           % n is the number of points
    for j=i+1:n
        for k=j+1:n
            A=1/2 * abs(p(i,1)*(p(j,2)-p(k,2))+p(j,1)*(p(k,2)-p(i,2))+p(k,1)*(p(i,2)-p(j,2)));
           if (A ~= 0)
               OP1(c,1)=i;  % 1st vertex i.e P1
               OP1(c,2)=j;  % 2nd vertex i.e P2
               OP1(c,3)=k;  % 3rd vertex i.e P3
               OP1(c,4)=p(i,3); % orientation of P1
               OP1(c,5)=p(j,3); % orientation of P2
               OP1(c,6)=p(k,3); % orientation of P3
               OP1(c,7)=p(i,4); % Type of P1
               OP1(c,8)=p(j,4); % Type of P2
               OP1(c,9)=p(k,4); % Type of P3
               
               
               OP2(c,1)=p(i,1); % x-cordinate of P1 
               OP2(c,2)=p(i,2); % y-cordinate of P1 
               OP2(c,3)=p(j,1); % x-cordinate of P2 
               OP2(c,4)=p(j,2); % y-cordinate of P2 
               OP2(c,5)=p(k,1); % x-cordinate of P3
               OP2(c,6)=p(k,2); % y-cordinate of P3
               OP2(c,7)=p(i,3); % orientation of P1
               OP2(c,8)=p(j,3); % orientation of P2
               OP2(c,9)=p(k,3); % orientation of P3
               OP2(c,10)=p(i,4); % Type of P1
               OP2(c,11)=p(j,4); % Type of P2
               OP2(c,12)=p(k,4); % Type of P3
               c=c+1;
           end
        end
    end
end
t1(:,:)=OP1(:,:);
t2(:,:)=OP2(:,:);
