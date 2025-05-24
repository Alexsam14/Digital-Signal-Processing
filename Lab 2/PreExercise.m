fsamp = 11025;
dt = 1/fsamp;
dur = 1.8;
tt = 0 : dt : dur;
psi = 2*pi*(100 + 200*tt + 500*tt.*tt);
xx = real( 7.7*exp(j*psi) );
%soundsc( xx, fsamp );

%a
total_duration=dur
number_ofsamples=length(tt)

%b
t_n=tt;
A=7.7

%c
f=200+1000*tt;
figure;
plot(tt,f, 'r', 'DisplayName','psi')
hold on
plot(tt,xx, 'g', 'DisplayName','f')
hold off
f_min = 200+1000*0
f_max = 200+1000*1.8