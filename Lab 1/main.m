%a
T = 1/4000;
tt = -T:0.000014:T;
tm1 = (37.2/10)*T; tm2 = -(41.3/14)*T;
A1 = 23; A2 = 1.2*A1;
x1 = A1*cos(2*pi*4000*(tt-tm1));
x2 = A2*cos(2*pi*4000*(tt-tm2));

%b
figure(1)
plot(tt, x1, 'b-'), grid on
xlabel("Time");
ylabel("Amplitude");
title("X1");

figure(2);
plot(tt, x2, 'r-'), grid on
xlabel("Time");
ylabel("Amplitude");
title("X1")

%c
%x3 = x1+x2;
%plot(tt, x3, 'b-'), grid on
%xlabel("Time");
%ylabel("Amplitude");
%title('Combined signal')


%complex amplitude representation
%temp = real(A1*exp(j*2*pi*4000*-tm1)*exp(j*2*pi*4000*tt));
%subplot(4,1,4)
%figure(1);
%plot(tt, temp, 'r-'), grid on
%title("Complex Amplitude")

%subplot(3,1,1);
%plot(tt, x1, 'b-'), grid on
%xlabel("Time");
%ylabel("Amplitude");
%title("First Plot");

%subplot(3,1,2);
%plot(tt, x1, 'b-'), grid on
%xlabel("Time");
%ylabel("Amplitude");
%title("Second Plot");

%subplot(3,1,3);
%plot(tt, x1, 'b-'), grid on
%xlabel("Time");
%ylabel("Amplitude");
%title("Maruf Usman");
