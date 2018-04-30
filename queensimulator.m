function [] = queensimulator (a, b, clock)
    global end_nc init_nc i1_one i2_one
    global clockmax_queen
    global xi_q yi_q i1_o_q i2_o_q
%     we'll only monitor how well the model takes to increasing number of
%     cars

    init_nc = 30;
    end_nc = 90;
    
    xi_q = a;
    yi_q = b;
    clockmax_queen = clock;
    
%     static.. make dynamic
    i1_o_q = [1 3 8  11 13 12 6 2 2 5 5 4 1 11 10 9 13 8 10 6 5 7 4 9 9 7 4 10];
    i2_o_q = [3 8 11 13 12 6  2 1 5 6 1 3 4 10 8 12 9  4 13 9 4 5 7 5 7 10 10 9];
    
    kingsimulator();
    
end

