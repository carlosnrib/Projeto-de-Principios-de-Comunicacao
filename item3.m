fsamp = 50e6; % Frequência de amostragem em Hz (50 MHz)
t_end = 200e-6; % Tempo final em segundos (200 µs)
t = linspace(0, t_end, round(t_end * fsamp)); % Vetor de tempo
x = linspace(0, t_end * 1e6, round(t_end * fsamp)) - 100; % Tempo em µs ajustado
m = sinc(x); % Sinal da mensagem

figure;
plot(t * 1e6, m);  % Converter tempo para µs no eixo X
title('Sinal da Mensagem m(t)');
xlabel('Tempo (\mus)');
ylabel('Amplitude');
xlim([90, 110]); % Limite do eixo X em µs aumentado para capturar ciclos completos
ylim([-0.3, 1.1]); % Limite do eixo Y aumentado
grid on;

