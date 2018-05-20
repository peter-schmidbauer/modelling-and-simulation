mu = 20;
lambda = 25;
initialSigma = 10;
maxGen = 40;
useParents = 0;
sigmaMult = 1.15;
stepSize = 0.01;
    
[best, q] = optimize(mu, lambda, initialSigma, maxGen, useParents, ...
    sigmaMult, stepSize);
best
figure;
hold on;
plot(best.t, best.height);
plot(best.t, best.velocity);
hold off;