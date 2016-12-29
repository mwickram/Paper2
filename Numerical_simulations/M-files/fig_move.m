function fig_move(base)
 


%movefile('*sigma*.tiff','sigma_plot');
movefile('*pd*.tiff','phase_diff');
movefile('*lm*.tiff','phase_difference');


folder_fig=strcat(base,'_','fig');

%movefile('sigma_plot',folder_fig)
movefile('phase_diff',folder_fig)
movefile('phase_difference',folder_fig)

end