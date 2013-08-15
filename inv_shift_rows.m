function state_out = inv_shift_rows (state_in)
state_out = cycle (state_in, 'right');
