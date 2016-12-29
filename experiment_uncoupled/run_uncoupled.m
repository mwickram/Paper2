function run_uncoupled

[a]=get_phase_uncoupled;
[b]=phase_difference;

data=[a b];

save ('-ascii','Am050410.dat','data');
end


