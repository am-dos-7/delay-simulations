function tau = simTauKpro(n, K, T_tx, T_dp, T_fb, T_up, P)         % simulated value of tau under K-pro scheme
    % n is the number of packets transmitted
    % P is the success probability threshold; a packet with proba p<=P is
    % transmitted succesfully

    T_rtt = K*T_tx + T_dp + T_up + T_fb;
    tau = 0;

    for i=1:n
        p = rand(1, K);             % picks a random K-vector probability
        succ = (p <= P);            % success flag
        succ = find(succ, 1);        % get the index of the first non-null element (the first successfull transmitted replica)
        
        % succ will contain a 1*0 array if the above operation doesn't find any index.
        % so the following step is just an insurance :)
        if succ >= 1 
            l = succ;
        else
            l = 0;
        end
        while l == 0             % while there are transmission failure
            tau = tau + T_rtt;  % add transmission times to tau
            p = rand(1, K);             % picks a random K-vector probability
            succ = (p <= P);            % success flag
            succ = find(succ, 1);        % get the index of the first non-null element (the first successfull transmitted replica)
            if succ >= 1 
                l = succ;
            else
                l = 0;
            end
        end
        tau = tau + l*T_tx + T_dp + T_up + T_fb;      % add the time of the successfull transmission (the last one)
    end
    tau = tau/n;            % get the mean value
end