% Definindo parâmetros
fc = 2e6; % Frequência da portadora em Hz (2 MHz)
fsamp = 50e6; % Frequência de amostragem em Hz (50 MHz)
t0 = 0; % Tempo inicial em segundos
tf = 200e-6; % Tempo final em segundos (200 µs)

% Definindo o intervalo de tempo para a portadora
t = t0:1/fsamp:tf; % Vetor de tempo

% Calculando a portadora
ct = cos(2 * pi * fc * t);

% Selecionando o intervalo de tempo de 0 a 5 µs
t_plot = t(t <= 5e-6);
ct_plot = ct(t <= 5e-6);

% Plotando a portadora
figure;
plot(t_plot * 1e6, ct_plot); % Convertendo tempo para µs no eixo x
title('Portadora c(t) para t de 0 a 5 \mus');
xlabel('Tempo (\mus)');
ylabel('Amplitude');
ylim([-1.1 1.1]);
grid on;

% Calculando o número de ciclos da portadora no intervalo de 0 a 5 µs
num_ciclos = (5e-6) * fc;

% Exibindo o número de ciclos
disp(['Número de ciclos da portadora em 0-5 µs: ', num2str(num_ciclos)]);

