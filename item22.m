% Definindo parâmetros
fc = 0.5e6; 
fsamp = 50e6; 
t0 = 0; 
tf = 200e-6; 

% Definindo o intervalo de tempo
t = t0:1/fsamp:tf; 

% Calculando a portadora
ct = cos(2 * pi * fc * t);

% Espectro da portadora
n = length(ct);
f = (-n/2:n/2-1) * (fsamp/n) / 1e6;  
C = abs(fftshift(fft(ct)));

% Plotando separadamente 
figure;
subplot(1, 2, 1);
plot(f(f >= -2 & f <= -1.8), C(f >= -2 & f <= -1.8));
title('Espectro da Portadora (Parte Negativa)');
xlabel('Frequência (MHz)');
ylabel('Amplitude');
xlim([-2, -1.8]);
grid on;

subplot(1, 2, 2);
plot(f(f >= 1.8 & f <= 2), C(f >= 1.8 & f <= 2));
title('Espectro da Portadora (Parte Positiva)');
xlabel('Frequência (MHz)');
ylabel('Amplitude');
xlim([1.8, 2]);
grid on;

