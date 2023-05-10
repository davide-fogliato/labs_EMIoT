A=load('idle_file1.txt');
B=load('sleep_file1.txt');
plot(A(:,2),A(:,1),B(:,2),B(:,1))
legend('Timeout policy with Idle state','Timeout policy with Sleep state')
xlabel('Timeout [ms]')
ylabel('Tot. energy  [mJ]')
%axis([0 127000 0 31])  %entire graph
axis([0 350 0 0.8])  %to find the minimum
grid on
min_loc_idle=zeros(length(A(:,1)),2);
min_loc_sleep=zeros(length(B(:,1)),2);
m=1;
for n = 1:length(A(:,2))
   if(n==1)
       min_abs_idle=A(n,:);
   else
       if(min_abs_idle(1,1)>A(n,1))
           min_abs_idle=A(n,:);
       end
       if(n>2) && (n<length(A(:,2)))
           if(A(n-1,1)<A(n-2,1)) && (A(n,1)>A(n-1,1))
            min_loc_idle(m,:)=A(n-1,:);
            m=m+1;
           end
       end
   end
end
k=1;
for n = 1:length(B(:,2))
   if(n==1)
       min_abs_sleep=B(n,:);
   else
       if(min_abs_sleep(1,1)>B(n,1))
           min_abs_sleep=B(n,:);
       end
       if(n>2) && (n<length(B(:,2)))
           if(B(n-1,1)<B(n-2,1)) && (B(n,1)>B(n-1,1))
            min_loc_sleep(k,:)=B(n-1,:);
            k=k+1;
           end
       end
   end
end
min_abs_idle
for n = 1:m-1
    if(min_loc_idle(n,1)>0)
        min_loc_idle(n,:)
    end
end
min_abs_sleep
for n = 1:k-1
    if(min_loc_sleep(n,1)>0)
        min_loc_sleep(n,:)
    end
end

