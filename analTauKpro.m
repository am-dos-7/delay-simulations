function tau = analTauKpro(K, T_tx, T_dp, T_fb, T_up, p)         % analytical value of tau under K-pro scheme
    delta = (1-p).^K;
%     p_l = p.*(1-p).^(l-1);
    tau = 0;

    for l=1:K
        tau = tau + ((K*T_tx + T_dp + T_fb + T_up)./(1-delta) + T_tx*(l-K)).*(1-p).^(l-1);
    end
%     T_l = 0;
%     for l=1:K
% %         T_l = T_l + (l*T_tx+T_dp+T_fb+T_up).*p.*(1-p).^(l-1);
%         T_l = T_l + (l*T_tx+T_dp+T_fb+T_up).*(1-p).^(l-1);
% %         T_l = T_l + (l*T_tx+T_dp+T_fb+T_up).*(1-p).^(K-l);
%     end
%     tau = (K*T_tx + T_dp + T_fb + T_up).*delta./(1 - delta) + l*T_tx + T_dp + T_fb + T_up;
%     tau = (K*T_tx + T_dp + T_fb + T_up).*delta./(1 - delta) + (l*T_tx + T_dp + T_fb + T_up).*(p+1);
%     tau = (K*T_tx + T_dp + T_fb + T_up).*p_l.*delta./(1 - delta).^2 + (l*T_tx + T_dp + T_fb + T_up).*p_l./(1-delta);
%     tau = (K*T_tx + T_dp + T_fb + T_up).*p_l.*delta./(1 - delta).^2 + (l*T_tx + T_dp + T_fb + T_up).*p_l.*(1+1./(1-delta));
% tau = (K*T_tx + T_dp + T_fb + T_up).*p_l./(1 - delta).^2 + (l*T_tx + T_dp + T_fb + T_up - K*T_tx - T_dp - T_fb - T_up).*p_l./(1-delta);
%     tau = (K*T_tx + T_dp + T_fb + T_up)./(1-delta) + T_l - (K*T_tx + T_dp + T_fb + T_up);

end