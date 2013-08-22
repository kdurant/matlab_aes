% [s_box, inv_s_box, w, poly_mat, inv_poly_mat] = aes_init;
% plaintext_hex = {'00' '11' '22' '33' '44' '55' '66' '77' ...
% '88' '99' 'aa' 'bb' 'cc' 'dd' 'ee' 'ff'};
% plaintext = hex2dec (plaintext_hex);
% ciphertext = cipher (plaintext, w, s_box, poly_mat);
% re_plaintext = inv_cipher (ciphertext, w, inv_s_box, inv_poly_mat);

function [s_box, inv_s_box, w, poly_mat, inv_poly_mat] = aes_init
    [s_box, inv_s_box] = s_box_gen;
    rcon = rcon_gen;
%    key_hex = {'00' '01' '02' '03' '04' '05' '06' '07' ...
 %       '08' '09' '0a' '0b' '0c' '0d' '0e' '0f'};
%    key_hex = {'00' '11' '22' '33' '44' '55' '66' '77' ...
%        '88' '99' 'aa' 'bb' 'cc' 'dd' 'ee' 'ff'};
    key_hex = {'00' '00' '00' '00' '00' '00' '00' '00' ...
        '00' '00' '00' '00' '00' '00' '00' '00'};
    key = hex2dec(key_hex); 
    w = key_expansion (key, s_box, rcon);
    [poly_mat, inv_poly_mat]= poly_mat_gen;
