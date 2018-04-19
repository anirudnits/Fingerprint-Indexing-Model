function value = LCS(s,t)

answer = zeros(length(s) + 1,length(t) + 1);

for i = 1 : length(t) + 1
    answer(1,i) = 0;
end

for i = 1 : length(s) + 1
     answer(i,1) = 0;
end
     
 for i = 1 : length(s)
     for j = 1 : length(t)
         if int8(s(i)) == int8(t(j))
             answer(i + 1,j + 1) = answer(i,j) + 1;
         else
             answer(i + 1,j + 1) = max(answer(i + 1,j),answer(i,j + 1));
         end
     end
 end
 
 value = answer(length(s) + 1,length(t) + 1);