


function [] = kingsimulator()
    global g_tave g_tstd g_vave g_vstd g_nc  g_runs g_run init_nc end_nc fixed_tlc
    global clockmax_queen realtime_simulation 
   
    g_runs = 5;
    
    init_vel = .7;
    end_vel = 1.5;

    init_tlc = 3;
    end_tlc = 5;

    g_vave = zeros(1, g_runs);
    g_vstd = zeros(1, g_runs);

    g_tave = zeros(1, g_runs);
    g_tstd = zeros(1, g_runs);
    
    g_nc = zeros(1, g_runs);

    dt_vel = (end_vel - init_vel) / g_runs;
    dt_nc = (end_nc - init_nc) / g_runs;
    dt_tlc = (end_nc - init_nc) / g_runs;
%     old stuff below ========
%        for g_run=1:g_runs
% %         nc_sim = floor(init_nc + dt_nc);
%          tlc_sim = init_tlc;
%          nc_sim = 30;
%          vel_sim = init_vel;
%         
% %          init_nc = init_nc + dt_nc;
%           init_tlc = init_tlc + dt_tlc;
% %          init_vel = init_vel + dt_vel;
%         simulator(nc_sim, tlc_sim, vel_sim, 100);
%         disp(g_run);
%         
%        end
%     old stuff above ========

       
%     vary number of cars
    count_step = floor(g_runs / 3);
    count = 1;
    
    nc_sim = init_nc;
    
%     for g_run=1:g_runs
%          tlc_sim = fixed_tlc;
%          vel_sim = init_vel;
%          nc_sim = nc_sim + dt_nc;
%          disp(g_run);
%          if (realtime)
%               if (g_run == count)
%              simulator(nc_sim, tlc_sim, vel_sim, clockmax_queen, 1, count);
%              count = count + count_step;
%               else
%                   simulator(nc_sim, tlc_sim, vel_sim, clockmax_queen, 0, count);
%               end
%          
%          else
%              simulator(nc_sim, tlc_sim, vel_sim, clockmax_queen, 0, count);
%          end
%     end
    if (realtime_simulation)
        tlc_sim = fixed_tlc;
        vel_sim = init_vel;
        nc_sim = nc_sim;
        
        simulator(nc_sim, tlc_sim, vel_sim, clockmax_queen, 0, count);         
    else
        for g_run=1:g_runs
             tlc_sim = fixed_tlc;
             vel_sim = init_vel;
             nc_sim = nc_sim + dt_nc;
             
             disp(g_run);

             if (g_run == count)
                 simulator(nc_sim, tlc_sim, vel_sim, clockmax_queen, 1, count);
                 count = count + count_step;
             else
                  simulator(nc_sim, tlc_sim, vel_sim, clockmax_queen, 0, count);
             end
             
        end
          plot_graphs();
    end
    
end
