clear all
close all
clc

% Vettori v e w trasposti
v=[1:1:6]';
w=[1:1:6]';

a=v+w;
b=4*v;

c=v.*w;
d=w/2;
e=v./w;

f=v'*w; % prodotto scalare v*w = v'*w

g=(2*v)-(6*w);

g1(1,1:1:6)=0; % creo array vuoto (non trasposto).
g1=g1'; % trasposto
g1(2:2:6,1)=d(2:2:6,1); % accesso indici con '(' e ')'
g1(1:2:6,1)=c(1:2:6,1);

h=[v,v,v,v,v]; % 5 copie vettore v
h([6:6:end]); % controllare output

% in h: sostituire 0 in el con indice multiplo di 5 e 1 in el con indice 
% multiplo di 6...
% in octave si puo' usare indiocizzazione unica che avviene per colonna:
% h ha 5x6 = 30 elementi che sono:
% 1 1 1 1 1
% 2 2 2 2 2
% . . . . .
% 6 6 6 6 6
% se ad esempio faccio:
% h(10) significa che prendo il 10° elemento della matrice, per colonna cioè
% 1 2 3 4 5 6 1 2 3 4  # indicizzazione per colonna.
% 1 2 3 4 5 6 7 8 9 10 # numel.
% ovviamente indico le posizioni multiple con il passo 5 a partire da 5 fino ad 
% end (vale anche per 6 passo 6 a end).
h(5:5:end)=0;
h(6:6:end)=1;

u=[1:1:6]
w
u*w % 1x6 * 6x1 = 1x1 = 1  el
w*u % 6x1 * 1x6 = 6x6 = 36 el
