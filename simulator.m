function [] = simulator (set_ncmax, set_tlc, set_speedlimit, set_clockmax)
% c = car index, nc = # of cars
% i = intersection index, ni = # of intersections
% b = block index, nb = # of blocks

global nc lastcar nextcar firstcar x y p nextb ncmax vmax onroad
global aggregateVel clockmax stopR waitT ncb ni nbin bin S nb bout
global t tlc tlcstep jgreen weights allV clock L final_weights
global weights_at_t


% cap the number of cars on map
allV = zeros(1);
ncmax = set_ncmax;
tlcstep = set_tlc;
vmax = set_speedlimit;
format long;

aggregateVel = zeros(1, ncmax);
stopR = zeros(1, ncmax);
waitT = zeros(1, ncmax);
[xi, yi, i1,i2, ni, nb, ux, uy] = plotroad();

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

bin;

% Initialize the street lights, one green per intersection
jgreen = ones(1,ni);
% time itnerval between light changes
tlcstep = 5;
tlc = tlcstep;
% total time of lights

clockmax = set_clockmax;
% intitialize state of lights for each block (one-way)
S = zeros(1, nb);
dt = 1;
Lmax = max(L);

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
final_weights = zeros(nb);

% create our set number of cars
createcars(xi,yi,i1,nb,ux,uy,L);

% commence the simulation 

for clock = 1:clockmax
    t = clock * dt;
       
    % array of differentiated weights of all blocks based off 
    % car density     
    weights_at_t = sensorized_setlights();
    movecars(xi,yi,i1,i2,ux,uy,nbout,bout,L,nb,S,dt);
    plotcars(nc,x,y,onroad);
    
end

carswaiting();
averagevelocity();
% plot_allspeed();