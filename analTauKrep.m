function tau = analTauKrep(K, T_tx, T_dp, T_fb, T_up, p)     % analytical value of mean service time tau on K-rep scheme; T_fa is ignored
    delta = (1-p).^K;
    tau = (K*T_tx + T_dp + T_fb + T_up)./(1 - delta);
end