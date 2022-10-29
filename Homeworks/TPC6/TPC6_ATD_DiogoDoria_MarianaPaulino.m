%% TPC6_ATD_DiogoDoria_MarianaPaulino

%% 1
[y,Fs] = audioread('Hedwigs_Theme.wav');
%sound(y,Fs);  
% Uma vez que obtemos uma matriz y de valores 9085876 linhas por 2 colunas
% sabemos entao que este ultimo valor e o numero de canais de audio (2).
% a Fs utilizada e de 48000

%% 2
leftx = y(:,1); % Seleciona apenas o canal de audio esquerdo

N = length(leftx); % Calcula o length do canal esquerdo
slength = N/Fs; % Devolve o Length da amostra
t = linspace(0, N/Fs, N); 
plot(t, leftx); 

figure
idx = (t>=2) & (t<6.7); % Definicao da range do tempo que pretendemos
selected_t = t(idx);
selected_x = leftx(idx,:);
plot(selected_t, selected_x);

%% 3
nsamples = 0.030 * Fs; % 30 ms de amostras
xsamples = 0.025 * Fs; % 25 ms para sobreposicao

figure
xsegment = buffer(selected_x,nsamples,xsamples,'nodelay');
Nfft = 8192;
X = fft(xsegment, Nfft,1);
f = 0:Fs/2;

m = 0:size(xsegment,1);
amp = db(X);
amp(amp < -20) = -20;
imagesc(m,f,amp); axis xy
ylim([0 1000]); 
title('Gráfico');
xlabel('Tempo')
ylabel('Frequência')

grid on

%% 4

% Si Mi Sol Fa# Mi Si Lá Fá#