clc
clear all
close all


% A e' una matrice quadrata (n x n) con Reali.
% n preso da input.
n=input('Matrix dimension: ');
A=rand(n)
c=sum(A); % vettore somma colonna.
r=sum(A'); % moooolto piu' facile di quello che sembra perche' inverto row con 
% col poi faccio somma col (come prima).

q=sum((A').^2); % array che ha somma degli elementi al quadrato di ogni row.

max(A); % max el per colonna.
max(max(A)); % max el di tutta la matrice.

sum(sum(A)) % somma tutti elementi matrice.
