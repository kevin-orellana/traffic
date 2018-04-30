function [] = queensimulator ( clock, time_spent)
    global end_nc init_nc i1_one i2_one
    global clockmax_queen
    global xi_q yi_q i1_o_q i2_o_q
    global realtime_simulation time_alloted
%     we'll only monitor how well the model takes to increasing number of
%     cars
    realtime_simulation = 1;
    time_alloted = time_spent;
    init_nc = 30;
    end_nc = 90;
    
%     Map 1 begin (Diamond shaped) ===============================
    xi_q = [0 .5  .5 2 2 3 3 3 4 4 5.5 5.5 6 ];
    yi_q = [3 .5 5.5 4 2 0 3 6 2 4 5.5 .5 3 ];
     
    i1_o_q = [1 3 8  11 13 12 6 2 2 5 5 4 1 11 10 9 13 8 10 6 5 7 4 9 9 7 4 10];
    i2_o_q = [3 8 11 13 12 6  2 1 5 6 1 3 4 10 8 12 9  4 13 9 4 5 7 5 7 10 10 9];
%     Map 2 end ===============================

%     Map 2 begin (4x4 square) ===============================
%     xi_q = [0 0 0 0 1 1 1 1 2 2 2 2 3 3 3 3];
%     yi_q = [0 1 2 3 3 2 1 0 0 1 2 3 3 2 1 0];
%     i1_o_q = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 1 2 7 10 11 6 5 3];
%     i2_o_q = [2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 9 8 7 10 15 14 11 12 6];
%   Map 2 end ===============================

%    Map 3 begin (Pikasso) ===============================

%     xi_q = [3 6 9 9 6 3 0 0 3.5 5.5 8 8 5.5 3.5 1 1 4 5 7 7 5 4 2 2 4 5 6 6 5 4 3 3];
%     yi_q = [0 0 3 6 9 9 6 3 1 1 3.5 5.5 8 8 5.5 3.5 2 2 4 5 7 7 5 4 3 3 4 5 6 6 5 4];
%     
%     i1_o_q = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 25 26 27 28 29 30 31 32 24 17 18 19 20 21 22 23 1 9 17 26 18 10 3 11 19 28 20 12 5 13 21 30 22 14 7 15 23 32 24 16];
%     i2_o_q = [2 3 4 5 6 7 8 1 10 11 12 13 14 15 16 9 26 27 28 29 30 31 32 25 17 18 19 20 21 22 23 24 9 17 25 18 10 2 11 19 27 20 12 4 13 21 29 22 14 6 15 23 31 24 16 8];
%    Map 3 end (Pikasso) ===============================

    clockmax_queen = clock;
             
    kingsimulator();
    
end

