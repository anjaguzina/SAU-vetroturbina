

C1 = 0.5; 
C2 = 116; 
C3 = 0.4;
C4 = 0; 
C5 = 5;
C6 = 23;

R = 40;
v = 13;

lambda = @(omega) (omega*R)/v; 

lambda_i = @(theta, omega) 1./(lambda(omega) + 0.08*theta) - 0.035/(1 + theta^3); 

Cp = @(theta, omega) C1 * (C2 ./ lambda_i(theta, omega) - C3*theta - C5).*exp(-C6*lambda_i(theta, omega)); 

%% 

rho = 1.225; 

K = 160661.6; 

f = @(theta, omega) 0.5 * rho * R^2 * pi * v^3 * Cp(theta, omega)./omega; 

ww = 0.01:0.0001:0.3; 

plot(ww, K*ww.^2, 'k', 'LineWidth', 2) 

%%
hold on 

labels = ("rhs");

for theta = 13:0.5:16   
    plot(ww, f(theta, ww), 'LineWidth', 2)
    labels=[labels, num2str(theta)];
end 

hold off 

box on 

grid on 

legend(labels)

%% 

lower_bound = 13;
upper_bound = 16;
step_size = 0.5;

num_elements = (upper_bound - lower_bound) / step_size + 1;
theta = ones(1, num_elements);

theta = theta * step_size + lower_bound - step_size;

w0 = zeros(2*num_elements, 1);

for th = theta

    sol = fsolve(@(omega) K*omega.^2 - f(th, omega), 1.5);
    w0 = [w0; sol]

end 



