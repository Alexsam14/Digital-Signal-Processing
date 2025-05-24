%delf=32; %Hz
%dur = 0.2; %s
%fsamp = 11025; %Hz
%fc = 2000; %Hz
%tt=0:1/fsamp:dur;
%xx=cos(2*pi*delf*tt).*cos(2*pi*fc*tt);
%plot(tt,xx), grid on;

%figure(2)
%specgram(xx,2048,fsamp); colormap(1-gray(256))

%figure(3)
%specgram(xx,16,fsamp); colormap(1-gray(256))

%4.3 and 4.4
%figure(1);
fsamp=11025;
[a,b]=mychirp(3000,-2000,3,11025); soundsc(a,fsamp); specgram(a,512,fsamp);

%pause(5);

%figure(2);
%[c,d]=mychirp(3000,-2000,3,11025); soundsc(c,fsamp); specgram(c,512,fsamp);