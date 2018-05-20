function [ sol ] = init(  )
    sol.start1 = rand * 100;
    sol.end1 = sol.start1 + rand * 100;
    sol.start2 = rand * 100;
    sol.end2 = sol.start2 + rand * 100;
    
    if sol.start1 > sol.end1
        sol.start1, sol.end1 = deal(sol.start1, sol.end1); 
    end
    
    if sol.start2 > sol.end2
        sol.start2, sol.end2 = deal(sol.start2, sol.end2);
    end
    
end

