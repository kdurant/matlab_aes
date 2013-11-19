% [s_box, inv_s_box, w, poly_mat, inv_poly_mat] = aes_init;
% plaintext_hex = {'00' '11' '22' '33' '44' '55' '66' '77' ...
% '88' '99' 'aa' 'bb' 'cc' 'dd' 'ee' 'ff'};
% plaintext = hex2dec (plaintext_hex);
% ciphertext = cipher (plaintext, w, s_box, poly_mat);
% re_plaintext = inv_cipher (ciphertext, w, inv_s_box, inv_poly_mat);

function [s_box, inv_s_box, w, poly_mat, inv_poly_mat] = aes_init(round_num)
    [s_box, inv_s_box] = s_box_gen;
    rcon = rcon_gen(round_num);
    switch round_num
        case 10
            %key_hex = {'00' '00' '00' '00' '00' '00' '00' '00' ...
                %'00' '00' '00' '00' '00' '00' '00' '00'};
            key_hex = {'2b' '7e' '15' '16' '28' 'ae' 'd2' 'a6' ...
                'ab' 'f7' '15' '88' '09' 'cf' '4f' '3c'} ;
        case 12
            warning('do not support this round number (12)') ;
        case 14
            %key_hex = {'00' '00' '00' '00' '00' '00' '00' '00' ...
            %    '00' '00' '00' '00' '00' '00' '00' '00' ...
            %    '00' '00' '00' '00' '00' '00' '00' '00' ...
            %    '00' '00' '00' '00' '00' '00' '00' '00'};
            key_hex = {'60' '3d' 'eb' '10' '15' 'ca' '71' 'be' ... 
                '2b' '73' 'ae' 'f0' '85' '7d' '77' '81' ...
                '1f' '35' '2c' '07' '3b' '61' '08' 'd7' ...
                '2d' '98' '10' 'a3' '09' '14' 'df' 'f4'} ;

        otherwise
            error('incorrect round number') ;
    end

    key = hex2dec(key_hex); 
    w = key_expansion (key, s_box, rcon, round_num);
    all_key=dec2hex(w);
    [poly_mat, inv_poly_mat]= poly_mat_gen;
