function rcon = rcon_gen
    mod_pol = bin2dec ('100011011');
    rcon(1) = 1; % generate array 
    for i = 2 : 10
        rcon(i) = poly_mult (rcon(i-1), 2, mod_pol);
    end
    rcon = [rcon(:), zeros(10, 3)];
