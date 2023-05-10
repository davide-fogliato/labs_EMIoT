
hold on
plot(sim_trace_seq(1:450,1), sim_trace_seq(1:450,4))
plot(sim_trace_seq(1:450,1), sim_trace_seq(1:450,5))
plot(sim_trace_seq(1:450,1), sim_trace_seq(1:450,11)+sim_trace_seq(1:450,12)+sim_trace_seq(1:450,13)+sim_trace_seq(1:450,14))
xlabel('Time [s]') 
ylabel('Current [I]') 