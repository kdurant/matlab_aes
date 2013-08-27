function ciphertext = cipher (plaintext, w, s_box, poly_mat)
    % run demo
    % [s_box, inv_s_box, w, poly_mat, inv_poly_mat]=aes_init
    % plaintext= [00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15]

    state = reshape (plaintext, 4, 4);
    initial_round_plaintext_in = dec2hex(reshape (state, 1, 16))
    % initial round
    round_key = (w(1:4, :))';
    initial_round_key = dec2hex(reshape (round_key, 1, 16))
    state = add_round_key (state, round_key);
    initial_round_plaintext_out = dec2hex(reshape (state, 1, 16))
    % nine round
    for i_round = 1 : 9
        fprintf('Now is round %d\n',i_round)
        round_plaintext_in = dec2hex(reshape (state, 1, 16))
        state = sub_bytes (state, s_box);
        state = shift_rows (state);
        state = mix_columns (state, poly_mat);
        every_mix_columns = dec2hex(reshape (state, 1, 16))
        round_key = (w((1:4) + 4*i_round, :))';
        every_round_key = dec2hex(reshape (round_key, 1, 16))
        state = add_round_key (state, round_key);
        round_plaintext_out = dec2hex(reshape (state, 1, 16))
    end
    % final round
    final_round_plaintext_in = dec2hex(reshape (state, 1, 16))
    state = sub_bytes (state, s_box);
    state = shift_rows (state);
    round_key = (w(41:44, :))';
    final_round_key = dec2hex(reshape (round_key, 1, 16))
    state = add_round_key (state, round_key);
    final_round_plaintext_out = dec2hex(reshape (state, 1, 16))

    ciphertext = reshape (state, 1, 16);
    ciphertext = dec2hex(ciphertext);
