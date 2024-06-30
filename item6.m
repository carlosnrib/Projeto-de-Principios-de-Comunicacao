% Definindo parâmetros
fc = 2e6; 
fsamp = 50e6; 
t_end = 200e-6; 

% Definindo o intervalo de tempo
t = linspace(0, t_end*1e6, round(t_end * fsamp)); 

% Calculando o sinal de mensagem
x = t - 100; 
mt = sinc(x);

% Calculando a portadora
ct = cos(2 * pi * fc * t * 1e-6); 

% Modulação do sinal de mensagem
st = mt .* ct;

% Calculando a FFT do sinal modulado
N = length(st);
St_fft = fftshift(fft(st));

% Definindo o vetor de frequência
f = (-N/2:N/2-1)*(fsamp/N);

% Plotando o espectro do sinal modulado 
figure;
plot(f/1e6, abs(St_fft));
xlim([-5 5]);
title('Espectro do Sinal Modulado s(t)');
xlabel('Frequência (MHz)');
ylabel('Magnitude');
grid on;