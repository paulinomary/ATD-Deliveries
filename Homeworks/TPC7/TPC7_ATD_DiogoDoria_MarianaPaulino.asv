%% 1
load('eeg.mat');
Ts = 1/fs;
n = 0 : length(eeg)-1;
x = n*Ts;

plot(x,eeg)

%% 2
F = fft(eeg);
DFT = fftshift(F)*fs;
N = length(eeg);

fint = -fs/2 : fs/N : fs/2-fs/N;
stem(fint, abs(DFT))

%% 3
% Componentes: 16, 24, 28 -> Beta

%% 4
fs2 =36;
dn = round(2048/(36*x(end)));
eeg2 = eeg(1:dn:N);
N2 = length(eeg2);
Ts2 = 1/fs2;
n2 = 0:dn:N-1;
plot(x,eeg,'-b',n2/fs,eeg2,'r')

%% 5
F2 = fft(eeg2, 1024);
DFT2 = fftshift(F2);
f2 = -fs2/2 : fs2/1024 : fs2/2 -fs2/1024;
plot(f2, abs(DFT2))

%% 6
% Passou para Alpha

%% 7.
%


%% 8
% filter = fir1(100, 24/26, 'low');
% s_fil = conv(eeg,filter,'same');
% F3 = fft(s_fil);
% DFT3 = fftshift(F3);
% stem(fint,abs(DFT3))

filt = fir1(100, 24/26, 'low');
sfil = conv(eeg,filt,'same');
F3 = fft(sfil);
DFT3 = fftshift(F3);
[H,w] = freqz(filt,1);
tiledlayout(2,1)
nexttile
plot(w/pi, abs(H))
nexttile
plot(x,abs(DFT3))

% Os componentes nao foram alterados no entanto o eixo das frequencias
% foi reduzido em comparação com a alinea 2