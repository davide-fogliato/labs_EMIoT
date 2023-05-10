hold on
plot(sim_trace(:,1), 100.*sim_trace(:,2))
plot(sim_trace_seq(:,1), 100.*sim_trace_seq(:,2))

xlabel('Time [s]') 
ylabel('SOC [%]') 