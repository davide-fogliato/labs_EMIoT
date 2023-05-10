plot(sim_trace(:,1), 100.*((3.3.*sim_trace(:,8))./(sim_trace(:,6).*sim_trace(:,7))))
xlabel('Time [s]') 
ylabel('Efficiency [%]') 
