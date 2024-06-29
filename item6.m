% Definindo parâmetros
fc = 2e6; % Frequência da portadora em Hz (2 MHz)
fsamp = 50e6; % Frequência de amostragem em Hz (50 MHz)
t_end = 200e-6; % Tempo final em segundos (200 µs)

% Definindo o intervalo de tempo
t = linspace(0, t_end*1e6, round(t_end * fsamp)); % Vetor de tempo em µs

% Calculando o sinal de mensagem
x = t - 100; % Argumento da função sinc centrado em 100 µs
mt = sinc(x);

% Calculando a portadora
ct = cos(2 * pi * fc * t * 1e-6); % Tempo em segundos para a função cosseno

% Modulação do sinal de mensagem
st = mt .* ct;

% Calculando a FFT do sinal modulado
N = length(st);
St_fft = fftshift(fft(st));

% Definindo o vetor de frequência
f = (-N/2:N/2-1)*(fsamp/N);

% Plotando o espectro do sinal modulado em banda de -5 MHz a +5 MHz
figure;
plot(f/1e6, abs(St_fft));
xlim([-5 5]);
title('Espectro do Sinal Modulado s(t)');
xlabel('Frequência (MHz)');
ylabel('Magnitude');
grid on;

% Identificando as frequências onde os espectros aparecem
spectral_peaks = f(abs(St_fft) > max(abs(St_fft))/2) / 1e6; % Frequências em MHz
disp('Frequências onde os espectros aparecem (MHz):');
disp(spectral_peaks);

