clear all;

% We assume the dissipation ratio epsilon_{mp}/epsilon_{sp} = 1
ur = [0 2]; % mean slip velocity
phi = [0.01 0.05 0.2]; % particle volume fraction
ReD = [5 40 400]; % Reynolds number
d_log = linspace(-1,2,11); % log(D/eta), relative particle size
dr = 1; % dissipation ratio
rho = [0 2.56 1000]; % density ratio 


kr_theo = zeros(2,length(ur),length(phi),length(ReD),length(rho),length(d_log));
Reprime = zeros(length(ur),length(phi),length(ReD),length(rho),length(d_log));

for i = 1:length(d_log)
    d_log_temp = d_log(i);
    dp = 10^(d_log_temp);
    for j = 1:length(rho)
        rho_temp = rho(j);
        for k = 1:length(ReD)
            ReD_temp = ReD(k);
            for l = 1:length(phi)
                phi_temp = phi(l);
                for m = 1:length(ur)
                    ur_temp = ur(m);
                    [kr_theo(1,m,l,k,j,i),kr_theo(2,m,l,k,j,i),Reprime(m,l,k,j,i)] = kratio(dp,ReD_temp,rho_temp,phi_temp,ur_temp,dr);
                end
            end
        end
    end
end

%%%%%%%%%%%%%%% Post-processing %%%%%%%%%%%%%%%%
plot1tempx = 1000*ones(length(ur)*length(ReD),length(d_log),4);
plot1tempy = 1000*ones(length(ur)*length(ReD),length(d_log),4);
n11 = 0; n12 = 0; n13 = 0; n14 = 0;
n21 = 0; n22 = 0; n23 = 0; n24 = 0;
n31 = 0; n32 = 0; n33 = 0; n34 = 0;
n41 = 0; n42 = 0; n43 = 0; n44 = 0;
n51 = 0; n52 = 0; n53 = 0; n54 = 0;
n61 = 0; n62 = 0; n63 = 0; n64 = 0;

for i = 1:length(d_log)
    % rho = 0; phi = 0.01; ReD = 5; ur = 0;
    if(kr_theo(2,1,1,1,1,i) == 1)
        n11 = n11 + 1;
        plot1tempx(1,n11,1) = d_log(i);
        plot1tempy(1,n11,1) = kr_theo(1,1,1,1,1,i);
    elseif(kr_theo(2,1,1,1,1,i) == 2)
        n12 = n12 + 1;
        plot1tempx(1,n12,2) = d_log(i);
        plot1tempy(1,n12,2) = kr_theo(1,1,1,1,1,i);
    elseif(kr_theo(2,1,1,1,1,i) == 3)
        n13 = n13 + 1;
        plot1tempx(1,n13,3) = d_log(i);
        plot1tempy(1,n13,3) = kr_theo(1,1,1,1,1,i); 
    else
        n14 = n14 + 1;
        plot1tempx(1,n14,4) = d_log(i);
        plot1tempy(1,n14,4) = kr_theo(1,1,1,1,1,i);
    end
    % rho = 0; phi = 0.01; ReD = 40; ur = 0;
    if(kr_theo(2,1,1,2,1,i) == 1)
        n21 = n21 + 1;
        plot1tempx(2,n21,1) = d_log(i);
        plot1tempy(2,n21,1) = kr_theo(1,1,1,2,1,i);
    elseif(kr_theo(2,1,1,2,1,i) == 2)
        n22 = n22 + 1;
        plot1tempx(2,n22,2) = d_log(i);
        plot1tempy(2,n22,2) = kr_theo(1,1,1,2,1,i);
    elseif(kr_theo(2,1,1,2,1,i) == 3)
        n23 = n23 + 1;
        plot1tempx(2,n23,3) = d_log(i);
        plot1tempy(2,n23,3) = kr_theo(1,1,1,2,1,i);
    else
        n24 = n24 + 1;
        plot1tempx(2,n24,4) = d_log(i);
        plot1tempy(2,n24,4) = kr_theo(1,1,1,2,1,i);
    end   
    % rho = 0; phi = 0.01; ReD = 400; ur = 0;
    if(kr_theo(2,1,1,3,1,i) == 1)
        n31 = n31 + 1;
        plot1tempx(3,n31,1) = d_log(i);
        plot1tempy(3,n31,1) = kr_theo(1,1,1,3,1,i);
    elseif(kr_theo(2,1,1,3,1,i) == 2)
        n32 = n32 + 1;
        plot1tempx(3,n32,2) = d_log(i);
        plot1tempy(3,n32,2) = kr_theo(1,1,1,3,1,i);
    elseif(kr_theo(2,1,1,3,1,i) == 3)
        n33 = n33 + 1;
        plot1tempx(3,n33,3) = d_log(i);
        plot1tempy(3,n33,3) = kr_theo(1,1,1,3,1,i);
    else
        n34 = n34 + 1;
        plot1tempx(3,n34,4) = d_log(i);
        plot1tempy(3,n34,4) = kr_theo(1,1,1,3,1,i); 
    end   
    % rho = 0; phi = 0.01; ReD = 5; ur = 2;
    if(kr_theo(2,2,1,1,1,i) == 1)
        n41 = n41 + 1;
        plot1tempx(4,n41,1) = d_log(i);
        plot1tempy(4,n41,1) = kr_theo(1,2,1,1,1,i);
    elseif(kr_theo(2,2,1,1,1,i) == 2)
        n42 = n42 + 1;
        plot1tempx(4,n42,2) = d_log(i);
        plot1tempy(4,n42,2) = kr_theo(1,2,1,1,1,i);
    elseif(kr_theo(2,2,1,1,1,i) == 3)
        n43 = n43 + 1;
        plot1tempx(4,n43,3) = d_log(i);
        plot1tempy(4,n43,3) = kr_theo(1,2,1,1,1,i);
    else
        n44 = n44 + 1;
        plot1tempx(4,n44,4) = d_log(i);
        plot1tempy(4,n44,4) = kr_theo(1,2,1,1,1,i);
    end 
    % rho = 0; phi = 0.01; ReD = 40; ur = 2;
    if(kr_theo(2,2,1,2,1,i) == 1)
        n51 = n51 + 1;
        plot1tempx(5,n51,1) = d_log(i);
        plot1tempy(5,n51,1) = kr_theo(1,2,1,2,1,i);
    elseif(kr_theo(2,2,1,2,1,i) == 2)
        n52 = n52 + 1;
        plot1tempx(5,n52,2) = d_log(i);
        plot1tempy(5,n52,2) = kr_theo(1,2,1,2,1,i);
    elseif(kr_theo(2,2,1,2,1,i) == 3)
        n53 = n53 + 1;
        plot1tempx(5,n53,3) = d_log(i);
        plot1tempy(5,n53,3) = kr_theo(1,2,1,2,1,i);
    else
        n54 = n54 + 1;
        plot1tempx(5,n54,4) = d_log(i);
        plot1tempy(5,n54,4) = kr_theo(1,2,1,2,1,i);
    end 
    % rho = 0; phi = 0.01; ReD = 400; ur = 2;
    if(kr_theo(2,2,1,3,1,i) == 1)
        n61 = n61 + 1;
        plot1tempx(6,n61,1) = d_log(i);
        plot1tempy(6,n61,1) = kr_theo(1,2,1,3,1,i);
    elseif(kr_theo(2,2,1,3,1,i) == 2)
        n62 = n62 + 1;
        plot1tempx(6,n62,2) = d_log(i);
        plot1tempy(6,n62,2) = kr_theo(1,2,1,3,1,i);
    elseif(kr_theo(2,2,1,3,1,i) == 3)
        n63 = n63 + 1;
        plot1tempx(6,n63,3) = d_log(i);
        plot1tempy(6,n63,3) = kr_theo(1,2,1,3,1,i);
    else
        n64 = n64 + 1;
        plot1tempx(6,n64,4) = d_log(i);
        plot1tempy(6,n64,4) = kr_theo(1,2,1,3,1,i);
    end     
    
end

figure(1)
subplot(3,3,1)
% line 1: rho = 0; phi = 0.01; ReD = 5; ur = 0;
plot(squeeze(plot1tempx(1,1:n11,1)),squeeze(plot1tempy(1,1:n11,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(1,1:n12,2)),squeeze(plot1tempy(1,1:n12,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n13,3)),squeeze(plot1tempy(1,1:n13,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n14,4)),squeeze(plot1tempy(1,1:n14,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 0; phi = 0.01; ReD = 40; ur = 0;
plot(squeeze(plot1tempx(2,1:n21,1)),squeeze(plot1tempy(2,1:n21,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n22,2)),squeeze(plot1tempy(2,1:n22,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n23,3)),squeeze(plot1tempy(2,1:n23,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n24,4)),squeeze(plot1tempy(2,1:n24,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 0; phi = 0.01; ReD = 400; ur = 0;
plot(squeeze(plot1tempx(3,1:n31,1)),squeeze(plot1tempy(3,1:n31,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n32,2)),squeeze(plot1tempy(3,1:n32,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n33,3)),squeeze(plot1tempy(3,1:n33,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n34,4)),squeeze(plot1tempy(3,1:n34,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.95 1.05]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.95 1.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

figure(3)
subplot(3,3,1)
% line 1: rho = 0; phi = 0.01; ReD = 5; ur = 2;
plot(squeeze(plot1tempx(4,1:n41,1)),squeeze(plot1tempy(4,1:n41,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(4,1:n42,2)),squeeze(plot1tempy(4,1:n42,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n43,3)),squeeze(plot1tempy(4,1:n43,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n44,4)),squeeze(plot1tempy(4,1:n44,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 0; phi = 0.01; ReD = 40; ur = 2;
plot(squeeze(plot1tempx(5,1:n51,1)),squeeze(plot1tempy(5,1:n51,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n52,2)),squeeze(plot1tempy(5,1:n52,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n53,3)),squeeze(plot1tempy(5,1:n53,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n54,4)),squeeze(plot1tempy(5,1:n54,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 0; phi = 0.01; ReD = 400; ur = 2;
plot(squeeze(plot1tempx(6,1:n61,1)),squeeze(plot1tempy(6,1:n61,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n62,2)),squeeze(plot1tempy(6,1:n62,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n63,3)),squeeze(plot1tempy(6,1:n63,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n64,4)),squeeze(plot1tempy(6,1:n64,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.95 1.05]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.95 1.0 1.05]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

%%%%%%%%%%%%%%%%%%%%%%
plot1tempx = 1000*ones(length(ur)*length(ReD),length(d_log),4);
plot1tempy = 1000*ones(length(ur)*length(ReD),length(d_log),4);
n11 = 0; n12 = 0; n13 = 0; n14 = 0;
n21 = 0; n22 = 0; n23 = 0; n24 = 0;
n31 = 0; n32 = 0; n33 = 0; n34 = 0;
n41 = 0; n42 = 0; n43 = 0; n44 = 0;
n51 = 0; n52 = 0; n53 = 0; n54 = 0;
n61 = 0; n62 = 0; n63 = 0; n64 = 0;

for i = 1:length(d_log)
    % rho = 0; phi = 0.05; ReD = 5; ur = 0;
    if(kr_theo(2,1,2,1,1,i) == 1)
        n11 = n11 + 1;
        plot1tempx(1,n11,1) = d_log(i);
        plot1tempy(1,n11,1) = kr_theo(1,1,2,1,1,i);
    elseif(kr_theo(2,1,2,1,1,i) == 2)
        n12 = n12 + 1;
        plot1tempx(1,n12,2) = d_log(i);
        plot1tempy(1,n12,2) = kr_theo(1,1,2,1,1,i);
    elseif(kr_theo(2,1,2,1,1,i) == 3)
        n13 = n13 + 1;
        plot1tempx(1,n13,3) = d_log(i);
        plot1tempy(1,n13,3) = kr_theo(1,1,2,1,1,i); 
    else
        n14 = n14 + 1;
        plot1tempx(1,n14,4) = d_log(i);
        plot1tempy(1,n14,4) = kr_theo(1,1,2,1,1,i);
    end
    % rho = 0; phi = 0.05; ReD = 40; ur = 0;
    if(kr_theo(2,1,2,2,1,i) == 1)
        n21 = n21 + 1;
        plot1tempx(2,n21,1) = d_log(i);
        plot1tempy(2,n21,1) = kr_theo(1,1,2,2,1,i);
    elseif(kr_theo(2,1,2,2,1,i) == 2)
        n22 = n22 + 1;
        plot1tempx(2,n22,2) = d_log(i);
        plot1tempy(2,n22,2) = kr_theo(1,1,2,2,1,i);
    elseif(kr_theo(2,1,2,2,1,i) == 3)
        n23 = n23 + 1;
        plot1tempx(2,n23,3) = d_log(i);
        plot1tempy(2,n23,3) = kr_theo(1,1,2,2,1,i);
    else
        n24 = n24 + 1;
        plot1tempx(2,n24,4) = d_log(i);
        plot1tempy(2,n24,4) = kr_theo(1,1,2,2,1,i);
    end   
    % rho = 0; phi = 0.05; ReD = 400; ur = 0;
    if(kr_theo(2,1,2,3,1,i) == 1)
        n31 = n31 + 1;
        plot1tempx(3,n31,1) = d_log(i);
        plot1tempy(3,n31,1) = kr_theo(1,1,2,3,1,i);
    elseif(kr_theo(2,1,2,3,1,i) == 2)
        n32 = n32 + 1;
        plot1tempx(3,n32,2) = d_log(i);
        plot1tempy(3,n32,2) = kr_theo(1,1,2,3,1,i);
    elseif(kr_theo(2,1,2,3,1,i) == 3)
        n33 = n33 + 1;
        plot1tempx(3,n33,3) = d_log(i);
        plot1tempy(3,n33,3) = kr_theo(1,1,2,3,1,i);
    else
        n34 = n34 + 1;
        plot1tempx(3,n34,4) = d_log(i);
        plot1tempy(3,n34,4) = kr_theo(1,1,2,3,1,i); 
    end   
    % rho = 0; phi = 0.05; ReD = 5; ur = 2;
    if(kr_theo(2,2,2,1,1,i) == 1)
        n41 = n41 + 1;
        plot1tempx(4,n41,1) = d_log(i);
        plot1tempy(4,n41,1) = kr_theo(1,2,2,1,1,i);
    elseif(kr_theo(2,2,2,1,1,i) == 2)
        n42 = n42 + 1;
        plot1tempx(4,n42,2) = d_log(i);
        plot1tempy(4,n42,2) = kr_theo(1,2,2,1,1,i);
    elseif(kr_theo(2,2,2,1,1,i) == 3)
        n43 = n43 + 1;
        plot1tempx(4,n43,3) = d_log(i);
        plot1tempy(4,n43,3) = kr_theo(1,2,2,1,1,i);
    else
        n44 = n44 + 1;
        plot1tempx(4,n44,4) = d_log(i);
        plot1tempy(4,n44,4) = kr_theo(1,2,2,1,1,i);
    end 
    % rho = 0; phi = 0.05; ReD = 40; ur = 2;
    if(kr_theo(2,2,2,2,1,i) == 1)
        n51 = n51 + 1;
        plot1tempx(5,n51,1) = d_log(i);
        plot1tempy(5,n51,1) = kr_theo(1,2,2,2,1,i);
    elseif(kr_theo(2,2,2,2,1,i) == 2)
        n52 = n52 + 1;
        plot1tempx(5,n52,2) = d_log(i);
        plot1tempy(5,n52,2) = kr_theo(1,2,2,2,1,i);
    elseif(kr_theo(2,2,2,2,1,i) == 3)
        n53 = n53 + 1;
        plot1tempx(5,n53,3) = d_log(i);
        plot1tempy(5,n53,3) = kr_theo(1,2,2,2,1,i);
    else
        n54 = n54 + 1;
        plot1tempx(5,n54,4) = d_log(i);
        plot1tempy(5,n54,4) = kr_theo(1,2,2,2,1,i);
    end 
    % rho = 0; phi = 0.05; ReD = 400; ur = 2;
    if(kr_theo(2,2,2,3,1,i) == 1)
        n61 = n61 + 1;
        plot1tempx(6,n61,1) = d_log(i);
        plot1tempy(6,n61,1) = kr_theo(1,2,2,3,1,i);
    elseif(kr_theo(2,2,2,3,1,i) == 2)
        n62 = n62 + 1;
        plot1tempx(6,n62,2) = d_log(i);
        plot1tempy(6,n62,2) = kr_theo(1,2,2,3,1,i);
    elseif(kr_theo(2,2,2,3,1,i) == 3)
        n63 = n63 + 1;
        plot1tempx(6,n63,3) = d_log(i);
        plot1tempy(6,n63,3) = kr_theo(1,2,2,3,1,i);
    else
        n64 = n64 + 1;
        plot1tempx(6,n64,4) = d_log(i);
        plot1tempy(6,n64,4) = kr_theo(1,2,2,3,1,i);
    end     
    
end

figure(1)
subplot(3,3,2)
% line 1: rho = 0; phi = 0.05; ReD = 5; ur = 0;
plot(squeeze(plot1tempx(1,1:n11,1)),squeeze(plot1tempy(1,1:n11,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(1,1:n12,2)),squeeze(plot1tempy(1,1:n12,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n13,3)),squeeze(plot1tempy(1,1:n13,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n14,4)),squeeze(plot1tempy(1,1:n14,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 0; phi = 0.05; ReD = 40; ur = 0;
plot(squeeze(plot1tempx(2,1:n21,1)),squeeze(plot1tempy(2,1:n21,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n22,2)),squeeze(plot1tempy(2,1:n22,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n23,3)),squeeze(plot1tempy(2,1:n23,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n24,4)),squeeze(plot1tempy(2,1:n24,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 0; phi = 0.05; ReD = 400; ur = 0;
plot(squeeze(plot1tempx(3,1:n31,1)),squeeze(plot1tempy(3,1:n31,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n32,2)),squeeze(plot1tempy(3,1:n32,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n33,3)),squeeze(plot1tempy(3,1:n33,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n34,4)),squeeze(plot1tempy(3,1:n34,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.9 1.1]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.9 0.95 1.0 1.05 ]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

figure(3)
subplot(3,3,2)
% line 1: rho = 0; phi = 0.05; ReD = 5; ur = 2;
plot(squeeze(plot1tempx(4,1:n41,1)),squeeze(plot1tempy(4,1:n41,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(4,1:n42,2)),squeeze(plot1tempy(4,1:n42,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n43,3)),squeeze(plot1tempy(4,1:n43,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n44,4)),squeeze(plot1tempy(4,1:n44,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 0; phi = 0.05; ReD = 40; ur = 2;
plot(squeeze(plot1tempx(5,1:n51,1)),squeeze(plot1tempy(5,1:n51,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n52,2)),squeeze(plot1tempy(5,1:n52,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n53,3)),squeeze(plot1tempy(5,1:n53,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n54,4)),squeeze(plot1tempy(5,1:n54,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 0; phi = 0.05; ReD = 400; ur = 2;
plot(squeeze(plot1tempx(6,1:n61,1)),squeeze(plot1tempy(6,1:n61,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n62,2)),squeeze(plot1tempy(6,1:n62,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n63,3)),squeeze(plot1tempy(6,1:n63,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n64,4)),squeeze(plot1tempy(6,1:n64,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.9 1.1]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.9 1.0 1.1 ]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

%%%%%%%%%%%%%%%%%%%%%%
plot1tempx = 1000*ones(length(ur)*length(ReD),length(d_log),4);
plot1tempy = 1000*ones(length(ur)*length(ReD),length(d_log),4);
n11 = 0; n12 = 0; n13 = 0; n14 = 0;
n21 = 0; n22 = 0; n23 = 0; n24 = 0;
n31 = 0; n32 = 0; n33 = 0; n34 = 0;
n41 = 0; n42 = 0; n43 = 0; n44 = 0;
n51 = 0; n52 = 0; n53 = 0; n54 = 0;
n61 = 0; n62 = 0; n63 = 0; n64 = 0;

for i = 1:length(d_log)
    % rho = 0; phi = 0.2; ReD = 5; ur = 0;
    if(kr_theo(2,1,3,1,1,i) == 1)
        n11 = n11 + 1;
        plot1tempx(1,n11,1) = d_log(i);
        plot1tempy(1,n11,1) = kr_theo(1,1,3,1,1,i);
    elseif(kr_theo(2,1,3,1,1,i) == 2)
        n12 = n12 + 1;
        plot1tempx(1,n12,2) = d_log(i);
        plot1tempy(1,n12,2) = kr_theo(1,1,3,1,1,i);
    elseif(kr_theo(2,1,3,1,1,i) == 3)
        n13 = n13 + 1;
        plot1tempx(1,n13,3) = d_log(i);
        plot1tempy(1,n13,3) = kr_theo(1,1,3,1,1,i); 
    else
        n14 = n14 + 1;
        plot1tempx(1,n14,4) = d_log(i);
        plot1tempy(1,n14,4) = kr_theo(1,1,3,1,1,i);
    end
    % rho = 0; phi = 0.2; ReD = 40; ur = 0;
    if(kr_theo(2,1,3,2,1,i) == 1)
        n21 = n21 + 1;
        plot1tempx(2,n21,1) = d_log(i);
        plot1tempy(2,n21,1) = kr_theo(1,1,3,2,1,i);
    elseif(kr_theo(2,1,3,2,1,i) == 2)
        n22 = n22 + 1;
        plot1tempx(2,n22,2) = d_log(i);
        plot1tempy(2,n22,2) = kr_theo(1,1,3,2,1,i);
    elseif(kr_theo(2,1,3,2,1,i) == 3)
        n23 = n23 + 1;
        plot1tempx(2,n23,3) = d_log(i);
        plot1tempy(2,n23,3) = kr_theo(1,1,3,2,1,i);
    else
        n24 = n24 + 1;
        plot1tempx(2,n24,4) = d_log(i);
        plot1tempy(2,n24,4) = kr_theo(1,1,3,2,1,i);
    end   
    % rho = 0; phi = 0.2; ReD = 400; ur = 0;
    if(kr_theo(2,1,3,3,1,i) == 1)
        n31 = n31 + 1;
        plot1tempx(3,n31,1) = d_log(i);
        plot1tempy(3,n31,1) = kr_theo(1,1,3,3,1,i);
    elseif(kr_theo(2,1,3,3,1,i) == 2)
        n32 = n32 + 1;
        plot1tempx(3,n32,2) = d_log(i);
        plot1tempy(3,n32,2) = kr_theo(1,1,3,3,1,i);
    elseif(kr_theo(2,1,3,3,1,i) == 3)
        n33 = n33 + 1;
        plot1tempx(3,n33,3) = d_log(i);
        plot1tempy(3,n33,3) = kr_theo(1,1,3,3,1,i);
    else
        n34 = n34 + 1;
        plot1tempx(3,n34,4) = d_log(i);
        plot1tempy(3,n34,4) = kr_theo(1,1,3,3,1,i); 
    end   
    % rho = 0; phi = 0.2; ReD = 5; ur = 2;
    if(kr_theo(2,2,3,1,1,i) == 1)
        n41 = n41 + 1;
        plot1tempx(4,n41,1) = d_log(i);
        plot1tempy(4,n41,1) = kr_theo(1,2,3,1,1,i);
    elseif(kr_theo(2,2,3,1,1,i) == 2)
        n42 = n42 + 1;
        plot1tempx(4,n42,2) = d_log(i);
        plot1tempy(4,n42,2) = kr_theo(1,2,3,1,1,i);
    elseif(kr_theo(2,2,3,1,1,i) == 3)
        n43 = n43 + 1;
        plot1tempx(4,n43,3) = d_log(i);
        plot1tempy(4,n43,3) = kr_theo(1,2,3,1,1,i);
    else
        n44 = n44 + 1;
        plot1tempx(4,n44,4) = d_log(i);
        plot1tempy(4,n44,4) = kr_theo(1,2,3,1,1,i);
    end 
    % rho = 0; phi = 0.2; ReD = 40; ur = 2;
    if(kr_theo(2,2,3,2,1,i) == 1)
        n51 = n51 + 1;
        plot1tempx(5,n51,1) = d_log(i);
        plot1tempy(5,n51,1) = kr_theo(1,2,3,2,1,i);
    elseif(kr_theo(2,2,3,2,1,i) == 2)
        n52 = n52 + 1;
        plot1tempx(5,n52,2) = d_log(i);
        plot1tempy(5,n52,2) = kr_theo(1,2,3,2,1,i);
    elseif(kr_theo(2,2,3,2,1,i) == 3)
        n53 = n53 + 1;
        plot1tempx(5,n53,3) = d_log(i);
        plot1tempy(5,n53,3) = kr_theo(1,2,3,2,1,i);
    else
        n54 = n54 + 1;
        plot1tempx(5,n54,4) = d_log(i);
        plot1tempy(5,n54,4) = kr_theo(1,2,3,2,1,i);
    end 
    % rho = 0; phi = 0.2; ReD = 400; ur = 2;
    if(kr_theo(2,2,3,3,1,i) == 1)
        n61 = n61 + 1;
        plot1tempx(6,n61,1) = d_log(i);
        plot1tempy(6,n61,1) = kr_theo(1,2,3,3,1,i);
    elseif(kr_theo(2,2,3,3,1,i) == 2)
        n62 = n62 + 1;
        plot1tempx(6,n62,2) = d_log(i);
        plot1tempy(6,n62,2) = kr_theo(1,2,3,3,1,i);
    elseif(kr_theo(2,2,3,3,1,i) == 3)
        n63 = n63 + 1;
        plot1tempx(6,n63,3) = d_log(i);
        plot1tempy(6,n63,3) = kr_theo(1,2,3,3,1,i);
    else
        n64 = n64 + 1;
        plot1tempx(6,n64,4) = d_log(i);
        plot1tempy(6,n64,4) = kr_theo(1,2,3,3,1,i);
    end     
    
end

figure(1)
subplot(3,3,3)
% line 1: rho = 0; phi = 0.2; ReD = 5; ur = 0;
plot(squeeze(plot1tempx(1,1:n11,1)),squeeze(plot1tempy(1,1:n11,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(1,1:n12,2)),squeeze(plot1tempy(1,1:n12,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n13,3)),squeeze(plot1tempy(1,1:n13,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n14,4)),squeeze(plot1tempy(1,1:n14,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 0; phi = 0.2; ReD = 40; ur = 0;
plot(squeeze(plot1tempx(2,1:n21,1)),squeeze(plot1tempy(2,1:n21,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n22,2)),squeeze(plot1tempy(2,1:n22,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n23,3)),squeeze(plot1tempy(2,1:n23,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n24,4)),squeeze(plot1tempy(2,1:n24,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 0; phi = 0.2; ReD = 400; ur = 0;
plot(squeeze(plot1tempx(3,1:n31,1)),squeeze(plot1tempy(3,1:n31,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n32,2)),squeeze(plot1tempy(3,1:n32,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n33,3)),squeeze(plot1tempy(3,1:n33,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n34,4)),squeeze(plot1tempy(3,1:n34,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.8 1.3]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.8 0.9 1.0 1.1 1.2]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

figure(3)
subplot(3,3,3)
% line 1: rho = 0; phi = 0.2; ReD = 5; ur = 2;
plot(squeeze(plot1tempx(4,1:n41,1)),squeeze(plot1tempy(4,1:n41,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(4,1:n42,2)),squeeze(plot1tempy(4,1:n42,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n43,3)),squeeze(plot1tempy(4,1:n43,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n44,4)),squeeze(plot1tempy(4,1:n44,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 0; phi = 0.2; ReD = 40; ur = 2;
plot(squeeze(plot1tempx(5,1:n51,1)),squeeze(plot1tempy(5,1:n51,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n52,2)),squeeze(plot1tempy(5,1:n52,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n53,3)),squeeze(plot1tempy(5,1:n53,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n54,4)),squeeze(plot1tempy(5,1:n54,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 0; phi = 0.2; ReD = 400; ur = 2;
plot(squeeze(plot1tempx(6,1:n61,1)),squeeze(plot1tempy(6,1:n61,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n62,2)),squeeze(plot1tempy(6,1:n62,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n63,3)),squeeze(plot1tempy(6,1:n63,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n64,4)),squeeze(plot1tempy(6,1:n64,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.8 1.3]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.8 0.9 1.0 1.1 1.2]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot1tempx = 1000*ones(length(ur)*length(ReD),length(d_log),4);
plot1tempy = 1000*ones(length(ur)*length(ReD),length(d_log),4);
n11 = 0; n12 = 0; n13 = 0; n14 = 0;
n21 = 0; n22 = 0; n23 = 0; n24 = 0;
n31 = 0; n32 = 0; n33 = 0; n34 = 0;
n41 = 0; n42 = 0; n43 = 0; n44 = 0;
n51 = 0; n52 = 0; n53 = 0; n54 = 0;
n61 = 0; n62 = 0; n63 = 0; n64 = 0;

for i = 1:length(d_log)
    % rho = 2.56; phi = 0.01; ReD = 5; ur = 0;
    if(kr_theo(2,1,1,1,2,i) == 1)
        n11 = n11 + 1;
        plot1tempx(1,n11,1) = d_log(i);
        plot1tempy(1,n11,1) = kr_theo(1,1,1,1,2,i);
    elseif(kr_theo(2,1,1,1,2,i) == 2)
        n12 = n12 + 1;
        plot1tempx(1,n12,2) = d_log(i);
        plot1tempy(1,n12,2) = kr_theo(1,1,1,1,2,i);
    elseif(kr_theo(2,1,1,1,2,i) == 3)
        n13 = n13 + 1;
        plot1tempx(1,n13,3) = d_log(i);
        plot1tempy(1,n13,3) = kr_theo(1,1,1,1,2,i); 
    else
        n14 = n14 + 1;
        plot1tempx(1,n14,4) = d_log(i);
        plot1tempy(1,n14,4) = kr_theo(1,1,1,1,2,i);
    end
    % rho = 2.56; phi = 0.01; ReD = 40; ur = 0;
    if(kr_theo(2,1,1,2,2,i) == 1)
        n21 = n21 + 1;
        plot1tempx(2,n21,1) = d_log(i);
        plot1tempy(2,n21,1) = kr_theo(1,1,1,2,2,i);
    elseif(kr_theo(2,1,1,2,2,i) == 2)
        n22 = n22 + 1;
        plot1tempx(2,n22,2) = d_log(i);
        plot1tempy(2,n22,2) = kr_theo(1,1,1,2,2,i);
    elseif(kr_theo(2,1,1,2,2,i) == 3)
        n23 = n23 + 1;
        plot1tempx(2,n23,3) = d_log(i);
        plot1tempy(2,n23,3) = kr_theo(1,1,1,2,2,i);
    else
        n24 = n24 + 1;
        plot1tempx(2,n24,4) = d_log(i);
        plot1tempy(2,n24,4) = kr_theo(1,1,1,2,2,i);
    end   
    % rho = 2.56; phi = 0.01; ReD = 400; ur = 0;
    if(kr_theo(2,1,1,3,2,i) == 1)
        n31 = n31 + 1;
        plot1tempx(3,n31,1) = d_log(i);
        plot1tempy(3,n31,1) = kr_theo(1,1,1,3,2,i);
    elseif(kr_theo(2,1,1,3,2,i) == 2)
        n32 = n32 + 1;
        plot1tempx(3,n32,2) = d_log(i);
        plot1tempy(3,n32,2) = kr_theo(1,1,1,3,2,i);
    elseif(kr_theo(2,1,1,3,2,i) == 3)
        n33 = n33 + 1;
        plot1tempx(3,n33,3) = d_log(i);
        plot1tempy(3,n33,3) = kr_theo(1,1,1,3,2,i);
    else
        n34 = n34 + 1;
        plot1tempx(3,n34,4) = d_log(i);
        plot1tempy(3,n34,4) = kr_theo(1,1,1,3,2,i); 
    end   
    % rho = 2.56; phi = 0.01; ReD = 5; ur = 2;
    if(kr_theo(2,2,1,1,2,i) == 1)
        n41 = n41 + 1;
        plot1tempx(4,n41,1) = d_log(i);
        plot1tempy(4,n41,1) = kr_theo(1,2,1,1,2,i);
    elseif(kr_theo(2,2,1,1,2,i) == 2)
        n42 = n42 + 1;
        plot1tempx(4,n42,2) = d_log(i);
        plot1tempy(4,n42,2) = kr_theo(1,2,1,1,2,i);
    elseif(kr_theo(2,2,1,1,2,i) == 3)
        n43 = n43 + 1;
        plot1tempx(4,n43,3) = d_log(i);
        plot1tempy(4,n43,3) = kr_theo(1,2,1,1,2,i);
    else
        n44 = n44 + 1;
        plot1tempx(4,n44,4) = d_log(i);
        plot1tempy(4,n44,4) = kr_theo(1,2,1,1,2,i);
    end 
    % rho = 2.56; phi = 0.01; ReD = 40; ur = 2;
    if(kr_theo(2,2,1,2,2,i) == 1)
        n51 = n51 + 1;
        plot1tempx(5,n51,1) = d_log(i);
        plot1tempy(5,n51,1) = kr_theo(1,2,1,2,2,i);
    elseif(kr_theo(2,2,1,2,2,i) == 2)
        n52 = n52 + 1;
        plot1tempx(5,n52,2) = d_log(i);
        plot1tempy(5,n52,2) = kr_theo(1,2,1,2,2,i);
    elseif(kr_theo(2,2,1,2,2,i) == 3)
        n53 = n53 + 1;
        plot1tempx(5,n53,3) = d_log(i);
        plot1tempy(5,n53,3) = kr_theo(1,2,1,2,2,i);
    else
        n54 = n54 + 1;
        plot1tempx(5,n54,4) = d_log(i);
        plot1tempy(5,n54,4) = kr_theo(1,2,1,2,2,i);
    end 
    % rho = 2.56; phi = 0.01; ReD = 400; ur = 2;
    if(kr_theo(2,2,1,3,2,i) == 1)
        n61 = n61 + 1;
        plot1tempx(6,n61,1) = d_log(i);
        plot1tempy(6,n61,1) = kr_theo(1,2,1,3,2,i);
    elseif(kr_theo(2,2,1,3,2,i) == 2)
        n62 = n62 + 1;
        plot1tempx(6,n62,2) = d_log(i);
        plot1tempy(6,n62,2) = kr_theo(1,2,1,3,2,i);
    elseif(kr_theo(2,2,1,3,2,i) == 3)
        n63 = n63 + 1;
        plot1tempx(6,n63,3) = d_log(i);
        plot1tempy(6,n63,3) = kr_theo(1,2,1,3,2,i);
    else
        n64 = n64 + 1;
        plot1tempx(6,n64,4) = d_log(i);
        plot1tempy(6,n64,4) = kr_theo(1,2,1,3,2,i);
    end     
    
end

figure(1)
subplot(3,3,4)
% line 1: rho = 2.56; phi = 0.01; ReD = 5; ur = 0;
plot(squeeze(plot1tempx(1,1:n11,1)),squeeze(plot1tempy(1,1:n11,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(1,1:n12,2)),squeeze(plot1tempy(1,1:n12,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n13,3)),squeeze(plot1tempy(1,1:n13,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n14,4)),squeeze(plot1tempy(1,1:n14,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 2.56; phi = 0.01; ReD = 40; ur = 0;
plot(squeeze(plot1tempx(2,1:n21,1)),squeeze(plot1tempy(2,1:n21,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n22,2)),squeeze(plot1tempy(2,1:n22,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n23,3)),squeeze(plot1tempy(2,1:n23,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n24,4)),squeeze(plot1tempy(2,1:n24,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 2.56; phi = 0.01; ReD = 400; ur = 0;
plot(squeeze(plot1tempx(3,1:n31,1)),squeeze(plot1tempy(3,1:n31,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n32,2)),squeeze(plot1tempy(3,1:n32,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n33,3)),squeeze(plot1tempy(3,1:n33,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n34,4)),squeeze(plot1tempy(3,1:n34,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.95 1.05]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.95 1.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

figure(3)
subplot(3,3,4)
% line 1: rho = 2.56; phi = 0.01; ReD = 5; ur = 2;
plot(squeeze(plot1tempx(4,1:n41,1)),squeeze(plot1tempy(4,1:n41,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(4,1:n42,2)),squeeze(plot1tempy(4,1:n42,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n43,3)),squeeze(plot1tempy(4,1:n43,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n44,4)),squeeze(plot1tempy(4,1:n44,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 2.56; phi = 0.01; ReD = 40; ur = 2;
plot(squeeze(plot1tempx(5,1:n51,1)),squeeze(plot1tempy(5,1:n51,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n52,2)),squeeze(plot1tempy(5,1:n52,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n53,3)),squeeze(plot1tempy(5,1:n53,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n54,4)),squeeze(plot1tempy(5,1:n54,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 2.56; phi = 0.01; ReD = 400; ur = 2;
plot(squeeze(plot1tempx(6,1:n61,1)),squeeze(plot1tempy(6,1:n61,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n62,2)),squeeze(plot1tempy(6,1:n62,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n63,3)),squeeze(plot1tempy(6,1:n63,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n64,4)),squeeze(plot1tempy(6,1:n64,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.95 1.05]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.95 1.0 1.05]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

%%%%%%%%%%%%%%%%%%%%%%
plot1tempx = 1000*ones(length(ur)*length(ReD),length(d_log),4);
plot1tempy = 1000*ones(length(ur)*length(ReD),length(d_log),4);
n11 = 0; n12 = 0; n13 = 0; n14 = 0;
n21 = 0; n22 = 0; n23 = 0; n24 = 0;
n31 = 0; n32 = 0; n33 = 0; n34 = 0;
n41 = 0; n42 = 0; n43 = 0; n44 = 0;
n51 = 0; n52 = 0; n53 = 0; n54 = 0;
n61 = 0; n62 = 0; n63 = 0; n64 = 0;

for i = 1:length(d_log)
    % rho = 2.56; phi = 0.05; ReD = 5; ur = 0;
    if(kr_theo(2,1,2,1,2,i) == 1)
        n11 = n11 + 1;
        plot1tempx(1,n11,1) = d_log(i);
        plot1tempy(1,n11,1) = kr_theo(1,1,2,1,2,i);
    elseif(kr_theo(2,1,2,1,2,i) == 2)
        n12 = n12 + 1;
        plot1tempx(1,n12,2) = d_log(i);
        plot1tempy(1,n12,2) = kr_theo(1,1,2,1,2,i);
    elseif(kr_theo(2,1,2,1,2,i) == 3)
        n13 = n13 + 1;
        plot1tempx(1,n13,3) = d_log(i);
        plot1tempy(1,n13,3) = kr_theo(1,1,2,1,2,i); 
    else
        n14 = n14 + 1;
        plot1tempx(1,n14,4) = d_log(i);
        plot1tempy(1,n14,4) = kr_theo(1,1,2,1,2,i);
    end
    % rho = 2.56; phi = 0.05; ReD = 40; ur = 0;
    if(kr_theo(2,1,2,2,2,i) == 1)
        n21 = n21 + 1;
        plot1tempx(2,n21,1) = d_log(i);
        plot1tempy(2,n21,1) = kr_theo(1,1,2,2,2,i);
    elseif(kr_theo(2,1,2,2,2,i) == 2)
        n22 = n22 + 1;
        plot1tempx(2,n22,2) = d_log(i);
        plot1tempy(2,n22,2) = kr_theo(1,1,2,2,2,i);
    elseif(kr_theo(2,1,2,2,2,i) == 3)
        n23 = n23 + 1;
        plot1tempx(2,n23,3) = d_log(i);
        plot1tempy(2,n23,3) = kr_theo(1,1,2,2,2,i);
    else
        n24 = n24 + 1;
        plot1tempx(2,n24,4) = d_log(i);
        plot1tempy(2,n24,4) = kr_theo(1,1,2,2,2,i);
    end   
    % rho = 2.56; phi = 0.05; ReD = 400; ur = 0;
    if(kr_theo(2,1,2,3,2,i) == 1)
        n31 = n31 + 1;
        plot1tempx(3,n31,1) = d_log(i);
        plot1tempy(3,n31,1) = kr_theo(1,1,2,3,2,i);
    elseif(kr_theo(2,1,2,3,2,i) == 2)
        n32 = n32 + 1;
        plot1tempx(3,n32,2) = d_log(i);
        plot1tempy(3,n32,2) = kr_theo(1,1,2,3,2,i);
    elseif(kr_theo(2,1,2,3,2,i) == 3)
        n33 = n33 + 1;
        plot1tempx(3,n33,3) = d_log(i);
        plot1tempy(3,n33,3) = kr_theo(1,1,2,3,2,i);
    else
        n34 = n34 + 1;
        plot1tempx(3,n34,4) = d_log(i);
        plot1tempy(3,n34,4) = kr_theo(1,1,2,3,2,i); 
    end   
    % rho = 2.56; phi = 0.05; ReD = 5; ur = 2;
    if(kr_theo(2,2,2,1,2,i) == 1)
        n41 = n41 + 1;
        plot1tempx(4,n41,1) = d_log(i);
        plot1tempy(4,n41,1) = kr_theo(1,2,2,1,2,i);
    elseif(kr_theo(2,2,2,1,2,i) == 2)
        n42 = n42 + 1;
        plot1tempx(4,n42,2) = d_log(i);
        plot1tempy(4,n42,2) = kr_theo(1,2,2,1,2,i);
    elseif(kr_theo(2,2,2,1,2,i) == 3)
        n43 = n43 + 1;
        plot1tempx(4,n43,3) = d_log(i);
        plot1tempy(4,n43,3) = kr_theo(1,2,2,1,2,i);
    else
        n44 = n44 + 1;
        plot1tempx(4,n44,4) = d_log(i);
        plot1tempy(4,n44,4) = kr_theo(1,2,2,1,2,i);
    end 
    % rho = 2.56; phi = 0.05; ReD = 40; ur = 2;
    if(kr_theo(2,2,2,2,2,i) == 1)
        n51 = n51 + 1;
        plot1tempx(5,n51,1) = d_log(i);
        plot1tempy(5,n51,1) = kr_theo(1,2,2,2,2,i);
    elseif(kr_theo(2,2,2,2,2,i) == 2)
        n52 = n52 + 1;
        plot1tempx(5,n52,2) = d_log(i);
        plot1tempy(5,n52,2) = kr_theo(1,2,2,2,2,i);
    elseif(kr_theo(2,2,2,2,2,i) == 3)
        n53 = n53 + 1;
        plot1tempx(5,n53,3) = d_log(i);
        plot1tempy(5,n53,3) = kr_theo(1,2,2,2,2,i);
    else
        n54 = n54 + 1;
        plot1tempx(5,n54,4) = d_log(i);
        plot1tempy(5,n54,4) = kr_theo(1,2,2,2,2,i);
    end 
    % rho = 2.56; phi = 0.05; ReD = 400; ur = 2;
    if(kr_theo(2,2,2,3,2,i) == 1)
        n61 = n61 + 1;
        plot1tempx(6,n61,1) = d_log(i);
        plot1tempy(6,n61,1) = kr_theo(1,2,2,3,2,i);
    elseif(kr_theo(2,2,2,3,2,i) == 2)
        n62 = n62 + 1;
        plot1tempx(6,n62,2) = d_log(i);
        plot1tempy(6,n62,2) = kr_theo(1,2,2,3,2,i);
    elseif(kr_theo(2,2,2,3,2,i) == 3)
        n63 = n63 + 1;
        plot1tempx(6,n63,3) = d_log(i);
        plot1tempy(6,n63,3) = kr_theo(1,2,2,3,2,i);
    else
        n64 = n64 + 1;
        plot1tempx(6,n64,4) = d_log(i);
        plot1tempy(6,n64,4) = kr_theo(1,2,2,3,2,i);
    end     
    
end

figure(1)
subplot(3,3,5)
% line 1: rho = 2.56; phi = 0.05; ReD = 5; ur = 0;
plot(squeeze(plot1tempx(1,1:n11,1)),squeeze(plot1tempy(1,1:n11,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(1,1:n12,2)),squeeze(plot1tempy(1,1:n12,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n13,3)),squeeze(plot1tempy(1,1:n13,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n14,4)),squeeze(plot1tempy(1,1:n14,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 2.56; phi = 0.05; ReD = 40; ur = 0;
plot(squeeze(plot1tempx(2,1:n21,1)),squeeze(plot1tempy(2,1:n21,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n22,2)),squeeze(plot1tempy(2,1:n22,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n23,3)),squeeze(plot1tempy(2,1:n23,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n24,4)),squeeze(plot1tempy(2,1:n24,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 2.56; phi = 0.05; ReD = 400; ur = 0;
plot(squeeze(plot1tempx(3,1:n31,1)),squeeze(plot1tempy(3,1:n31,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n32,2)),squeeze(plot1tempy(3,1:n32,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n33,3)),squeeze(plot1tempy(3,1:n33,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n34,4)),squeeze(plot1tempy(3,1:n34,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.9 1.0]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.9 0.95]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

figure(3)
subplot(3,3,5)
% line 1: rho = 2.56; phi = 0.05; ReD = 5; ur = 2;
plot(squeeze(plot1tempx(4,1:n41,1)),squeeze(plot1tempy(4,1:n41,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(4,1:n42,2)),squeeze(plot1tempy(4,1:n42,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n43,3)),squeeze(plot1tempy(4,1:n43,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n44,4)),squeeze(plot1tempy(4,1:n44,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 2.56; phi = 0.05; ReD = 40; ur = 2;
plot(squeeze(plot1tempx(5,1:n51,1)),squeeze(plot1tempy(5,1:n51,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n52,2)),squeeze(plot1tempy(5,1:n52,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n53,3)),squeeze(plot1tempy(5,1:n53,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n54,4)),squeeze(plot1tempy(5,1:n54,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 2.56; phi = 0.05; ReD = 400; ur = 2;
plot(squeeze(plot1tempx(6,1:n61,1)),squeeze(plot1tempy(6,1:n61,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n62,2)),squeeze(plot1tempy(6,1:n62,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n63,3)),squeeze(plot1tempy(6,1:n63,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n64,4)),squeeze(plot1tempy(6,1:n64,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.9 1.1]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.9 1.0 1.1]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

%%%%%%%%%%%%%%%%%%%%%%
plot1tempx = 1000*ones(length(ur)*length(ReD),length(d_log),4);
plot1tempy = 1000*ones(length(ur)*length(ReD),length(d_log),4);
n11 = 0; n12 = 0; n13 = 0; n14 = 0;
n21 = 0; n22 = 0; n23 = 0; n24 = 0;
n31 = 0; n32 = 0; n33 = 0; n34 = 0;
n41 = 0; n42 = 0; n43 = 0; n44 = 0;
n51 = 0; n52 = 0; n53 = 0; n54 = 0;
n61 = 0; n62 = 0; n63 = 0; n64 = 0;

for i = 1:length(d_log)
    % rho = 2.56; phi = 0.2; ReD = 5; ur = 0;
    if(kr_theo(2,1,3,1,2,i) == 1)
        n11 = n11 + 1;
        plot1tempx(1,n11,1) = d_log(i);
        plot1tempy(1,n11,1) = kr_theo(1,1,3,1,2,i);
    elseif(kr_theo(2,1,3,1,2,i) == 2)
        n12 = n12 + 1;
        plot1tempx(1,n12,2) = d_log(i);
        plot1tempy(1,n12,2) = kr_theo(1,1,3,1,2,i);
    elseif(kr_theo(2,1,3,1,2,i) == 3)
        n13 = n13 + 1;
        plot1tempx(1,n13,3) = d_log(i);
        plot1tempy(1,n13,3) = kr_theo(1,1,3,1,2,i); 
    else
        n14 = n14 + 1;
        plot1tempx(1,n14,4) = d_log(i);
        plot1tempy(1,n14,4) = kr_theo(1,1,3,1,2,i);
    end
    % rho = 2.56; phi = 0.2; ReD = 40; ur = 0;
    if(kr_theo(2,1,3,2,2,i) == 1)
        n21 = n21 + 1;
        plot1tempx(2,n21,1) = d_log(i);
        plot1tempy(2,n21,1) = kr_theo(1,1,3,2,2,i);
    elseif(kr_theo(2,1,3,2,2,i) == 2)
        n22 = n22 + 1;
        plot1tempx(2,n22,2) = d_log(i);
        plot1tempy(2,n22,2) = kr_theo(1,1,3,2,2,i);
    elseif(kr_theo(2,1,3,2,2,i) == 3)
        n23 = n23 + 1;
        plot1tempx(2,n23,3) = d_log(i);
        plot1tempy(2,n23,3) = kr_theo(1,1,3,2,2,i);
    else
        n24 = n24 + 1;
        plot1tempx(2,n24,4) = d_log(i);
        plot1tempy(2,n24,4) = kr_theo(1,1,3,2,2,i);
    end   
    % rho = 2.56; phi = 0.2; ReD = 400; ur = 0;
    if(kr_theo(2,1,3,3,2,i) == 1)
        n31 = n31 + 1;
        plot1tempx(3,n31,1) = d_log(i);
        plot1tempy(3,n31,1) = kr_theo(1,1,3,3,2,i);
    elseif(kr_theo(2,1,3,3,2,i) == 2)
        n32 = n32 + 1;
        plot1tempx(3,n32,2) = d_log(i);
        plot1tempy(3,n32,2) = kr_theo(1,1,3,3,2,i);
    elseif(kr_theo(2,1,3,3,2,i) == 3)
        n33 = n33 + 1;
        plot1tempx(3,n33,3) = d_log(i);
        plot1tempy(3,n33,3) = kr_theo(1,1,3,3,2,i);
    else
        n34 = n34 + 1;
        plot1tempx(3,n34,4) = d_log(i);
        plot1tempy(3,n34,4) = kr_theo(1,1,3,3,2,i); 
    end   
    % rho = 2.56; phi = 0.2; ReD = 5; ur = 2;
    if(kr_theo(2,2,3,1,2,i) == 1)
        n41 = n41 + 1;
        plot1tempx(4,n41,1) = d_log(i);
        plot1tempy(4,n41,1) = kr_theo(1,2,3,1,2,i);
    elseif(kr_theo(2,2,3,1,2,i) == 2)
        n42 = n42 + 1;
        plot1tempx(4,n42,2) = d_log(i);
        plot1tempy(4,n42,2) = kr_theo(1,2,3,1,2,i);
    elseif(kr_theo(2,2,3,1,2,i) == 3)
        n43 = n43 + 1;
        plot1tempx(4,n43,3) = d_log(i);
        plot1tempy(4,n43,3) = kr_theo(1,2,3,1,2,i);
    else
        n44 = n44 + 1;
        plot1tempx(4,n44,4) = d_log(i);
        plot1tempy(4,n44,4) = kr_theo(1,2,3,1,2,i);
    end 
    % rho = 2.56; phi = 0.2; ReD = 40; ur = 2;
    if(kr_theo(2,2,3,2,2,i) == 1)
        n51 = n51 + 1;
        plot1tempx(5,n51,1) = d_log(i);
        plot1tempy(5,n51,1) = kr_theo(1,2,3,2,2,i);
    elseif(kr_theo(2,2,3,2,2,i) == 2)
        n52 = n52 + 1;
        plot1tempx(5,n52,2) = d_log(i);
        plot1tempy(5,n52,2) = kr_theo(1,2,3,2,2,i);
    elseif(kr_theo(2,2,3,2,2,i) == 3)
        n53 = n53 + 1;
        plot1tempx(5,n53,3) = d_log(i);
        plot1tempy(5,n53,3) = kr_theo(1,2,3,2,2,i);
    else
        n54 = n54 + 1;
        plot1tempx(5,n54,4) = d_log(i);
        plot1tempy(5,n54,4) = kr_theo(1,2,3,2,2,i);
    end 
    % rho = 2.56; phi = 0.2; ReD = 400; ur = 2;
    if(kr_theo(2,2,3,3,2,i) == 1)
        n61 = n61 + 1;
        plot1tempx(6,n61,1) = d_log(i);
        plot1tempy(6,n61,1) = kr_theo(1,2,3,3,2,i);
    elseif(kr_theo(2,2,3,3,2,i) == 2)
        n62 = n62 + 1;
        plot1tempx(6,n62,2) = d_log(i);
        plot1tempy(6,n62,2) = kr_theo(1,2,3,3,2,i);
    elseif(kr_theo(2,2,3,3,2,i) == 3)
        n63 = n63 + 1;
        plot1tempx(6,n63,3) = d_log(i);
        plot1tempy(6,n63,3) = kr_theo(1,2,3,3,2,i);
    else
        n64 = n64 + 1;
        plot1tempx(6,n64,4) = d_log(i);
        plot1tempy(6,n64,4) = kr_theo(1,2,3,3,2,i);
    end     
    
end

figure(1)
subplot(3,3,6)
% line 1: rho = 2.56; phi = 0.2; ReD = 5; ur = 0;
plot(squeeze(plot1tempx(1,1:n11,1)),squeeze(plot1tempy(1,1:n11,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(1,1:n12,2)),squeeze(plot1tempy(1,1:n12,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n13,3)),squeeze(plot1tempy(1,1:n13,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n14,4)),squeeze(plot1tempy(1,1:n14,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 2.56; phi = 0.2; ReD = 40; ur = 0;
plot(squeeze(plot1tempx(2,1:n21,1)),squeeze(plot1tempy(2,1:n21,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n22,2)),squeeze(plot1tempy(2,1:n22,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n23,3)),squeeze(plot1tempy(2,1:n23,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n24,4)),squeeze(plot1tempy(2,1:n24,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 2.56; phi = 0.2; ReD = 400; ur = 0;
plot(squeeze(plot1tempx(3,1:n31,1)),squeeze(plot1tempy(3,1:n31,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n32,2)),squeeze(plot1tempy(3,1:n32,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n33,3)),squeeze(plot1tempy(3,1:n33,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n34,4)),squeeze(plot1tempy(3,1:n34,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.7 0.9]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.7 0.75 0.8 0.85]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

figure(3)
subplot(3,3,6)
% line 1: rho = 2.56; phi = 0.2; ReD = 5; ur = 2;
plot(squeeze(plot1tempx(4,1:n41,1)),squeeze(plot1tempy(4,1:n41,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(4,1:n42,2)),squeeze(plot1tempy(4,1:n42,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n43,3)),squeeze(plot1tempy(4,1:n43,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n44,4)),squeeze(plot1tempy(4,1:n44,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 2.56; phi = 0.2; ReD = 40; ur = 2;
plot(squeeze(plot1tempx(5,1:n51,1)),squeeze(plot1tempy(5,1:n51,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n52,2)),squeeze(plot1tempy(5,1:n52,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n53,3)),squeeze(plot1tempy(5,1:n53,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n54,4)),squeeze(plot1tempy(5,1:n54,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 2.56; phi = 0.2; ReD = 400; ur = 2;
plot(squeeze(plot1tempx(6,1:n61,1)),squeeze(plot1tempy(6,1:n61,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n62,2)),squeeze(plot1tempy(6,1:n62,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n63,3)),squeeze(plot1tempy(6,1:n63,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n64,4)),squeeze(plot1tempy(6,1:n64,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.7 1.2]);
%xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.7 0.8 0.9 1.0 1.1]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot1tempx = 1000*ones(length(ur)*length(ReD),length(d_log),4);
plot1tempy = 1000*ones(length(ur)*length(ReD),length(d_log),4);
n11 = 0; n12 = 0; n13 = 0; n14 = 0;
n21 = 0; n22 = 0; n23 = 0; n24 = 0;
n31 = 0; n32 = 0; n33 = 0; n34 = 0;
n41 = 0; n42 = 0; n43 = 0; n44 = 0;
n51 = 0; n52 = 0; n53 = 0; n54 = 0;
n61 = 0; n62 = 0; n63 = 0; n64 = 0;

for i = 1:length(d_log)
    % rho = 1000; phi = 0.01; ReD = 5; ur = 0;
    if(kr_theo(2,1,1,1,3,i) == 1)
        n11 = n11 + 1;
        plot1tempx(1,n11,1) = d_log(i);
        plot1tempy(1,n11,1) = kr_theo(1,1,1,1,3,i);
    elseif(kr_theo(2,1,1,1,3,i) == 2)
        n12 = n12 + 1;
        plot1tempx(1,n12,2) = d_log(i);
        plot1tempy(1,n12,2) = kr_theo(1,1,1,1,3,i);
    elseif(kr_theo(2,1,1,1,3,i) == 3)
        n13 = n13 + 1;
        plot1tempx(1,n13,3) = d_log(i);
        plot1tempy(1,n13,3) = kr_theo(1,1,1,1,3,i); 
    else
        n14 = n14 + 1;
        plot1tempx(1,n14,4) = d_log(i);
        plot1tempy(1,n14,4) = kr_theo(1,1,1,1,3,i);
    end
    % rho = 1000; phi = 0.01; ReD = 40; ur = 0;
    if(kr_theo(2,1,1,2,3,i) == 1)
        n21 = n21 + 1;
        plot1tempx(2,n21,1) = d_log(i);
        plot1tempy(2,n21,1) = kr_theo(1,1,1,2,3,i);
    elseif(kr_theo(2,1,1,2,3,i) == 2)
        n22 = n22 + 1;
        plot1tempx(2,n22,2) = d_log(i);
        plot1tempy(2,n22,2) = kr_theo(1,1,1,2,3,i);
    elseif(kr_theo(2,1,1,2,3,i) == 3)
        n23 = n23 + 1;
        plot1tempx(2,n23,3) = d_log(i);
        plot1tempy(2,n23,3) = kr_theo(1,1,1,2,3,i);
    else
        n24 = n24 + 1;
        plot1tempx(2,n24,4) = d_log(i);
        plot1tempy(2,n24,4) = kr_theo(1,1,1,2,3,i);
    end   
    % rho = 1000; phi = 0.01; ReD = 400; ur = 0;
    if(kr_theo(2,1,1,3,3,i) == 1)
        n31 = n31 + 1;
        plot1tempx(3,n31,1) = d_log(i);
        plot1tempy(3,n31,1) = kr_theo(1,1,1,3,3,i);
    elseif(kr_theo(2,1,1,3,3,i) == 2)
        n32 = n32 + 1;
        plot1tempx(3,n32,2) = d_log(i);
        plot1tempy(3,n32,2) = kr_theo(1,1,1,3,3,i);
    elseif(kr_theo(2,1,1,3,3,i) == 3)
        n33 = n33 + 1;
        plot1tempx(3,n33,3) = d_log(i);
        plot1tempy(3,n33,3) = kr_theo(1,1,1,3,3,i);
    else
        n34 = n34 + 1;
        plot1tempx(3,n34,4) = d_log(i);
        plot1tempy(3,n34,4) = kr_theo(1,1,1,3,3,i); 
    end   
    % rho = 1000; phi = 0.01; ReD = 5; ur = 2;
    if(kr_theo(2,2,1,1,3,i) == 1)
        n41 = n41 + 1;
        plot1tempx(4,n41,1) = d_log(i);
        plot1tempy(4,n41,1) = kr_theo(1,2,1,1,3,i);
    elseif(kr_theo(2,2,1,1,3,i) == 2)
        n42 = n42 + 1;
        plot1tempx(4,n42,2) = d_log(i);
        plot1tempy(4,n42,2) = kr_theo(1,2,1,1,3,i);
    elseif(kr_theo(2,2,1,1,3,i) == 3)
        n43 = n43 + 1;
        plot1tempx(4,n43,3) = d_log(i);
        plot1tempy(4,n43,3) = kr_theo(1,2,1,1,3,i);
    else
        n44 = n44 + 1;
        plot1tempx(4,n44,4) = d_log(i);
        plot1tempy(4,n44,4) = kr_theo(1,2,1,1,3,i);
    end 
    % rho = 1000; phi = 0.01; ReD = 40; ur = 2;
    if(kr_theo(2,2,1,2,3,i) == 1)
        n51 = n51 + 1;
        plot1tempx(5,n51,1) = d_log(i);
        plot1tempy(5,n51,1) = kr_theo(1,2,1,2,3,i);
    elseif(kr_theo(2,2,1,2,3,i) == 2)
        n52 = n52 + 1;
        plot1tempx(5,n52,2) = d_log(i);
        plot1tempy(5,n52,2) = kr_theo(1,2,1,2,3,i);
    elseif(kr_theo(2,2,1,2,3,i) == 3)
        n53 = n53 + 1;
        plot1tempx(5,n53,3) = d_log(i);
        plot1tempy(5,n53,3) = kr_theo(1,2,1,2,3,i);
    else
        n54 = n54 + 1;
        plot1tempx(5,n54,4) = d_log(i);
        plot1tempy(5,n54,4) = kr_theo(1,2,1,2,3,i);
    end 
    % rho = 1000; phi = 0.01; ReD = 400; ur = 2;
    if(kr_theo(2,2,1,3,3,i) == 1)
        n61 = n61 + 1;
        plot1tempx(6,n61,1) = d_log(i);
        plot1tempy(6,n61,1) = kr_theo(1,2,1,3,3,i);
    elseif(kr_theo(2,2,1,3,3,i) == 2)
        n62 = n62 + 1;
        plot1tempx(6,n62,2) = d_log(i);
        plot1tempy(6,n62,2) = kr_theo(1,2,1,3,3,i);
    elseif(kr_theo(2,2,1,3,3,i) == 3)
        n63 = n63 + 1;
        plot1tempx(6,n63,3) = d_log(i);
        plot1tempy(6,n63,3) = kr_theo(1,2,1,3,3,i);
    else
        n64 = n64 + 1;
        plot1tempx(6,n64,4) = d_log(i);
        plot1tempy(6,n64,4) = kr_theo(1,2,1,3,3,i);
    end     
    
end


figure(1)
subplot(3,3,7)
% line 1: rho = 1000; phi = 0.01; ReD = 5; ur = 0;
plot(squeeze(plot1tempx(1,1:n11,1)),squeeze(plot1tempy(1,1:n11,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(1,1:n12,2)),squeeze(plot1tempy(1,1:n12,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n13,3)),squeeze(plot1tempy(1,1:n13,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n14,4)),squeeze(plot1tempy(1,1:n14,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 1000; phi = 0.01; ReD = 40; ur = 0;
plot(squeeze(plot1tempx(2,1:n21,1)),squeeze(plot1tempy(2,1:n21,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n22,2)),squeeze(plot1tempy(2,1:n22,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n23,3)),squeeze(plot1tempy(2,1:n23,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n24,4)),squeeze(plot1tempy(2,1:n24,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 1000; phi = 0.01; ReD = 400; ur = 0;
plot(squeeze(plot1tempx(3,1:n31,1)),squeeze(plot1tempy(3,1:n31,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n32,2)),squeeze(plot1tempy(3,1:n32,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n33,3)),squeeze(plot1tempy(3,1:n33,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n34,4)),squeeze(plot1tempy(3,1:n34,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0 1.2]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 0.2 0.4 0.6 0.8 1.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

figure(3)
subplot(3,3,7)
% line 1: rho = 1000; phi = 0.01; ReD = 5; ur = 2;
plot(squeeze(plot1tempx(4,1:n41,1)),squeeze(plot1tempy(4,1:n41,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(4,1:n42,2)),squeeze(plot1tempy(4,1:n42,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n43,3)),squeeze(plot1tempy(4,1:n43,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n44,4)),squeeze(plot1tempy(4,1:n44,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 1000; phi = 0.01; ReD = 40; ur = 2;
plot(squeeze(plot1tempx(5,1:n51,1)),squeeze(plot1tempy(5,1:n51,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n52,2)),squeeze(plot1tempy(5,1:n52,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n53,3)),squeeze(plot1tempy(5,1:n53,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n54,4)),squeeze(plot1tempy(5,1:n54,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 1000; phi = 0.01; ReD = 400; ur = 2;
plot(squeeze(plot1tempx(6,1:n61,1)),squeeze(plot1tempy(6,1:n61,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n62,2)),squeeze(plot1tempy(6,1:n62,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n63,3)),squeeze(plot1tempy(6,1:n63,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n64,4)),squeeze(plot1tempy(6,1:n64,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0 1.2]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0 0.2 0.4 0.6 0.8 1.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

%%%%%%%%%%%%%%%%%%%%%%
plot1tempx = 1000*ones(length(ur)*length(ReD),length(d_log),4);
plot1tempy = 1000*ones(length(ur)*length(ReD),length(d_log),4);
n11 = 0; n12 = 0; n13 = 0; n14 = 0;
n21 = 0; n22 = 0; n23 = 0; n24 = 0;
n31 = 0; n32 = 0; n33 = 0; n34 = 0;
n41 = 0; n42 = 0; n43 = 0; n44 = 0;
n51 = 0; n52 = 0; n53 = 0; n54 = 0;
n61 = 0; n62 = 0; n63 = 0; n64 = 0;

for i = 1:length(d_log)
    % rho = 1000; phi = 0.05; ReD = 5; ur = 0;
    if(kr_theo(2,1,2,1,3,i) == 1)
        n11 = n11 + 1;
        plot1tempx(1,n11,1) = d_log(i);
        plot1tempy(1,n11,1) = kr_theo(1,1,2,1,3,i);
    elseif(kr_theo(2,1,2,1,3,i) == 2)
        n12 = n12 + 1;
        plot1tempx(1,n12,2) = d_log(i);
        plot1tempy(1,n12,2) = kr_theo(1,1,2,1,3,i);
    elseif(kr_theo(2,1,2,1,3,i) == 3)
        n13 = n13 + 1;
        plot1tempx(1,n13,3) = d_log(i);
        plot1tempy(1,n13,3) = kr_theo(1,1,2,1,3,i); 
    else
        n14 = n14 + 1;
        plot1tempx(1,n14,4) = d_log(i);
        plot1tempy(1,n14,4) = kr_theo(1,1,2,1,3,i);
    end
    % rho = 1000; phi = 0.05; ReD = 40; ur = 0;
    if(kr_theo(2,1,2,2,3,i) == 1)
        n21 = n21 + 1;
        plot1tempx(2,n21,1) = d_log(i);
        plot1tempy(2,n21,1) = kr_theo(1,1,2,2,3,i);
    elseif(kr_theo(2,1,2,2,3,i) == 2)
        n22 = n22 + 1;
        plot1tempx(2,n22,2) = d_log(i);
        plot1tempy(2,n22,2) = kr_theo(1,1,2,2,3,i);
    elseif(kr_theo(2,1,2,2,3,i) == 3)
        n23 = n23 + 1;
        plot1tempx(2,n23,3) = d_log(i);
        plot1tempy(2,n23,3) = kr_theo(1,1,2,2,3,i);
    else
        n24 = n24 + 1;
        plot1tempx(2,n24,4) = d_log(i);
        plot1tempy(2,n24,4) = kr_theo(1,1,2,2,3,i);
    end   
    % rho = 1000; phi = 0.05; ReD = 400; ur = 0;
    if(kr_theo(2,1,2,3,3,i) == 1)
        n31 = n31 + 1;
        plot1tempx(3,n31,1) = d_log(i);
        plot1tempy(3,n31,1) = kr_theo(1,1,2,3,3,i);
    elseif(kr_theo(2,1,2,3,3,i) == 2)
        n32 = n32 + 1;
        plot1tempx(3,n32,2) = d_log(i);
        plot1tempy(3,n32,2) = kr_theo(1,1,2,3,3,i);
    elseif(kr_theo(2,1,2,3,3,i) == 3)
        n33 = n33 + 1;
        plot1tempx(3,n33,3) = d_log(i);
        plot1tempy(3,n33,3) = kr_theo(1,1,2,3,3,i);
    else
        n34 = n34 + 1;
        plot1tempx(3,n34,4) = d_log(i);
        plot1tempy(3,n34,4) = kr_theo(1,1,2,3,3,i); 
    end   
    % rho = 1000; phi = 0.05; ReD = 5; ur = 2;
    if(kr_theo(2,2,2,1,3,i) == 1)
        n41 = n41 + 1;
        plot1tempx(4,n41,1) = d_log(i);
        plot1tempy(4,n41,1) = kr_theo(1,2,2,1,3,i);
    elseif(kr_theo(2,2,2,1,3,i) == 2)
        n42 = n42 + 1;
        plot1tempx(4,n42,2) = d_log(i);
        plot1tempy(4,n42,2) = kr_theo(1,2,2,1,3,i);
    elseif(kr_theo(2,2,2,1,3,i) == 3)
        n43 = n43 + 1;
        plot1tempx(4,n43,3) = d_log(i);
        plot1tempy(4,n43,3) = kr_theo(1,2,2,1,3,i);
    else
        n44 = n44 + 1;
        plot1tempx(4,n44,4) = d_log(i);
        plot1tempy(4,n44,4) = kr_theo(1,2,2,1,3,i);
    end 
    % rho = 1000; phi = 0.05; ReD = 40; ur = 2;
    if(kr_theo(2,2,2,2,3,i) == 1)
        n51 = n51 + 1;
        plot1tempx(5,n51,1) = d_log(i);
        plot1tempy(5,n51,1) = kr_theo(1,2,2,2,3,i);
    elseif(kr_theo(2,2,2,2,3,i) == 2)
        n52 = n52 + 1;
        plot1tempx(5,n52,2) = d_log(i);
        plot1tempy(5,n52,2) = kr_theo(1,2,2,2,3,i);
    elseif(kr_theo(2,2,2,2,3,i) == 3)
        n53 = n53 + 1;
        plot1tempx(5,n53,3) = d_log(i);
        plot1tempy(5,n53,3) = kr_theo(1,2,2,2,3,i);
    else
        n54 = n54 + 1;
        plot1tempx(5,n54,4) = d_log(i);
        plot1tempy(5,n54,4) = kr_theo(1,2,2,2,3,i);
    end 
    % rho = 1000; phi = 0.05; ReD = 400; ur = 2;
    if(kr_theo(2,2,2,3,3,i) == 1)
        n61 = n61 + 1;
        plot1tempx(6,n61,1) = d_log(i);
        plot1tempy(6,n61,1) = kr_theo(1,2,2,3,3,i);
    elseif(kr_theo(2,2,2,3,3,i) == 2)
        n62 = n62 + 1;
        plot1tempx(6,n62,2) = d_log(i);
        plot1tempy(6,n62,2) = kr_theo(1,2,2,3,3,i);
    elseif(kr_theo(2,2,2,3,3,i) == 3)
        n63 = n63 + 1;
        plot1tempx(6,n63,3) = d_log(i);
        plot1tempy(6,n63,3) = kr_theo(1,2,2,3,3,i);
    else
        n64 = n64 + 1;
        plot1tempx(6,n64,4) = d_log(i);
        plot1tempy(6,n64,4) = kr_theo(1,2,2,3,3,i);
    end     
    
end


figure(1)
subplot(3,3,8)
% line 1: rho = 1000; phi = 0.05; ReD = 5; ur = 0;
plot(squeeze(plot1tempx(1,1:n11,1)),squeeze(plot1tempy(1,1:n11,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(1,1:n12,2)),squeeze(plot1tempy(1,1:n12,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n13,3)),squeeze(plot1tempy(1,1:n13,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n14,4)),squeeze(plot1tempy(1,1:n14,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 1000; phi = 0.05; ReD = 40; ur = 0;
plot(squeeze(plot1tempx(2,1:n21,1)),squeeze(plot1tempy(2,1:n21,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n22,2)),squeeze(plot1tempy(2,1:n22,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n23,3)),squeeze(plot1tempy(2,1:n23,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n24,4)),squeeze(plot1tempy(2,1:n24,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 1000; phi = 0.05; ReD = 400; ur = 0;
plot(squeeze(plot1tempx(3,1:n31,1)),squeeze(plot1tempy(3,1:n31,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n32,2)),squeeze(plot1tempy(3,1:n32,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n33,3)),squeeze(plot1tempy(3,1:n33,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n34,4)),squeeze(plot1tempy(3,1:n34,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0. 1.2]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.0 0.2 0.4 0.6 0.8 1.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

figure(3)
subplot(3,3,8)
% line 1: rho = 1000; phi = 0.05; ReD = 5; ur = 2;
plot(squeeze(plot1tempx(4,1:n41,1)),squeeze(plot1tempy(4,1:n41,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(4,1:n42,2)),squeeze(plot1tempy(4,1:n42,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n43,3)),squeeze(plot1tempy(4,1:n43,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n44,4)),squeeze(plot1tempy(4,1:n44,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 1000; phi = 0.05; ReD = 40; ur = 2;
plot(squeeze(plot1tempx(5,1:n51,1)),squeeze(plot1tempy(5,1:n51,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n52,2)),squeeze(plot1tempy(5,1:n52,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n53,3)),squeeze(plot1tempy(5,1:n53,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n54,4)),squeeze(plot1tempy(5,1:n54,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 1000; phi = 0.05; ReD = 400; ur = 2;
plot(squeeze(plot1tempx(6,1:n61,1)),squeeze(plot1tempy(6,1:n61,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n62,2)),squeeze(plot1tempy(6,1:n62,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n63,3)),squeeze(plot1tempy(6,1:n63,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n64,4)),squeeze(plot1tempy(6,1:n64,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0. 1.2]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.0 0.2 0.4 0.6 0.8 1.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

%%%%%%%%%%%%%%%%%%%%%%
plot1tempx = 1000*ones(length(ur)*length(ReD),length(d_log),4);
plot1tempy = 1000*ones(length(ur)*length(ReD),length(d_log),4);
n11 = 0; n12 = 0; n13 = 0; n14 = 0;
n21 = 0; n22 = 0; n23 = 0; n24 = 0;
n31 = 0; n32 = 0; n33 = 0; n34 = 0;
n41 = 0; n42 = 0; n43 = 0; n44 = 0;
n51 = 0; n52 = 0; n53 = 0; n54 = 0;
n61 = 0; n62 = 0; n63 = 0; n64 = 0;

for i = 1:length(d_log)
    % rho = 1000; phi = 0.2; ReD = 5; ur = 0;
    if(kr_theo(2,1,3,1,3,i) == 1)
        n11 = n11 + 1;
        plot1tempx(1,n11,1) = d_log(i);
        plot1tempy(1,n11,1) = kr_theo(1,1,3,1,3,i);
    elseif(kr_theo(2,1,3,1,3,i) == 2)
        n12 = n12 + 1;
        plot1tempx(1,n12,2) = d_log(i);
        plot1tempy(1,n12,2) = kr_theo(1,1,3,1,3,i);
    elseif(kr_theo(2,1,3,1,3,i) == 3)
        n13 = n13 + 1;
        plot1tempx(1,n13,3) = d_log(i);
        plot1tempy(1,n13,3) = kr_theo(1,1,3,1,3,i); 
    else
        n14 = n14 + 1;
        plot1tempx(1,n14,4) = d_log(i);
        plot1tempy(1,n14,4) = kr_theo(1,1,3,1,3,i);
    end
    % rho = 1000; phi = 0.2; ReD = 40; ur = 0;
    if(kr_theo(2,1,3,2,3,i) == 1)
        n21 = n21 + 1;
        plot1tempx(2,n21,1) = d_log(i);
        plot1tempy(2,n21,1) = kr_theo(1,1,3,2,3,i);
    elseif(kr_theo(2,1,3,2,3,i) == 2)
        n22 = n22 + 1;
        plot1tempx(2,n22,2) = d_log(i);
        plot1tempy(2,n22,2) = kr_theo(1,1,3,2,3,i);
    elseif(kr_theo(2,1,3,2,3,i) == 3)
        n23 = n23 + 1;
        plot1tempx(2,n23,3) = d_log(i);
        plot1tempy(2,n23,3) = kr_theo(1,1,3,2,3,i);
    else
        n24 = n24 + 1;
        plot1tempx(2,n24,4) = d_log(i);
        plot1tempy(2,n24,4) = kr_theo(1,1,3,2,3,i);
    end   
    % rho = 1000; phi = 0.2; ReD = 400; ur = 0;
    if(kr_theo(2,1,3,3,3,i) == 1)
        n31 = n31 + 1;
        plot1tempx(3,n31,1) = d_log(i);
        plot1tempy(3,n31,1) = kr_theo(1,1,3,3,3,i);
    elseif(kr_theo(2,1,3,3,3,i) == 2)
        n32 = n32 + 1;
        plot1tempx(3,n32,2) = d_log(i);
        plot1tempy(3,n32,2) = kr_theo(1,1,3,3,3,i);
    elseif(kr_theo(2,1,3,3,3,i) == 3)
        n33 = n33 + 1;
        plot1tempx(3,n33,3) = d_log(i);
        plot1tempy(3,n33,3) = kr_theo(1,1,3,3,3,i);
    else
        n34 = n34 + 1;
        plot1tempx(3,n34,4) = d_log(i);
        plot1tempy(3,n34,4) = kr_theo(1,1,3,3,3,i); 
    end   
    % rho = 1000; phi = 0.2; ReD = 5; ur = 2;
    if(kr_theo(2,2,3,1,3,i) == 1)
        n41 = n41 + 1;
        plot1tempx(4,n41,1) = d_log(i);
        plot1tempy(4,n41,1) = kr_theo(1,2,3,1,3,i);
    elseif(kr_theo(2,2,3,1,3,i) == 2)
        n42 = n42 + 1;
        plot1tempx(4,n42,2) = d_log(i);
        plot1tempy(4,n42,2) = kr_theo(1,2,3,1,3,i);
    elseif(kr_theo(2,2,3,1,3,i) == 3)
        n43 = n43 + 1;
        plot1tempx(4,n43,3) = d_log(i);
        plot1tempy(4,n43,3) = kr_theo(1,2,3,1,3,i);
    else
        n44 = n44 + 1;
        plot1tempx(4,n44,4) = d_log(i);
        plot1tempy(4,n44,4) = kr_theo(1,2,3,1,3,i);
    end 
    % rho = 1000; phi = 0.2; ReD = 40; ur = 2;
    if(kr_theo(2,2,3,2,3,i) == 1)
        n51 = n51 + 1;
        plot1tempx(5,n51,1) = d_log(i);
        plot1tempy(5,n51,1) = kr_theo(1,2,3,2,3,i);
    elseif(kr_theo(2,2,3,2,3,i) == 2)
        n52 = n52 + 1;
        plot1tempx(5,n52,2) = d_log(i);
        plot1tempy(5,n52,2) = kr_theo(1,2,3,2,3,i);
    elseif(kr_theo(2,2,3,2,3,i) == 3)
        n53 = n53 + 1;
        plot1tempx(5,n53,3) = d_log(i);
        plot1tempy(5,n53,3) = kr_theo(1,2,3,2,3,i);
    else
        n54 = n54 + 1;
        plot1tempx(5,n54,4) = d_log(i);
        plot1tempy(5,n54,4) = kr_theo(1,2,3,2,3,i);
    end 
    % rho = 1000; phi = 0.2; ReD = 400; ur = 2;
    if(kr_theo(2,2,3,3,3,i) == 1)
        n61 = n61 + 1;
        plot1tempx(6,n61,1) = d_log(i);
        plot1tempy(6,n61,1) = kr_theo(1,2,3,3,3,i);
    elseif(kr_theo(2,2,3,3,3,i) == 2)
        n62 = n62 + 1;
        plot1tempx(6,n62,2) = d_log(i);
        plot1tempy(6,n62,2) = kr_theo(1,2,3,3,3,i);
    elseif(kr_theo(2,2,3,3,3,i) == 3)
        n63 = n63 + 1;
        plot1tempx(6,n63,3) = d_log(i);
        plot1tempy(6,n63,3) = kr_theo(1,2,3,3,3,i);
    else
        n64 = n64 + 1;
        plot1tempx(6,n64,4) = d_log(i);
        plot1tempy(6,n64,4) = kr_theo(1,2,3,3,3,i);
    end     
    
end

figure(1)
subplot(3,3,9)
% line 1: rho = 1000; phi = 0.2; ReD = 5; ur = 0;
plot(squeeze(plot1tempx(1,1:n11,1)),squeeze(plot1tempy(1,1:n11,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(1,1:n12,2)),squeeze(plot1tempy(1,1:n12,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n13,3)),squeeze(plot1tempy(1,1:n13,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(1,1:n14,4)),squeeze(plot1tempy(1,1:n14,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 1000; phi = 0.2; ReD = 40; ur = 0;
plot(squeeze(plot1tempx(2,1:n21,1)),squeeze(plot1tempy(2,1:n21,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n22,2)),squeeze(plot1tempy(2,1:n22,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n23,3)),squeeze(plot1tempy(2,1:n23,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(2,1:n24,4)),squeeze(plot1tempy(2,1:n24,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 1000; phi = 0.2; ReD = 400; ur = 0;
plot(squeeze(plot1tempx(3,1:n31,1)),squeeze(plot1tempy(3,1:n31,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n32,2)),squeeze(plot1tempy(3,1:n32,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n33,3)),squeeze(plot1tempy(3,1:n33,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(3,1:n34,4)),squeeze(plot1tempy(3,1:n34,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.0 1.2]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.0 0.2 0.4 0.6 0.8 1.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;


figure(3)
subplot(3,3,9)
% line 1: rho = 1000; phi = 0.2; ReD = 5; ur = 2;
plot(squeeze(plot1tempx(4,1:n41,1)),squeeze(plot1tempy(4,1:n41,1)),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(squeeze(plot1tempx(4,1:n42,2)),squeeze(plot1tempy(4,1:n42,2)),'r+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n43,3)),squeeze(plot1tempy(4,1:n43,3)),'k+','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(4,1:n44,4)),squeeze(plot1tempy(4,1:n44,4)),'+','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 2: rho = 1000; phi = 0.2; ReD = 40; ur = 2;
plot(squeeze(plot1tempx(5,1:n51,1)),squeeze(plot1tempy(5,1:n51,1)),'bo','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n52,2)),squeeze(plot1tempy(5,1:n52,2)),'ro','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n53,3)),squeeze(plot1tempy(5,1:n53,3)),'ko','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(5,1:n54,4)),squeeze(plot1tempy(5,1:n54,4)),'o','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
% line 3: rho = 1000; phi = 0.2; ReD = 400; ur = 2;
plot(squeeze(plot1tempx(6,1:n61,1)),squeeze(plot1tempy(6,1:n61,1)),'bd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n62,2)),squeeze(plot1tempy(6,1:n62,2)),'rd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n63,3)),squeeze(plot1tempy(6,1:n63,3)),'kd','Linewidth',1.0,'Markersize',8);
plot(squeeze(plot1tempx(6,1:n64,4)),squeeze(plot1tempy(6,1:n64,4)),'d','color','[0.4940 0.1840 0.5560]','Linewidth',1.5,'Markersize',8);
hold off;
grid
axis([-1 2 0.0 1.2]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
%ylabel('$k_{mp}/k_{sp}$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([0.0 0.2 0.4 0.6 0.8 1.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)
box on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figure 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Reprime = zeros(length(ur),length(phi),length(ReD),length(rho),length(d_log));

figure(5)
%%%%%%%%%%%%%%% Bubbles in water %%%%%%%%%%%%%%%%%%%
subplot(3,3,1)
plot(d_log,log10(squeeze(Reprime(1,1,1,1,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(1,1,2,1,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(1,1,3,1,:))),'kd','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,1,1,:))),'b*','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,2,1,:))),'r>','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,3,1,:))),'kv','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -5 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$\log_{10}\left(Re_p\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-5.0 -2.5 0.0 2.5]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,2)
plot(d_log,log10(squeeze(Reprime(1,2,1,1,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(1,2,2,1,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(1,2,3,1,:))),'kd','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,1,1,:))),'b*','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,2,1,:))),'r>','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,3,1,:))),'kv','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -5 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-5.0 -2.5 0.0 2.5]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,3)
plot(d_log,log10(squeeze(Reprime(1,3,1,1,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(1,3,2,1,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(1,3,3,1,:))),'kd','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,1,1,:))),'b*','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,2,1,:))),'r>','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,3,1,:))),'kv','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -5 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-5.0 -2.5 0.0 2.5]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

%%%%%%%%%%%%%%%%%%  Sand in water %%%%%%%%%%%%%%

subplot(3,3,4)
plot(d_log,log10(squeeze(Reprime(1,1,1,2,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(1,1,2,2,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(1,1,3,2,:))),'kd','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,1,2,:))),'b*','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,2,2,:))),'r>','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,3,2,:))),'kv','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -5 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$\log_{10}\left(Re_p\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-5.0 -2.5 0.0 2.5]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,5)
plot(d_log,log10(squeeze(Reprime(1,2,1,2,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(1,2,2,2,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(1,2,3,2,:))),'kd','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,1,2,:))),'b*','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,2,2,:))),'r>','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,3,2,:))),'kv','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -5 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-5.0 -2.5 0.0 2.5]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,6)
plot(d_log,log10(squeeze(Reprime(1,3,1,2,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(1,3,2,2,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(1,3,3,2,:))),'kd','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,1,2,:))),'b*','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,2,2,:))),'r>','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,3,2,:))),'kv','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -5 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-5.0 -2.5 0.0 2.5]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

%%%%%%%%%%%%%%%%%%%%%%%%%% Drop in air %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(3,3,7)
plot(d_log,log10(squeeze(Reprime(1,1,1,3,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(1,1,2,3,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(1,1,3,3,:))),'kd','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,1,3,:))),'b*','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,2,3,:))),'r>','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,3,3,:))),'kv','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -2 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$\log_{10}\left(Re_p\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-2.0 0.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,8)
plot(d_log,log10(squeeze(Reprime(1,2,1,3,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(1,2,2,3,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(1,2,3,3,:))),'kd','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,1,3,:))),'b*','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,2,3,:))),'r>','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,3,3,:))),'kv','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -2 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-2.0 0.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,9)
plot(d_log,log10(squeeze(Reprime(1,3,1,3,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(1,3,2,3,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(1,3,3,3,:))),'kd','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,1,3,:))),'b*','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,2,3,:))),'r>','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,3,3,:))),'kv','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -2 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-2.0 0.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figure 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
figure(7)
% Reprime = zeros(length(ur),length(phi),length(ReD),length(rho),length(d_log));
%%%%%%%%%%%%%%% Bubbles in water %%%%%%%%%%%%%%%%%%%
subplot(3,3,1)
plot(d_log,log10(squeeze(Reprime(2,1,1,1,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(2,1,2,1,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,3,1,:))),'kd','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -1 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$\log_{10}\left(Re_p\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-1.0 -0.0 1.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,2)
plot(d_log,log10(squeeze(Reprime(2,2,1,1,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(2,2,2,1,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,3,1,:))),'kd','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -1 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-1.0 0.0 1.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,3)
plot(d_log,log10(squeeze(Reprime(2,3,1,1,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(2,3,2,1,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,3,1,:))),'kd','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -1 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 0$ (bubbles in water), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-1.0 0.0 1.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

%%%%%%%%%%%%%%%%%%  Sand in water %%%%%%%%%%%%%%

subplot(3,3,4)
plot(d_log,log10(squeeze(Reprime(2,1,1,2,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(2,1,2,2,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,3,2,:))),'kd','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -1 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$\log_{10}\left(Re_p\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-1.0 0.0 1.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,5)
plot(d_log,log10(squeeze(Reprime(2,2,1,2,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(2,2,2,2,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,3,2,:))),'kd','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -1 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-1.0 0.0 1.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,6)
plot(d_log,log10(squeeze(Reprime(2,3,1,2,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(2,3,2,2,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,3,2,:))),'kd','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -1 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 2.56$ (sand in water), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-1.0 0.0 1.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

%%%%%%%%%%%%%%%%%%%%%%%%%% Drop in air %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(3,3,7)
plot(d_log,log10(squeeze(Reprime(2,1,1,3,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(2,1,2,3,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,1,3,3,:))),'kd','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -1 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
ylabel('$\log_{10}\left(Re_p\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 1\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-1.0 0.0 1.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,8)
plot(d_log,log10(squeeze(Reprime(2,2,1,3,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(2,2,2,3,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,2,3,3,:))),'kd','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -1 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 5\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-1.0 0.0 1.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)

subplot(3,3,9)
plot(d_log,log10(squeeze(Reprime(2,3,1,3,:))),'b+','Linewidth',1.0,'Markersize',8);
hold on;
plot(d_log,log10(squeeze(Reprime(2,3,2,3,:))),'ro','Linewidth',1.0,'Markersize',8);
plot(d_log,log10(squeeze(Reprime(2,3,3,3,:))),'kd','Linewidth',1.0,'Markersize',8);
hold off;
grid
axis([-1 2 -1 3]);
xlabel('$\log_{10}\left(D/\eta_{sp}\right)$','Fontsize',15,'interpreter','Latex');
title('$\rho = 1000$ (drop in air), $\phi = 20\%$','Fontsize',13,'interpreter','Latex');
xticks([-1 -0.5 0 0.5 1 1.5 2]);
yticks([-1.0 0.0 1.0 2.0]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',15)
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',15)