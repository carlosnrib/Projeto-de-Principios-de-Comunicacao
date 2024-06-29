% Definindo parâmetros
fc = 2e6; % Frequência da portadora em Hz (2 MHz)
fsamp = 50e6; % Frequência de amostragem em Hz (50 MHz)
t_end = 200e-6; % Tempo final em segundos (200 µs)

% Definindo o intervalo de tempo
t = linspace(0, t_end, round(t_end * fsamp)); % Vetor de tempo em segundos
x = (t * 1e6) - 100; % Argumento da função sinc centrado em 100 µs

% Calculando o sinal de mensagem
mt = sinc(x);

% Calculando a portadora
ct = cos(2 * pi * fc * t); % Tempo em segundos para a função cosseno

% Modulação do sinal de mensagem
st = mt .* ct;

% Demodulação do sinal modulado
rt = st .* ct; % Multiplicando o sinal modulado pela mesma portadora

% Calculando a FFT do sinal demodulado sem filtragem
N = length(rt);
Rt_fft = fftshift(fft(rt));

% Definindo o vetor de frequência
f = (-N/2:N/2-1)*(fsamp/N);

% Plotando o espectro do sinal demodulado em banda de -6 MHz a +6 MHz
figure;
plot(f / 1e6, abs(Rt_fft)/N);
xlim([-6 6]);
title('Espectro do Sinal Demodulado');
xlabel('Frequência (MHz)');
ylabel('Magnitude');
grid on;


