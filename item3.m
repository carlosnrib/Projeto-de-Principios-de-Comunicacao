% Definindo parâmetros
fsamp = 50e6; 
t_end = 200e-6; 
t = linspace(0, t_end, round(t_end * fsamp)); 
x = linspace(0, t_end * 1e6, round(t_end * fsamp)) - 100; 
m = sinc(x); 

% Plotando o sinal
figure;
plot(t * 1e6, m);  
title('Sinal da Mensagem m(t)');
xlabel('Tempo (\mus)');
ylabel('Amplitude');
xlim([90, 110]); 
ylim([-0.3, 1.1]); 
grid on;

