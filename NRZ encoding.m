f = 5; //signal frequency
fs =2*f; // Nyquist rate
t=(0:0.2:20)/fs;
bits = 2 // bits used for quantizing
signal = cos(2*pi*f*t); // cos signal

figure(1);
subplot(311);
hold on;
title("original and sampled signal") // plot sampled and original signal
plot(t,signal);
stem(t,signal);
hold off;
subplot(312) // plot quantized signal
hold off;
quan=round(signal*(bits^2-1))
hold on;
title("quantized signal");
stem(t,quan);
hold off;

nzr=[]; // NZR encoding calculation

for i=quan
  if(i<=0)
   temp = -1;
  else
   temp=1;
  endif
  nzr =[nzr;temp];
  display(temp)
endfor

subplot(313);
hold on;
stem(t,nzr); // plot NZR encoding
title("NZR encoding")
hold off;
