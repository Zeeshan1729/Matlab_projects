clc;
clear;
close all;

%% Load IEEE 9 bus system
mpc = loadcase('case9');

%% Artificially reduce line limit to create congestion
x=1;
mpc.branch(x,6) = 50;
%% Run power flow
mpopt = mpoption('verbose',0,'out.all',0);

results = runpf(mpc,mpopt);

%% Get branch flows and limits
flows = abs(results.branch(:,14));
limits = results.branch(:,6);
