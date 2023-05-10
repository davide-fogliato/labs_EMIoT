hold on
plot(sim_trace(:,1), 100.*sim_trace(:,2))
plot(sim_trace_2pv(:,1), 100.*sim_trace_2pv(:,2))
xlabel('Time [s]') 
ylabel('SOC [%]') 
legend('1 pv panel', '2 pv panels')