function tau = simTauReact(n, T_tx, T_dp, T_fb, T_up, P)     % simulated value of mean service time tau on Reactive scheme; T_fa is ignored
    % n is the number of packet transmisted
    % P is the success threshold probability; if a packet have a proba p<=
    % P, then it will be transmitted succesfully

    T_rtt = T_tx + T_dp + T_up + T_fb;
    tau = 0;

    for i=1:n
        p = rand();             % picks a random probability
        while p > P             % while there are transmission failure
            tau = tau + T_rtt;  % add transmission times to tau
            p = rand();         % and try again
        end
        tau = tau + T_rtt;      % add the service time of the successfull transmission (the last one)
    end
    tau = tau/n;            % get the mean value
end