%% TPC4_ATD_DiogoDoria_MarianaPaulino
%% 1 Abrir o arquivo U2song.mat e ouvir o sinal de audio

load('U2song.mat');
x = U2song;
%soundsc(x, Fs)

%% 2 Representar graficamente a resposta ao impulso dos filtros

% hlow e a resposta ao impulso de um filtro passa baixo (corta frequencias
% acima de 0.5*pi 
% hstop e a resposta ao impulso de um filtro rejeita banda (exclui entre
% 0.1*pi e 0.2*pi)
% Fs frequencia de amostragem do sinal de audio

x1 = impz(hlow);
figure
stem(x1)
title('Resposta ao impulso do filtro Passa Baixo');
xlabel('Tempo em Segundos')
ylabel("Amplitude")

x2 = impz(hstop);
figure
stem(x2)
title('Resposta ao impulso do filtro Rejeita Banda');
xlabel('Tempo em Segundos')
ylabel("Amplitude")

%% 3 Convolucao

convol1 = conv(U2song, hstop);

convol2 = conv(convol1, hlow);
figure
plot(convol2)
title('Convolução');
xlabel('Tempo em Segundos')
ylabel("Amplitude")

%% 4 Resposta do Impulso dos subsistemas interligados

h1 = conv(hstop,hlow,"same");

filt = conv(U2song,h1,"same");
figure
plot(filt)
title('Convolução');
xlabel('Tempo em Segundos')
ylabel("Amplitude")

%% 6 Representar graficamente o sinal original e o sinal filtrado
% Representacao em funcao de n*Ts (n*periodo)

n = 0:(length(U2song)-1);
Ts = 1/Fs;
t = n * Ts;

figure
plot(t, U2song, t, filt)

title('Gráficos');
xlabel('Tempo em Segundos')
ylabel("Amplitude")
%% 7 Ouvir a versao filtrada e comparar com a original

%sound(filt, Fs)
%sound(U2song, Fs)