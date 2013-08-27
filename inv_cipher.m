function plaintext = inv_cipher (ciphertext, w, inv_s_box, inv_poly_mat)
    state = reshape (ciphertext, 4, 4);
    initial_round_plaintext_in = dec2hex(reshape (state, 1, 16))
    % initial round
    round_key = (w(41:44, :))';
    initial_round_key = dec2hex(reshape (round_key, 1, 16))
    state = add_round_key (state, round_key);
    initial_round_plaintext_out = dec2hex(reshape (state, 1, 16))
    % nine round
    for i_round = 9 : -1 : 1
        fprintf('Now is round %d\n',i_round)
        round_plaintext_in = dec2hex(reshape (state, 1, 16))
        state = inv_shift_rows (state);
        state = sub_bytes (state, inv_s_box);
        round_key = (w((1:4) + 4*i_round, :))';
        every_round_key = dec2hex(reshape (round_key, 1, 16))
        state = add_round_key (state, round_key);
        round_plaintext_out = dec2hex(reshape (state, 1, 16))
    end
    % final round
    final_round_plaintext_in = dec2hex(reshape (state, 1, 16))
    state = inv_shift_rows (state);
    state = sub_bytes (state, inv_s_box);
    round_key = (w(1:4, :))';
    final_round_key = dec2hex(reshape (round_key, 1, 16))
    state = add_round_key (state, round_key);
    final_round_plaintext_out = dec2hex(reshape (state, 1, 16))
    plaintext = reshape (state, 1, 16);
