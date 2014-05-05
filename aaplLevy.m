M = flipud(aaplus);
returns = M(2:end-1)./M(1:end-2) - 1;
aaplMean = mean(returns);
aaplStd = std(returns);
params = alpha_loglik(returns);
H = chi2gof(returns);
disp(sprintf('The optimizing value of alpha is: %d', params.alph));
disp(sprintf('The optimizing value of beta is: %d', params.bet));
disp(sprintf('The optimizing value of gamma is: %d', params.gamm));
disp(sprintf('The optimizing value of delta is: %d', params.delt));
disp(sprintf('Chi Squared Test result is %d', H));


x = -0.59:0.01:0.39;
yGauss = gaussmf(x,[aaplStd aaplMean]);
figure;
hold on;
[nlnBins, xout] = hist(returns, 600);
nlnBins = nlnBins./ max(nlnBins).*2.0;
bar(xout, nlnBins);
plotGauss = plot(x, yGauss);
set(plotGauss, 'Color', 'green', 'LineWidth',2)
yAlphaLevy = stblpdf(x, params.alph, params.bet, params.gamm, params.delt);
plotLevy = plot(x, yAlphaLevy./max(yAlphaLevy)); %normalize maximum to 1
set(plotLevy, 'Color', 'red', 'LineWidth',2);
xlabel('Gaussian vs Alpha Stable Levy for AAPL');
hold off;