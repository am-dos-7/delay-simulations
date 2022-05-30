function tau = analTauReact(T_tx, T_dp, T_fb, T_up, p)     % analytical value of mean service time tau on Reactive scheme; T_fa is ignored
    tau = (T_tx + T_dp + T_fb + T_up)./p;
end