% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% Hello world example script.


% Genenv
whos

% Pulisce workspace da precedente variabili e terminale.
clear all
close all
clc


format long

x=0:0.01:2*pi;
y=sin(x)
plot(x,y)

% Posso chiamare altro script che eredita env.
% myotherscriptname

% function [ retval0, retval1 ] = fname(param0, param1...)
