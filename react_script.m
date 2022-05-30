% Main script for Reactive scheme:
% Comparison of the analytical et simulation values of the service
% time tau for different values of success probabiliity p

clear;
T_tx = 1;
T_dp = 1;
T_fb = 1;
T_up = 1;

step = 1/5000;                          % simulations points step (p is in abscisses)
start = 0.2;
stop = 1;
n_elements = (stop - start)*1/step + 1;   % number of simulation points
P = start:step:stop;
n_pack = 1000;                          % number of packets, for simulated values
tau_anal = analTauReact(T_tx, T_dp, T_fb, T_up, P);     % analytical value

tau_sim = zeros(1, n_elements);
for i=1:n_elements
    tau_sim(i) = simTauReact(n_pack, T_tx, T_dp, T_fb, T_up, P(1,i));
end

figure(1)
clf
plot(P, tau_sim , 'b', P, tau_anal, 'r')
xlabel('Transmission success probability p')
ylabel('Mean transmission delay')
title('Reactive Scheme')
legend('simulated', 'analytical')