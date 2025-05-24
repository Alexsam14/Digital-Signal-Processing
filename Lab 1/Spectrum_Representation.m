t=linspace(1,10,50);

subplot(4,2,1)
yline(10)

subplot(4,2,2)
y_2=14*cos(200*pi*t - pi/3);
plot(t,y_2)

subplot(4,2,3)
y_3=8*cos(500*pi*t - pi/2);
plot(t,y_3)

y_4=y_2+y_3+10;
subplot(4,2,4)
plot(t,y_4)

subplot(4,2,5);
xline(10)

subplot(4,2,6)
Y_2=fft(y_2);
f_2=linspace(-150,150,length(Y_2));
plot(f_2 ,abs(Y_2));

subplot(4,2,7);
Y_3 = fft(y_3);
f_3 = linspace(-300,300,length(Y_3));
plot(f_3,abs(Y_3));

subplot(4,2,8);
Y_4 = fft(y_4);
f_4=linspace(-500,500,length(Y_4));
plot(f_4, abs(Y_4));