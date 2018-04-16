function [] = kingsimulator()
    global g_tave g_tstd g_vave g_vstd g_nc g_step g_vmax g_runs g_run
   
    g_runs = 3;
    
    init_vel = .7;
    end_vel = 1.5;

    init_nc = 30;
    end_nc = 90;

    init_tlc = 1;
    end_tlc = 5;

    g_vave = zeros(1, g_runs);
    g_vstd = zeros(1, g_runs);

    g_tave = zeros(1, g_runs);
    g_tstd = zeros(1, g_runs);
    
    g_nc = zeros(1, g_runs);

    dt_vel = (end_vel - init_vel) / g_runs;
    dt_nc = (end_nc - init_nc) / g_runs;
    dt_tlc = (end_nc - init_nc) / g_runs;
    
    
    for g_run=1:g_runs
%         nc_sim = floor(init_nc + dt_nc);
         tlc_sim = init_tlc;
         nc_sim = 30;
        vel_sim = init_vel;
        
%          init_nc = init_nc + dt_nc;
          init_tlc = init_tlc + dt_tlc;
%          init_vel = init_vel + dt_vel;
        simulator(nc_sim, tlc_sim, vel_sim);
        disp(g_run);
    end
%     disp(g_vave);
%     disp(g_vstd);
    plot_graphs();
end
