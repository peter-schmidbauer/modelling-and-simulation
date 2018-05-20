function [ solution ] = evaluate( solution, stepSize )

    model = 'moonlander_parametrized';
    notLandedPenalty = 1; 
    simParams = simget(model);
    simParams = simset(simParams, 'FixedStep', stepSize);
    
    modelParams =  [1, solution.start1, solution.end1, ...
                       solution.start2, solution.end2];
                   
    [T, ~, Y] = sim(model, 100, simParams, modelParams);
    solution.height = Y(:, 1);
    solution.t = T;
    solution.velocity = Y(:, 2);
    
    impactIndex = find(solution.height < 0, 1);
    
    if isempty(impactIndex)
        solution.landed = false;
        [minHeight, minIndex] =  min(solution.height);
        % subtract velocity at min height to discourage algorithm from 
        % crashing with high velocity right after the simulation ends
        solution.quality = minHeight + notLandedPenalty - ...
            solution.velocity(minIndex);
    else
        solution.landed = true;
        solution.quality = -solution.velocity(impactIndex);
    end

end

