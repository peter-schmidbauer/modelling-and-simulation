function m = mutate( p, sigma )
    m.start1 = p.start1 + sigma * randn;
    m.end1 = p.end1 + sigma * randn;
    m.start2 = p.start2 + sigma * randn;
    m.end2 = p.end2 + sigma * randn;

    

end

