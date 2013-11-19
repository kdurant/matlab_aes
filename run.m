clear;clc
fileID = fopen('data.txt', 'w+') ;
round_num = 14 ;
[s_box, inv_s_box, w, poly_mat, inv_poly_mat]=aes_init(round_num) ;
%plaintext = [00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15] ;
%plaintext = [00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff] ;
%plaintext = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00] ;
%plaintext = {'f3' '44' '81' 'ec' '3c' 'c6' '27' 'ba' 'cd' '5d' 'c3' 'fb' '08' 'f2' '73' 'e6'} ;
plaintext = {'10' '01' '00' '00' '00' '00' '00' '00' '00' '00' '00' '00' '00' '00' '00' '00'} ;
plaintext = hex2dec(plaintext); 
ciphertext = cipher (plaintext, w, s_box, poly_mat, round_num);

ciphertext = hex2dec(ciphertext) ;
clc ;
[s_box, inv_s_box, w, poly_mat, inv_poly_mat]=aes_init(round_num) ;
%disp('Now inv_cipher');
plaintext =inv_cipher (ciphertext, w, inv_s_box, inv_poly_mat, round_num) ;
plaintext = dec2hex(plaintext) ;
fclose(fileID) ;

