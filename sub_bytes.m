function bytes_out = sub_bytes (bytes_in, s_box)
    bytes_out = s_box(bytes_in + 1);
    after_sub_bytes = dec2hex(bytes_out)