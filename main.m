% c = car index, nc = # of cars
% i = intersection index, ni = # of intersections
% b = block index, nb = # of blocks

format long;
clear % celar previous cars
global nc lastcar nextcar firstcar onroad x y p xd yd bd pd nextb ncmax


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
clockmax = 1000;
% intitialize state of lights for each block (one-way)
S = zeros(1, nb);
dt = 1;
Lmax = max(L);
% calc spawn rate of cars on the map as a factor of time 
% and maximum length of blocks
R = 4/(clockmax*Lmax);
%R = 0.02;
nc = 0;
% cap the number of cars on map
ncmax = 20;
%intialize data strucutres containing the Map info
% simulation data structures to keep track of cars on map
firstcar = zeros(1, nb);
nextcar = zeros(1, ncmax);
lastcar = zeros(1, nb);
onroad = zeros(1, ncmax);
x = zeros(1, ncmax);
y = zeros(1, ncmax);
p = zeros(1, ncmax);
xd = zeros(1, ncmax);
yd = zeros(1, ncmax);
pd = zeros(1, ncmax);
bd = zeros(1, ncmax);
nextb = zeros(1, ncmax);

% commence the simulation 
for clock = 1:clockmax
        t = clock * dt;
    % Traffic Lights
    % At any given time, the traffic light at intersection i is green for
    % exactly one of the bolcks that enter that intersection and red for all
    % the others enter that intersection.
    % Let jgreen(i) be an integer designating which block is the green light,
    % where 1<=jgreen(i)<=nbin(i).
    % Let S(b) be the state of the light at the end of block b, where S = 0
    % denotes red and S = 1 denotes green

    % set the lights at each iteration
    if t > tlc
        % for each intersection
        for i = 1:ni
            % if there is only one incoming block into the intersection
            if nbin(i) == 1
                % switch the light of the incoming block
                S(bin(i,1))  = mod(S(bin(i,1))+1,2);
            else
                % if there is more than one block into the intersection
                % set the light on for the next block entering intersection
                jgreen(i) = jgreen(i) + 1;
                % reset light iteration
                if jgreen(i) > nbin(i)
                    jgreen(i) = 1;
                end
            end
        end
        % increase the time step
        tlc = tlc + tlcstep;
    end
    
    % for each intersection
    for i = 1:ni
        % if number of block entering the intersection is not 1
        if nbin(i) ~= 1
            % for each block entering into intersection
            for j = 1 : nbin(i)
                % state of light of all blocks entering are set to red
                S(bin(i, j)) = 0;
            end
            % set the incoming block of jgreen subscript to green
            b = bin(i, jgreen(i));
            S(b) = 1;
        end
    end
    
    % plot the cars - create them every iteration?
    createcars(xi,yi,i1,nb,ux,uy,L);
    movecars(xi,yi,i1,i2,ux,uy,nbout,bout,L,nb,S,dt);

    plotcars(nc,x,y,onroad)
    %pause

end