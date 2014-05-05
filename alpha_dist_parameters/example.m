

%--------------------------------------------------------------------------
%
% DESCRIPTION:
%
% This script contains an example on estimating the parameters of a 
%
% alpha-stable distribution by using the quantile method of McCulloch (1986). 
%
%--------------------------------------------------------------------------
%
% Author:  Paolo Z., January 2012
%
%--------------------------------------------------------------------------


clc
clear all
close all



load sample.mat

params=alpha_loglik(data);

disp(sprintf('The optimizing value of alpha is: %d',params.alph))
disp(sprintf('The optimizing value of beta is:  %d',params.bet))
disp(sprintf('The optimizing value of gamma is: %d',params.gamm))
disp(sprintf('The optimizing value of delta is: %d',params.delt))