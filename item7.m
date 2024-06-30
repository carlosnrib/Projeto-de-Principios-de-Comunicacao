% Definindo parâmetros
fc = 2e6; 
fsamp = 50e6; 
t_end = 200e-6; 

% Definindo o intervalo de tempo
t = linspace(0, t_end, round(t_end * fsamp)); 
x = (t * 1e6) - 100; 

% Calculando o sinal de mensagem
mt = sinc(x);

% Calculando a portadora
ct = cos(2 * pi * fc * t); 

% Modulação do sinal de mensagem
st = mt .* ct;

% Demodulação do sinal modulado
rt = st .* ct; 

% Calculando a FFT do sinal demodulado sem filtragem
N = length(rt);
Rt_fft = fftshift(fft(rt));

% Definindo o vetor de frequência
f = (-N/2:N/2-1)*(fsamp/N);

% Plotando o espectro do sinal demodulado 
figure;
plot(f / 1e6, abs(Rt_fft)/N);
xlim([-6 6]);
title('Espectro do Sinal Demodulado');
xlabel('Frequência (MHz)');
ylabel('Magnitude');
grid on;


