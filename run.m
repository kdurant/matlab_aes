[s_box, inv_s_box, w, poly_mat, inv_poly_mat]=aes_init ;
%plaintext = [00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15] ;
%plaintext = [00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff] ;
%plaintext = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00] ;
plaintext_key = {'f3' '44' '81' 'ec' '3c' 'c6' '27' 'ba' 'cd' '5d' 'c3' 'fb' '08' 'f2' '73' 'e6'} ;
plaintext = hex2dec(plaintext_key); 
cipher (plaintext, w, s_box, poly_mat)
%modelname = 'AES';
%open_system(modelname);
