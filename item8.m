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

% Projetando um filtro retangular para a faixa de -2 MHz a 2 MHz
H = zeros(size(f));
H((f >= -2e6) & (f <= 2e6)) = 1;

% Aplicando o filtro ao espectro
Rt_fft_filtered = Rt_fft .* H;

% Normalizando a magnitude do espectro original e filtrado
Rt_fft = abs(Rt_fft) / N;
Rt_fft_filtered = abs(Rt_fft_filtered) / N;

% Plotando o espectro original e o filtrado
figure;
subplot(2, 1, 1);
plot(f / 1e6, Rt_fft);
xlim([-6 6]);
title('Espectro do Sinal Demodulado');
xlabel('Frequência (MHz)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(f / 1e6, Rt_fft_filtered);
xlim([-6 6]);
title('Espectro do Sinal Demodulado com Filtro Retangular');
xlabel('Frequência (MHz)');
ylabel('Magnitude');
grid on;


