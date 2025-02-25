J = 3410432;
ro = 1.225;
r = 40;
A = r*r*pi;
V = 13;
C1 = 0.5;
C2 = 116;
C3 = 0.4;
C4 = 0;
C5 = 5;
C6 = 23;
k = 160661.6;

syms omega teta;

M = 1/((omega*r)/V + 0.08*teta) - (0.035/(1+teta^3)); % 1/lambda_i

f = (0.5*ro*V*A*C1)*(1/J)*(1/omega)*(C2*M - C3*teta - C5)*exp(-C6*M) - (k/J)*(omega^2);

fOmega = gradient(f,omega); %parcijalni izvod po omega 

A = subs(fOmega,[omega,teta],[1.605112,13]); % vrednost kad se uvrste mirne radne tacke

fTeta = gradient(f,teta); %parcijalni izvod po teta

B = subs(fTeta,[omega,teta],[1.605112,13]); % vrednost parcijalnog izvoda kad se uvrste mirne radne tacke




