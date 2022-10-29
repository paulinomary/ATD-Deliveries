%% TPC3_ATD_DiogoDoria_MarianaPaulino
%% 1. Carregamento da Imagem
I = imread('pneumonia.jpg');
title("Imagem Original");
imshow(I)

%% 2. Conversão da Imagem para Escala de Cinzas
I2 = rgb2gray(I);
figure
imshow(I2)

%% 3. Definir as Matrizes
h1 = [1 0 -1;1 0 -1;1 0 -1];
h2 = [1 1 1;0 0 0;-1 -1 -1];
h3 = [0 1 1;-1 0 1;-1 -1 0];
h4 = [1 1 0;1 0 -1;0 -1 -1];

%% 4. Aplicar convolução 2D
y1 = conv2(I2,h1,'same');
figure, imshow(y1)

y2 = conv2(I2,h2,'same');
figure, imshow(y2)

y3 = conv2(I2,h3,'same');
figure, imshow(y3)

y4 = conv2(I2,h4,'same');
figure, imshow(y4)

%% 6. Soma das Imagens

sumall = I + uint8(y1) + uint8(y2) + uint8(y3) + uint8(y4);
figure
imshow(sumall);