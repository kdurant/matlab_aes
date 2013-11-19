function rcon = rcon_gen(round_num)
    switch round_num
        case 10
            Rc = 10 ;
        case 12
            Rc = 8 ;
        case 14
            Rc = 7 ;
        otherwise
            error('incorrect round number') ;
    end
    mod_pol = bin2dec ('100011011');
    rcon(1) = 1; % generate array 
    for i = 2 : Rc
        rcon(i) = poly_mult (rcon(i-1), 2, mod_pol);
    end
    rcon = [rcon(:), zeros(Rc, 3)];
