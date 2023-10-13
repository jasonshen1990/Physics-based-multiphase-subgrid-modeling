clear all;

% We summarize some data from DNS and experiments to validate the model.
% Note that in some references, Re_D is not provided, so we use Re_\lambda (Taylor Re) to replace Re_D. 

% Data from Peng, Sun, and Wang (2023), JFM, 963: A6
d_PSW =   [14.332, 10.134, 7.166,  10.134, 10.134, 14.332, 7.166,  14.332, 14.332, 10.134, 7.166,  10.134, 7.166];
ReD_PSW = [140.4,  139.7,  133.4,  138.9,  135.0,  137.9,  141.5,  140.8,  133.3,  105.2,  107.7,  72.9,   73.5]; 
rho_PSW = [4.0,    8.0,    16.0,   8.0,    8.0,    8.0,    8.0,    4.0,    16.0,   8.0,    8.0,    8.0,    8.0];
phi_PSW = [0.12,   0.12,   0.12,   0.04,   0.08,   0.08,   0.08,   0.08,   0.08,   0.08,   0.08,   0.08,   0.08];
ur_PSW =  [0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0];
dr_PSW =  [0.7977, 0.7218, 0.6330, 0.8859, 0.8012, 0.8580, 0.7557, 0.8698, 0.8659, 0.8468, 0.7780, 0.8570, 0.8108];
kr_PSW = [0.6301, 0.4645, 0.3157, 0.7444, 0.5815, 0.6324, 0.5586, 0.7405, 0.5555, 0.5881, 0.5434, 0.5879, 0.5328];
kr_theo_PSW = zeros(size(d_PSW));

% Data from Hwang and Eaton (2006), JFM, 564: 361-393
d_HE =    [0.96,       0.96,       0.97];
ReD_HE =  [240.0,      230.0,      230.0];
rho_HE =  [2080.0,     2080.0,     2080.0];
phi_HE =  [0.00000717, 0.00004808, 0.000106];
ur_HE =   [0.0,        0.0,        0.0];
dr_HE =   [0.91        0.78        0.61];
kr_HE =   [0.91        0.76        0.59];
kr_theo_HE = zeros(size(d_HE));

% Data from Uhlmann & Chouippe (2017), JFM, 812: 991-1023; and Chouippe and
% Uhlmann (2015) Phys. Fluids, 27: 123301.
d_UC =   [5.5,    11.4,   6.7];
ReD_UC = [119.0,  142.8,  65.5];
rho_UC = [1.5,    1.5,    1.5];
phi_UC = [0.0075, 0.0075, 0.0075];
ur_UC =  [0.0,    0.0,    0.0];
dr_UC =  [1.03,   0.99,   0.98]; 
kr_UC =  [0.99,   0.99,   0.978];
kr_theo_UC = zeros(size(d_UC));

% Data from Ten Cate et al. (2004), JFM, 519: 233-271
d_TC =   [7.853,  7.853,  7.853,  7.853,  7.853];
ReD_TC = [61.0,   61.0,   61.0,   61.0,   61.0];
rho_TC = [1.414,  1.414,  1.414,  1.146,  1.728];
phi_TC = [0.02,   0.057,  0.1,    0.057,  0.057];
ur_TC =  [0.0,    0.0,    0.0,    0.0,    0.0];
dr_TC =  [1.0170  1.0140  0.9660  1.0280  1.0080]; 
kr_TC =  [0.9750  0.9300  0.8870  0.9690  0.9510];
kr_theo_TC = zeros(size(d_TC));


% Data from Yeo et al. (2010) IJMF, 36: 221-233
d_Y =   [7.80,  7.68,  7.68];
ReD_Y = [59.2,  58.7,  57.3];
rho_Y = [1.0,   1.0,   1.4];
phi_Y = [0.057, 0.057, 0.057];
ur_Y =  [0.0,   0.0,   0.0];
dr_Y =  [1.056  1.002  0.998]; 
kr_Y =  [1.035  0.997  0.974];
kr_theo_Y = zeros(size(d_Y));

% Data from Shen et al. (2022) J Turbul, 23: 433-453
d_Sh =   [8.89,  13.33,  17.77,  8.89,  13.33,  17.77  8.89,  13.33,  17.77];
ReD_Sh = [57.52, 55.79,  56.05,  46.10, 47.71,  49.09, 32.95, 38.35,  42.93];
rho_Sh = [5.0,   5.0,    5.0,    8.89,  8.89,  8.89,   20.0,  20.0,   20.0];
phi_Sh = [0.09,  0.09,   0.09,   0.09,  0.09,   0.09,  0.09,  0.09,   0.09];
ur_Sh =  [0.0,   0.0,    0.0,    0.0,   0.0,    0.0,   0.0,   0.0,    0.0];
dr_Sh =  [0.683, 0.768,  0.812,  0.641, 0.762,  0.804, 0.641, 0.745,  0.796]; 
kr_Sh =  [0.645, 0.662,  0.685,  0.502, 0.565,  0.597, 0.359, 0.448,  0.521];
kr_theo_Sh = zeros(size(d_Sh));

% Data from Oka and Goto (2022) JFM, 949: A45
d_OG =   [8.0,    8.0,    8.0,    8.0,    8.0,    16.0,   16.0,   16.0,   16.0,   32.0,   32.0,   32.0,   32.0,   63.0,   63.0,   63.0,   63.0];
ReD_OG = [94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0,   94.0];
rho_OG = [2.0,    8.0,    32.0,   128.0,  512.0,  2.0,    8.0,    32.0,   128.0,  2.0,    8.0,    32.0,   128.0,  2.0,    8.0,    32.0,   128.0];
phi_OG = [0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082, 0.0082];
ur_OG =  [0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0];
dr_OG =  [1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0,    1.0]; 
kr_OG =  [0.972,  0.942,  0.853,  0.795,  0.763,  0.979,  0.968,  0.919,  0.926,  0.982,  0.978,  0.963,  0.967,  0.999,  0.981,  0.973,  0.978];
kr_theo_OG = zeros(size(d_OG));

% Data at channel center from Shen et al. (2023) IJMF to be published
d_ShC =   [2.638,    4.920,  9.754,   2.655,   2.663];
ReD_ShC = [180.0,    180.0,  180.0,   180.0,   180.0];
rho_ShC = [1.0,      1.0,    1.0,     2.0,     5.0];
phi_ShC = [0.01,     0.01,   0.0099,  0.0095,  0.0098];
ur_ShC =  [0.025,    0.039,  0.221,   0.262,   0.352];
dr_ShC =  [1.0,  1.0,  1.0,  1.0,  1.0]; % Here we set dissipation rate ratio as 1
kr_ShC =  [1.0037,   0.9746, 0.9728,  0.9688,  0.9603];
kr_theo_ShC = zeros(size(d_ShC));


% Data at channel center from Peng, Ayala, Wang (2019) JFM 875:1096-1144
d_PAW   =  [7.95,   3.975,  7.95,   7.95,   7.95];
ReD_PAW =  [180.0,  180.0,  180.0,  180.0,  180.0];
rho_PAW =  [1.0,    1.0,    1.0,    2.5,    7.8];
phi_PAW =  [0.053,  0.0508, 0.014,  0.016,  0.02];
ur_PAW =  [0.331,  0.376,  0.099,  0.117,  1.667];
dr_PAW  =  [1.0, 1.0, 1.0, 1.0,  1.0];  % Here we set dissipation rate ratio as 1
kr_PAW  =  [0.9251, 1.0421, 0.9185, 0.8839,  0.6909];
kr_theo_PAW = zeros(size(d_PAW));

for i = 1:length(kr_theo_PSW)
    dp = d_PSW(i);
    ReDp = ReD_PSW(i);
    rhop = rho_PSW(i);
    phip = phi_PSW(i);
    urp = ur_PSW(i);
    drp = dr_PSW(i);
    kr_theo_PSW(i) = kratio(dp,ReDp,rhop,phip,urp,drp);
end

for i = 1:length(kr_theo_HE)
    dp = d_HE(i);
    ReDp = ReD_HE(i);
    rhop = rho_HE(i);
    phip = phi_HE(i);
    urp = ur_HE(i);
    drp = dr_HE(i);
    kr_theo_HE(i) = kratio(dp,ReDp,rhop,phip,urp,drp);
end

for i = 1:length(kr_theo_UC)
    dp = d_UC(i);
    ReDp = ReD_UC(i);
    rhop = rho_UC(i);
    phip = phi_UC(i);
    urp = ur_UC(i);
    drp = dr_UC(i);
    kr_theo_UC(i) = kratio(dp,ReDp,rhop,phip,urp,drp);
end

for i = 1:length(kr_theo_TC)
    dp = d_TC(i);
    ReDp = ReD_TC(i);
    rhop = rho_TC(i);
    phip = phi_TC(i);
    urp = ur_TC(i);
    drp = dr_TC(i);
    kr_theo_TC(i) = kratio(dp,ReDp,rhop,phip,urp,drp);
end

for i = 1:length(kr_theo_Y)
    dp = d_Y(i);
    ReDp = ReD_Y(i);
    rhop = rho_Y(i);
    phip = phi_Y(i);
    urp = ur_Y(i);
    drp = dr_Y(i);
    kr_theo_Y(i) = kratio(dp,ReDp,rhop,phip,urp,drp);
end

for i = 1:length(kr_theo_Sh)
    dp = d_Sh(i);
    ReDp = ReD_Sh(i);
    rhop = rho_Sh(i);
    phip = phi_Sh(i);
    urp = ur_Sh(i);
    drp = dr_Sh(i);
    kr_theo_Sh(i) = kratio(dp,ReDp,rhop,phip,urp,drp);
end

for i = 1:length(kr_theo_OG)
    dp = d_OG(i);
    ReDp = ReD_OG(i);
    rhop = rho_OG(i);
    phip = phi_OG(i);
    urp = ur_OG(i);
    drp = dr_OG(i);
    kr_theo_OG(i) = kratio(dp,ReDp,rhop,phip,urp,drp);
end

for i = 1:length(kr_theo_ShC)
    dp = d_ShC(i);
    ReDp = ReD_ShC(i);
    rhop = rho_ShC(i);
    phip = phi_ShC(i);
    urp = ur_ShC(i);
    drp = dr_ShC(i);
    kr_theo_ShC(i) = kratio(dp,ReDp,rhop,phip,urp,drp);
end

for i = 1:length(kr_theo_PAW)
    dp = d_PAW(i);
    ReDp = ReD_PAW(i);
    rhop = rho_PAW(i);
    phip = phi_PAW(i);
    urp = ur_PAW(i);
    drp = dr_PAW(i);
    kr_theo_PAW(i) = kratio(dp,ReDp,rhop,phip,urp,drp);
end

xx = [0.2,1.1]; 
yy = [0.2,1.1];
figure(1)
h1 = plot(kr_theo_PSW,kr_PSW,'bd','Markersize',8,'Linewidth',1.5);
hold on;
h2 = plot(kr_theo_HE,kr_HE,'m+','Markersize',10,'Linewidth',1.5);
h3 = plot(kr_theo_UC,kr_UC,'ko','Markersize',8,'Linewidth',1.5,'MarkerFaceColor','k');
h4 = plot(kr_theo_TC,kr_TC,'x','color','[0.4940 0.1840 0.5560]','Markersize',10,'Linewidth',1.5);
h5 = plot(kr_theo_Y,kr_Y,'s','color','[0.8500 0.3250 0.0980]','Markersize',10,'Linewidth',1.5);
h6 = plot(kr_theo_Sh,kr_Sh,'kv','Markersize',8,'Linewidth',1.5);
h7 = plot(kr_theo_OG,kr_OG,'r^','Markersize',8,'Linewidth',1.5);
h8 = plot(kr_theo_ShC,kr_ShC,'k>','Markersize',8,'Linewidth',1.5);
h9 = plot(kr_theo_PAW,kr_PAW,'b*','Markersize',8,'Linewidth',1.5);
plot(xx,yy,'k-','Linewidth',1.5);
hold off;
grid
axis([0.2 1.1 0.2 1.1]);
xlabel('$\left(k_{mp}/k_{sp}\right)_{theo}$','fontname','Times','Fontsize',20,'interpreter','Latex');
ylabel('$\left(k_{mp}/k_{sp}\right)_{DNS,exp}$','fontname','Times','Fontsize',20,'interpreter','Latex');
xticks([0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1]);
yticks([0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1]);
aaa = get(gca,'XTick');
set(gca,'XTick',aaa,'fontname','Times','fontsize',17);
bbb = get(gca,'YTick');
set(gca,'YTick',bbb,'fontname','Times','fontsize',17);
h1 = legend([h1; h2; h3; h4; h5], 'Peng et al. (2023)','Hwang & Eaton (2006)','Uhlmann & Chouippe (2017)', ...
    'Ten Cate et al. (2004)','Yeo et al. (2010)','Fontname','Times','Fontsize',14);
ah2 = axes('position',get(gca,'position'),'visible','off');
h2 = legend(ah2, [h6; h7; h8; h9],'Shen et al. (2022)','Oka & Goto (2022)','Shen et al. (2023)','Peng et al. (2019)',...
    'Fontname','Times','Fontsize',14);
