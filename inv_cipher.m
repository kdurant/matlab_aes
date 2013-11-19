function plaintext = inv_cipher (ciphertext, w, inv_s_box, inv_poly_mat, round_num)
    state = reshape (ciphertext, 4, 4);
    % initial round
    round_key = (w( (round_num+1)*4-3:(round_num+1)*4, :))';
    state = add_round_key (state, round_key);
    % nine round
    for i_round = round_num-1 : -1 : 1
        state = inv_shift_rows (state);
        state = sub_bytes (state, inv_s_box);
        round_key = (w((1:4) + 4*i_round, :))';
        state = add_round_key (state, round_key);
        state = mix_columns (state, inv_poly_mat);
    end
    % final round
    state = inv_shift_rows (state);
    state = sub_bytes (state, inv_s_box);
    round_key = (w(1:4, :))';
    state = add_round_key (state, round_key);
    plaintext = reshape (state, 1, 16);
