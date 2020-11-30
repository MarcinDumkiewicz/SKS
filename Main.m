   %%Modulation
   Fs = 100;
   Fc = 40;
   Fm=40;
   t = (0:2*Fs+1)'/Fs;
   x = cos(2*pi*Fc*t);
   signal = sin(2*pi*Fm*t);
   m = signal*Am;
   x_modulated = cos(2*pi*Fc*t + phasdev*m);
  
   %%Adding Gaussian noise
   rx = awgn(x_modulated,snr,'measured');
   
   %%Demodulation
   y = pmdemod(rx,Fc,Fs,phasdev);
   
   %%Plot
   axes(handles.axes1)
   plot(t,x);
   xlabel('Time (s)')
   ylabel('Amplitude (V)')
   title('Przebieg sygna³u przed modulacj¹');
   grid on;
   
   axes(handles.axes2)
   plot(t,x_modulated);
   xlabel('Time (s)')
   ylabel('Amplitude (V)')
   title('Przebieg sygna³u po modulacji');
   grid on;
   
   axes(handles.axes3)
   plot(t,[x y]);
   legend('Original signal','Recovered signal');
   xlabel('Time (s)')
   ylabel('Amplitude (V)')
   title('Przebieg sygna³u po demodulacji');
   grid on;
   
   axes(handles.axes4)
   plot(t,m);
   xlabel('Time (s)')
   ylabel('Amplitude (V)')
   title('Przebieg sygna³u moduluj¹cego');
   grid on;
   
   
   
   
   
   