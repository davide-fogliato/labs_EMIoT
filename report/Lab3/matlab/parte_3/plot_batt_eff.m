A = sim_trace(:,9).*sim_trace(:,10);
B = A(2:height(A), 1);
B(height(B)+1,1) = 0;
plot(sim_trace(:,1), 100.*(3.3.*sim_trace(:,3))./B)
xlabel('Time [s]') 
ylabel('Efficiency [%]') 
