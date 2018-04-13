function [] = kingsimulator()
    global g_tave g_tstd g_vave g_vstd g_nc g_step g_vmax g_runs g_run
   
    g_runs = 10;
    
    run_init_vel = .1;
    run_end_vel = 2;

    run_init_nc = 20;
    run_end_nc = 60;

    run_init_tlc = 2;
    run_end_tlc = 5;

    g_vave = zeros(1, g_runs);
    g_vstd = zeros(1, g_runs);

    g_tave = zeros(1, g_runs);
    g_tstd = zeros(1, g_runs);

    dt_run_vel = (run_end_vel - run_init_vel) / g_runs;
    dt_run_nc = (run_end_nc - run_init_nc) / g_runs;
    dt_run_tlc = (run_end_nc - run_init_nc) / g_runs;
    
    for g_run=1:g_runs
        simulator(run_init_nc, run_init_tlc, run_init_vel);
%         run_init_nc = run_init_nc + dt_run_nc;
%         run_init_tlc = run_init_tlc + dt_run_tlc;
        run_init_vel = run_init_vel + dt_run_vel;
    end
    disp(g_vave);
    disp(g_vstd);
end
