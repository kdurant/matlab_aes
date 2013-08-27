[s_box, inv_s_box, w, poly_mat, inv_poly_mat]=aes_init ;
%plaintext = [00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15] ;
%plaintext = [00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff] ;
%plaintext = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00] ;
plaintext = {'f3' '44' '81' 'ec' '3c' 'c6' '27' 'ba' 'cd' '5d' 'c3' 'fb' '08' 'f2' '73' 'e6'} ;
plaintext = hex2dec(plaintext); 
cipher (plaintext, w, s_box, poly_mat);
ciphertext = {'03' '36' '76' '3e' '96' '6d' '92' '59' '5a' '56' '7c' 'c9' 'ce' '53' '7f' '5e'};
ciphertext = hex2dec(ciphertext) ;
%modelname = 'AES';
%open_system(modelname);
inv_cipher (ciphertext, w, inv_s_box, inv_poly_mat)
