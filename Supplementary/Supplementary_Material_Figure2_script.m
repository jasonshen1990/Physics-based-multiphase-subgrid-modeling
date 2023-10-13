clear all;

% We assume the dissipation ratio epsilon_{mp}/epsilon_{sp} = 1
ur = 1; % mean slip velocity
phi = [0.01 0.05 0.2]; % particle volume fraction
ReD = [5 40 400]; % Reynolds number
d_log = linspace(-1,2,11); % log(D/eta), relative particle size
dr = 1; % dissipation ratio
rho = [0 2.56 1000]; % density ratio 


kr_theo = zeros(length(phi),length(ReD),length(rho),length(d_log));
regime = zeros(length(phi),length(ReD),length(rho),length(d_log));

for i = 1:length(d_log)
    d_log_temp = d_log(i);
    dp = 10^(d_log_temp);
    for j = 1:length(rho)
        rho_temp = rho(j);
        for k = 1:length(ReD)
            ReD_temp = ReD(k);
            for l = 1:length(phi)
                phi_temp = phi(l);
                [kr_theo(l,k,j,i),regime(l,k,j,i)] = kratio(dp,ReD_temp,rho_temp,phi_temp,ur,dr);
            end
        end
    end
end


figure(3)
subplot(3,3,1)
plot(d_log,squeeze(regime(1,1,1,:)),'b+','Linewidth',1.5,'Markersize',8);
hold on;
plot(d_log,squeeze(regime(1,2,1,:)),'ro','Linewidth',1.5,'Markersize',8);
plot(d_log,squeeze(regime(1,3,1,:)),'kd','Linewidth',1.5,'Markersize',8);
grid
axis([-1 2 0 4.5]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',14,'interpreter','Latex');
ylabel('$k_{mp}/k_{sp}$','Fontsize',14,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 1\%$, $u_r = 1$','Fontsize',12,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 1.0 2.0 3.0 4.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17)

subplot(3,3,2)
plot(d_log,squeeze(regime(2,1,1,:)),'b+','Linewidth',1.5,'Markersize',8);
hold on;
plot(d_log,squeeze(regime(2,2,1,:)),'ro','Linewidth',1.5,'Markersize',8);
plot(d_log,squeeze(regime(2,3,1,:)),'kd','Linewidth',1.5,'Markersize',8);
grid
axis([-1 2 0 4.5]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',14,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',14,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 5\%$, $u_r = 1$','Fontsize',12,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 1.0 2.0 3.0 4.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17)

subplot(3,3,3)
plot(d_log,squeeze(regime(3,1,1,:)),'b+','Linewidth',1.5,'Markersize',8);
hold on;
plot(d_log,squeeze(regime(3,2,1,:)),'ro','Linewidth',1.5,'Markersize',8);
plot(d_log,squeeze(regime(3,3,1,:)),'kd','Linewidth',1.5,'Markersize',8);
grid
axis([-1 2 0 4.5]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',14,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',14,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 20\%$, $u_r = 1$','Fontsize',12,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 1.0 2.0 3.0 4.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17)

subplot(3,3,4)
plot(d_log,squeeze(regime(1,1,2,:)),'b+','Linewidth',1.5,'Markersize',8);
hold on;
plot(d_log,squeeze(regime(1,2,2,:)),'ro','Linewidth',1.5,'Markersize',8);
plot(d_log,squeeze(regime(1,3,2,:)),'kd','Linewidth',1.5,'Markersize',8);
grid
axis([-1 2 0 4.5]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',14,'interpreter','Latex');
ylabel('$k_{mp}/k_{sp}$','Fontsize',14,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 1\%$, $u_r = 1$','Fontsize',12,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 1.0 2.0 3.0 4.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17)

subplot(3,3,5)
plot(d_log,squeeze(regime(2,1,2,:)),'b+','Linewidth',1.5,'Markersize',8);
hold on;
plot(d_log,squeeze(regime(2,2,2,:)),'ro','Linewidth',1.5,'Markersize',8);
plot(d_log,squeeze(regime(2,3,2,:)),'kd','Linewidth',1.5,'Markersize',8);
grid
axis([-1 2 0 4.5]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',14,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',14,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 5\%$, $u_r = 1$','Fontsize',12,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 1.0 2.0 3.0 4.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17)

subplot(3,3,6)
plot(d_log,squeeze(regime(3,1,2,:)),'b+','Linewidth',1.5,'Markersize',8);
hold on;
plot(d_log,squeeze(regime(3,2,2,:)),'ro','Linewidth',1.5,'Markersize',8);
plot(d_log,squeeze(regime(3,3,2,:)),'kd','Linewidth',1.5,'Markersize',8);
grid
axis([-1 2 0 4.5]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',14,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',14,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 20\%$, $u_r = 1$','Fontsize',12,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 1.0 2.0 3.0 4.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17)

subplot(3,3,7)
plot(d_log,squeeze(regime(1,1,3,:)),'b+','Linewidth',1.5,'Markersize',8);
hold on;
plot(d_log,squeeze(regime(1,2,3,:)),'ro','Linewidth',1.5,'Markersize',8);
plot(d_log,squeeze(regime(1,3,3,:)),'kd','Linewidth',1.5,'Markersize',8);
grid
axis([-1 2 0 4.5]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',14,'interpreter','Latex');
ylabel('$k_{mp}/k_{sp}$','Fontsize',14,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 1\%$, $u_r = 1$','Fontsize',12,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 1.0 2.0 3.0 4.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17)

subplot(3,3,8)
plot(d_log,squeeze(regime(2,1,3,:)),'b+','Linewidth',1.5,'Markersize',8);
hold on;
plot(d_log,squeeze(regime(2,2,3,:)),'ro','Linewidth',1.5,'Markersize',8);
plot(d_log,squeeze(regime(2,3,3,:)),'kd','Linewidth',1.5,'Markersize',8);
grid
axis([-1 2 0 4.5]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',14,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',14,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 5\%$, $u_r = 1$','Fontsize',12,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 1.0 2.0 3.0 4.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17)

subplot(3,3,9)
plot(d_log,squeeze(regime(3,1,3,:)),'b+','Linewidth',1.5,'Markersize',8);
hold on;
plot(d_log,squeeze(regime(3,2,3,:)),'ro','Linewidth',1.5,'Markersize',8);
plot(d_log,squeeze(regime(3,3,3,:)),'kd','Linewidth',1.5,'Markersize',8);
grid
axis([-1 2 0 4.5]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',14,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',14,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 20\%$, $u_r = 1$','Fontsize',12,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 1.0 2.0 3.0 4.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17)
