function [kmp,regime,Reprime] = kratio(d,Re_D,rho,phi,ur,dr)
% This function calculates turbulence modulation measured by k_mp/k_sp;
% as a function of D/eta, Re_D, rho, phi, ur, and dr;
% [kratio] = kratio(d,Re_D,rho,phi,ur,dr);
% d = D/eta. D is the particle diameter, eta is the Kolmogorov length;
% Re_D = u'*L/nu is the subgrid Reynolds number, u' is the fluctuation velocity,
% L is the domain length, nu is the viscosity;
% rho = rho_p/rho_f is the density ratio;
% phi is the particle volume fraction;
% ur is mean slip velocity between the particle and fluid phases;
% dr = d_mp/d_sp is the dissipation rate ratio between the one phase and two phase cases.
% 
% Reference: Balachandar, Peng and Wang (2023), PRL, submitted

% First, iterate to get Delta u/u_k;
beta = 3/(2*rho + 1);
Deltau = 5; % Initial guess, can be any value
DDeltau = 10; % Difference between two iterations
eps = 1.0e-10; % Criterion to exit the iteration
while (DDeltau > eps)
    Deltauold = Deltau;
    Reprime = Deltau*d;
    SNcorr = 1 + 0.15*Reprime^0.687;  % Schiller and Naumann (1935)
    Phiprime = SNcorr/(1-phi)^3 + 5.81*phi/(1-phi^3) + 0.48*phi^(1/3)/(1-phi^4) ...
     + phi^3*Reprime*(0.95+0.61*phi^3/(1-phi)^2); % Tenneti et al. (2011) IJMF, 37: 1072-1092  Eq. (43)
    Stokes = (2*rho + 1)*d^2/36/Phiprime;
    if (Stokes < 1)   % Eq. (2)
        Deltau = abs(1 - beta)*Stokes;
        regime = 1;
    elseif(Stokes/sqrt(Re_D) > 1)
        Deltau = abs(1 - beta)*Re_D^(0.25);
        regime = 3;
    else
        Deltau = abs(1 - beta)*sqrt(Stokes);
        regime = 2;
    end
    DDeltau = abs(Deltau - Deltauold)/Deltauold;
end

if(ur > Deltau) % regime 4 
    Deltau = ur;
    regime = 4;
    Reprime = Deltau*d;
    SNcorr = 1 + 0.15*Reprime^0.687;  % Schiller and Naumann (1935)
    Phiprime = SNcorr/(1-phi)^3 + 5.81*phi/(1-phi^3) + 0.48*phi^(1/3)/(1-phi^4) ...
     + phi^3*Reprime*(0.95+0.61*phi^3/(1-phi)^2); % Tenneti et al. (2011) IJMF, 37: 1072-1092  Eq. (43)
end


% Calculate Cprime in Eq. (6)
term = (rho - 1)*phi;
if(term > 0.48)
    term = 0.48;
end
Cprime = 1 + term*(1 - 1/(1 + exp(-(log(Stokes) - log(500)))));
Cp = 1;
Re_ur = ur*d;
SNcorr_mean = 1 + 0.15*Re_ur^0.687;  % Schiller and Naumann (1935)
Phi = SNcorr_mean/(1-phi)^3 + 5.81*phi/(1-phi^3) + 0.48*phi^(1/3)/(1-phi^4) ...
     + phi^3*Re_ur*(0.95+0.61*phi^3/(1-phi)^2); % Tenneti et al. (2011) IJMF, 37: 1072-1092  Eq. (43)

% fun = @(kr) Cprime*kr^1.5 + 18*Cp*phi*Phiprime*Deltau^2/d^2*kr - dr - 18*phi*Phi*ur^2/d^2;
% We use bisection method to seach for the root of this function as fzero
% can be ill-functional.
kr0 = 1; % Initial guess of kr
krlow = 0; % The minimum possible value of k_mp/k_sp is 0, fun(krlow) < 0
funhigh = Cprime*kr0^1.5 + 18*Cp*phi*Phiprime*Deltau^2/d^2*kr0 - dr - 18*phi*Phi*ur^2/d^2;
while(funhigh < 0)
    kr0 = kr0 + 1;
    funhigh = Cprime*kr0^1.5 + 18*Cp*phi*Phiprime*Deltau^2/d^2*kr0 - dr - 18*phi*Phi*ur^2/d^2;
end
kmp_eps = 1.0e-6;
krhigh = kr0; krdiff = krhigh - krlow;
while(krdiff > kmp_eps)
    krmid = 0.5*(krhigh + krlow);
    funmid = Cprime*krmid^1.5 + 18*Cp*phi*Phiprime*Deltau^2/d^2*krmid - dr - 18*phi*Phi*ur^2/d^2;
    if(funmid < 0)
        krlow = krmid;
    else
        krhigh = krmid;
    end
    krdiff = krhigh - krlow;
end
kmp = 0.5*(krhigh + krlow);
    


end

