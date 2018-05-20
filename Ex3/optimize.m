function [ S, qProgress ] = optimize( mu, lambda, maxGen, plus, sigmaMult )
    

    for i = 1:mu
        s = init(100);
        s = evaluate(s);
        population{i} = s;
    end
    
    for gen = 1:maxGen
        newPopulation = cell(size(population)); % pre-alloc
        nr_success = 0;
        % create new population
        for i = 1:lambda
            % select random parent
            s = mutate(parent);
            % evaluate
            % s.q > p.q -> nr_success++
            newPopulation{i} = s;
        end
        
        if plus
            % add population to newPopulation
        end
        % generational replacement
        % A, sortrows, ...
        population = [];
        for j = ...
                population{i} = newPopulation{j};
        end
        
        % sigma control (1/5 Erfolgsregel)
        if nr_success > 0.2 * lambda
            sigma = sigma * sigmaMult;
        elif nr_success < 0.2 * lambda
            sigma = sigma / sigmaMult;
        end
        
        % alles speichern!
        % Verlauf von quality, sigma, 
    end
    
    
end

