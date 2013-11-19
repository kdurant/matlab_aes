function ciphertext = cipher (plaintext, w, s_box, poly_mat, round_num)
    switch round_num
        case 10
            colomun = 4 ;
        case 12
        case 14
            colomun = 8 ;
        otherwise
            error('') 
    end
    state = reshape (plaintext, 4, 4);
    round_key = (w(1:4, :))';
    state = add_round_key (state, round_key);
    for i_round = 1 : round_num-1
        state = sub_bytes (state, s_box);
        state = shift_rows (state);
        state = mix_columns (state, poly_mat);
        round_key = (w((1:4) + 4*i_round, :))';
        state = add_round_key (state, round_key);
    end
    state = sub_bytes (state, s_box);
    state = shift_rows (state);
    round_key = (w((round_num+1)*4-3:(round_num+1)*4, :))';
    state = add_round_key (state, round_key);

    ciphertext = reshape (state, 1, 16);
    ciphertext = dec2hex(ciphertext);
