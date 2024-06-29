% Definindo parâmetros
fc = 0.5e6; % Frequência da portadora em Hz (0.5 MHz)
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
plot(t * 1e6, mt, 'b', 'DisplayName', 'Mensagem Original'); % Plotando a mensagem original em azul
hold on;
plot(t * 1e6, mt_recovered, 'r', 'DisplayName', 'Mensagem Recuperada'); % Plotando a mensagem recuperada em vermelho
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

% Exibindo o valor da correlação
disp(['Coeficiente de correlação entre a mensagem original e a recuperada: ', num2str(correlation_value, '%.10f')]);

