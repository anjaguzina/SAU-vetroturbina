s = tf('s');
W = ((s+1)*(s+15))/(s*(s+30)*(s+5));
bode(W)