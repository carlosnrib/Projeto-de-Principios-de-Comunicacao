% Definindo parâmetros
fc =0.5e6; 
fsamp = 50e6; 
t0 = 0; 
tf = 200e-6; 

% Definindo o intervalo de tempo para a portadora
t = t0:1/fsamp:tf; 

% Calculando a portadora
ct = cos(2 * pi * fc * t);

% Selecionando o intervalo de tempo de 0 a 5 µs
t_plot = t(t <= 5e-6);
ct_plot = ct(t <= 5e-6);

% Plotando a portadora
figure;
plot(t_plot * 1e6, ct_plot); 
title('Portadora c(t) para t de 0 a 5 \mus');
xlabel('Tempo (\mus)');
ylabel('Amplitude');
ylim([-1.1 1.1]);
grid on;

% Calculando o número de ciclos da portadora no intervalo de 0 a 5 µs
num_ciclos = (5e-6) * fc;

disp(['Número de ciclos da portadora em 0-5 µs: ', num2str(num_ciclos)]);

