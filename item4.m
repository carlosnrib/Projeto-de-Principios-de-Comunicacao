% Definindo parâmetros
fsamp = 50e6; 
t_end = 200e-6; 

% Definindo o intervalo de tempo
t = linspace(0, t_end, round(t_end * fsamp)); 
x = linspace(0, t_end * 1e6, round(t_end * fsamp)) - 100; 

% Calculando o sinal de mensagem
mt = sinc(x);

% Calculando a FFT do sinal de mensagem
N = length(mt);
Mt_fft = fftshift(fft(mt));

% Definindo o vetor de frequência
f = (-N/2:N/2-1)*(fsamp/N);

% Plotando o espectro do sinal de mensagem 
figure;
plot(f/1e6, abs(Mt_fft));
xlim([-2 2]);
title('Espectro do Sinal de Mensagem m(t) em Banda Base');
xlabel('Frequência (MHz)');
ylabel('Magnitude');
xticks(-2:0.5:2);
grid on;

% Encontrando a largura de meia potência manualmente
Mt_fft_mag = abs(Mt_fft);
Mt_fft_mag = Mt_fft_mag / max(Mt_fft_mag);
indices = find(Mt_fft_mag >= 0.5);
f_half_power = f(indices);
bw_half_power = f_half_power(end) - f_half_power(1);

disp(['Largura de meia potência: ', num2str(bw_half_power), ' Hz']);


