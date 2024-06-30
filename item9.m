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

% Calculando a FFT inversa para obter a mensagem recuperada
mt_recovered = ifft(ifftshift(Rt_fft_filtered));
mt_recovered = real(mt_recovered); % Pegando a parte real do sinal

% Comparando graficamente a mensagem original e a recuperada
figure;
plot(t * 1e6, mt, 'b', 'DisplayName', 'Mensagem Original'); 
hold on;
plot(t * 1e6, mt_recovered, 'r', 'DisplayName', 'Mensagem Recuperada'); 
hold off;
title('Comparação entre a Mensagem Original e a Mensagem Recuperada');
xlabel('Tempo (\mus)');
ylabel('Amplitude');
ylim([-0.3, 1.1]);
legend;
grid on;

% Calculando o coeficiente de correlação entre a mensagem original e a recuperada
correlation = corrcoef(mt, mt_recovered);
correlation_value = correlation(1, 2);

disp(['Coeficiente de correlação entre a mensagem original e a recuperada: ', num2str(correlation_value, '%.10f')]);

