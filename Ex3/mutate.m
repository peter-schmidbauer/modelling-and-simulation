function mutated = mutate( parent, sigma )

    mutated.start1 = parent.start1 + sigma * randn;
    mutated.end1 = parent.end1 + sigma * randn;
    mutated.start2 = parent.start2 + sigma * randn;
    mutated.end2 = parent.end2 + sigma * randn;
    
    if mutated.start1 > mutated.end1
        [mutated.end1, mutated.start1] = deal(mutated.start1, mutated.end1); 
    end
    
    if mutated.start2 > mutated.end2
        [mutated.end2, mutated.start2] = deal(mutated.start2, mutated.end2);
    end
    
    mutated.quality = [];
    mutated.height = [];
    mutated.velocity = [];
    
end

