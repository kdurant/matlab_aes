function ciphertext = cipher (plaintext, w, s_box, poly_mat)
    % run demo
    % [s_box, inv_s_box, w, poly_mat, inv_poly_mat]=aes_init
    % plaintext= [00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15]

    state = reshape (plaintext, 4, 4);
    % initial round
    round_key = (w(1:4, :))';
    state = add_round_key (state, round_key);
    % nine round
    for i_round = 1 : 9
        state = sub_bytes (state, s_box);
        state = shift_rows (state);
        state = mix_columns (state, poly_mat);
        round_key = (w((1:4) + 4*i_round, :))';
        state = add_round_key (state, round_key);
    end
    % final round
    state = sub_bytes (state, s_box);
    state = shift_rows (state);
    round_key = (w(41:44, :))';
    state = add_round_key (state, round_key);

    ciphertext = reshape (state, 1, 16);
