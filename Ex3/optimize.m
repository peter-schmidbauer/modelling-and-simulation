function [ bestSolution, qualityProgress ] = optimize( mu, lambda, ...
    sigma, maxGen, useParents, sigmaMult, stepSize )
    
    for i = 1:mu
        s = init();
        s = evaluate(s, stepSize);
        population(i) = s;
    end
    
    bestSolution = population(1);
    
    for gen = 1:maxGen
        nr_success = 0;
        % create new population
        parfor j = 1:lambda
            % select random parent
            parent = population(randi(length(population)));
            offspring = mutate(parent, sigma);
            % evaluate
            offspring = evaluate(offspring, stepSize);
                        
            if offspring.quality < parent.quality
                nr_success = nr_success + 1;
            end
            
            newPopulation(j) = offspring;
        end
        
        if useParents
            % add population to newPopulation
            for i = lambda + 1: lambda + mu
                newPopulation(i) = population(i - lambda);
            end
        end
        % generational replacement TODO
        
        % sort new population
        [~, idx] = sort([newPopulation.quality]);
        newPopulation = newPopulation(idx);
        
        if newPopulation(1).quality < bestSolution.quality
            bestSolution = newPopulation(1);
        end
        
        % alles speichern!
        % Verlauf von quality, sigma, ...
        qualityProgress(gen) = newPopulation(1).quality;
        bestProgress(gen) = bestSolution.quality;
        sigmaProgress(gen) = sigma;
        
        % setup for next generation
        for j = 1:mu
                population(j) = newPopulation(j);
        end
        
        % sigma control (1/5 Erfolgsregel)
        if nr_success > 0.2 * lambda
            sigma = sigma * sigmaMult;
        else
            sigma = sigma / sigmaMult;
        end
    end
    
    figure;
    hold on;
    gens = 1:gen;
    plot(gens, qualityProgress, '+r');
    plot(gens, bestProgress, '-');
    plot(gens, sigmaProgress, ':');
    xlabel('Generation');
    legend('Best quality for generation', 'Best quality overall', 'sigma');
    
    hold off;
end

