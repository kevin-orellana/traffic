function [] = synclights()
    global t tlc tlcstep ni S bin jgreen nbin
    % set the lights at each iteration
        if t > tlc
            % for each intersection
            for i = 1:ni
                % if there is only one incoming block into the intersection
                if nbin(i) == 1
                    % switch the light of the incoming block
    %                 note: we're negating this and keeping this intersection
    %                 always green
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
end