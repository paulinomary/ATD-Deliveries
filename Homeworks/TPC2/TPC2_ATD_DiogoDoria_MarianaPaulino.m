%% TPC2_ATD_DiogoDoria_MarianaPaulino
%% 1. Carregamento matriz
dados = load('earthquake.mat').B5;
dados;

%% 2. Vetor Tempo
tempo = (length(dados) - 1)*0.025;
vetor = 0:0.025:tempo;

%% 3. Grafico do Sinal
figure
plot(vetor,dados)
title('Gráfico do Sinal');
xlabel('Tempo')
ylabel('Amplitude')

%% 4. Valor de Energia por Segmento com Overlap 50%
N = 1.5/0.025;
M = N * 0.5;
x = buffer(dados, N, N-M,'nodelay');
E = sum(abs(x).^2);

%% 5 Identificar o Instante que tem Movimento Máximo
energy = length(E);
energyt = 1.5 + (0:energy-1)*0.75;
[energymax, ind] = max(E);
maxt = energyt(ind);

%% 6 Instantes Iniciais e Finais do Terramoto
% Considerando Valores de Energia Superiores a 0.1% da Energia Máxima Atingida
e_treshold = 0.001 * energymax;
vals = find(E > e_treshold);
lvals = length(vals)

% Inicio do Terremoto
iniciotremor = E(vals(1));
indi = find(E == iniciotremor);
ti = energyt(indi)

% Fim do Terremoto
fimtremor = E(vals(91));
indf = find(E == fimtremor);
tf = energyt(indf)

%% 7 Gráfico Valores Energia em Função do Tempo
figure
plot(energyt,E)
title('Gráfico dos Valores de Energia');
xlabel('Tempo (s)')
ylabel('Valores de Energia')
