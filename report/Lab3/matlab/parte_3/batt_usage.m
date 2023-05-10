i = 0;
for j = 2 : height(sim_trace_2pv)
    if (sim_trace_2pv(j,2) < sim_trace_2pv(j-1,2))
        i = i+1;
    end
end
