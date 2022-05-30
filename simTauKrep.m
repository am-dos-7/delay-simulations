function tau = simTauKrep(n, K, T_tx, T_dp, T_fb, T_up, P)     % simulated value of mean service time tau on K-rep scheme; T_fa is ignored
    % n is the number of packets transmitted
    % P is the success probability threshold; a packet with proba p<=P is
    % transmitted succesfully

    T_rtt = K*T_tx + T_dp + T_up + T_fb;
    tau = 0;

    for i=1:n
        p = rand(1, K);             % picks a random K-vector probability
        succ = sum(p <= P);         % success flag
        succ = (succ >= 1);
        while succ == 0             % while there are transmission failure
            tau = tau + T_rtt;  % add transmission times to tau
            p = rand(1, K);         % and try again
            succ = sum(p <= P);
            succ = (succ >= 1);
        end
        tau = tau + T_rtt;      % add the service time of the successfull transmission (the last one)
    end
    tau = tau/n;            % get the mean value
end