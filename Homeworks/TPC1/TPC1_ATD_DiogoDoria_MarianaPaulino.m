%% TPC1_ATD_Diogo Doria_Mariana Paulino

clc;
clear;
%% 1. Carregamento matriz NF

load('NF.mat')

%% 2. Apresentação Anos

years = (5:21)

%% 3. Cálculo dos valores não existentes e substituição dos valores na matriz

% Definição da Função como Função Anónima
func = @(x) 0.19*(x.^3) - 4.41*(x.^2) + 35.32*(x) - 89.4

% Verificação do número de posições com valor NaN
nNaNsAntes = sum(isnan(NF(:)))

% Cálculo Posições em Falta
[col, row] = find(isnan(NF.'))

% Cálculo dos Valores em Falta
func(18:21)

% Substituição dos Valores em Falta nas suas posições
NF(3, 14:17) = func(18:21)

% Verificar se ainda existe algum NaN
nNaNsDepois = sum(isnan(NF(:)))

%% 4. Gráficos

% Funções Relativas às linhas da Matriz NF

% Função para representação da Receita
l1 = NF(1,1:17);

% Função para representação do Lucro
l2 = NF(2,1:17);

% Função para representação do Valor das Ações
l3 = NF(3,1:17);

% Função para representação do Número de Assinantes
l4 = NF(4,1:17);

% Criar os plots
t = tiledlayout(2,2);

%1
nexttile
plot(years,l1)
xlabel('Anos')
ylabel('Valor da Receita')
title('Gráfico da Receita em milhões de USD')

%2
nexttile
plot(years,l2)
xlabel('Anos')
ylabel('Valor do Lucro')
title('Gráfico do Lucro em milhões de USD')

%3
nexttile
plot(years,l3)
xlabel('Anos')
ylabel('Valor das Ações')
title('Gráfico do Valor das Ações em milhões de USD')

%4
nexttile
plot(years,l4)
xlabel('Anos')
ylabel('Número de Assinantes')
title('Gráfico do Número de Assinantes em milhões')