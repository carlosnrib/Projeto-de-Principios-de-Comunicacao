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

% Selecionando o intervalo de tempo de 90 a 110 µs
t_plot_start = 90e-6; % Tempo inicial para plotagem em segundos
t_plot_end = 110e-6; % Tempo final para plotagem em segundos

% Encontrando os índices correspondentes ao intervalo de 90 a 110 µs
indices = t >= t_plot_start*1e6 & t <= t_plot_end*1e6;

% Selecionando os valores de tempo e do sinal modulado para plotagem
t_plot = t(indices);
st_plot = st(indices);

% Plotando o sinal modulado no intervalo de 90 a 110 µs
figure;
plot(t_plot, st_plot);
title('Sinal Modulado s(t) no intervalo de 90 a 110 \mus');
xlabel('Tempo (\mus)');
ylabel('Amplitude');
yticks(-2:0.5:2);
ylim([-1.1, 1.1]);
grid on;

