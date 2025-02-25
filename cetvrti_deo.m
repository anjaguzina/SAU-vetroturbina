s = tf('s');
W  = ((-1.4550e-05)*(s*kp + ki))/(s*(s+0.1510));
nyquist(W)