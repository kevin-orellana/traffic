% c = car index, nc = # of cars
% i = intersection index, ni = # of intersections
% b = block index, nb = # of blocks

global nc lastcar nextcar firstcar x y p nextb ncmax vmax onroad
global aggregateVel clockmax stopR waitT ncb ni nbin bin S nb bout
global t tlc tlcstep jgreen weights

% cap the number of cars on map
ncmax = 30;
tlcstep = 5;
vmax = .5;
format long;

aggregateVel = zeros(1, ncmax);
stopR = zeros(1, ncmax);
waitT = zeros(1, ncmax);
[xi, yi, i1,i2, ni, nb, ux, uy, L] = plotroad();

% Note that nbin, bin can be derived from i2, and that nout, bout can be
% derived from i1, as follows:
nbin = zeros(ni,1);
nbout = zeros(ni,1);
% for each intersection calculate total number of incoming
% and exiting intersections
for i = 1:ni
    nbin(i) = sum(i2 == i);
    nbout(i) = sum(i1 == i);
end

nbinmax = max(nbin);
nboutmax = max(nbout);

bin = zeros(ni, nbinmax);
bout = zeros(ni, nboutmax);

% find the identity of the blocks coming in and exiting each intersection
for i = 1:ni
    bin(i, 1:nbin(i)) = find(i2 == i);
    bout(i, 1:nbout(i)) = find(i1 == i);
end
% check1 = sum(nbin) - nb
% check2 = sum(nbout) - nb

% Initialize the street lights, one green per intersection
jgreen = ones(1,ni);
% time itnerval between light changes
tlcstep = 5;
tlc = tlcstep;
% total time of lights
clockmax = 10000;
% intitialize state of lights for each block (one-way)
S = zeros(1, nb);
dt = 1;
Lmax = max(L);
% calc spawn rate of cars on the map as a factor of time 
% and maximum length of blocks
%R = 0.02;
nc = 0;

%intialize data strucutres containing the Map info
% simulation data structures to keep track of cars on map
firstcar = zeros(1, nb);
lastcar = zeros(1, nb);
nextcar = zeros(1, ncmax);
x = zeros(1, ncmax);
y = zeros(1, ncmax);
p = zeros(1, ncmax);
nextb = zeros(1, ncmax);
ncb = zeros(1, nb);
weights = zeros(1, nb);
onroad = zeros(1,ncmax);

% commence the simulation 
for clock = 1:clockmax
       t = clock * dt;
% ===== density-based traffic light system ====
%     calculate number of cars on each block
        sensorized_carsonblock();

%     set lights based on number of cars on block
        sensorized_setlights();

% ===== density-based traffic light system end ====

% ===== synchronous traffic light system ====
%     comment/uncomment the previous two functions to switch system 
%     synclights();
% ===== synchronous traffic light system end ====
    createcars(xi,yi,i1,nb,ux,uy,L);
    movecars(xi,yi,i1,i2,ux,uy,nbout,bout,L,nb,S,dt);
    plotcars(nc,x,y,onroad)
end

carswaiting();
averagevelocity();

