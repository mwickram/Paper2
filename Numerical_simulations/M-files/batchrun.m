function data=batchrun (base)

number=1:52;


for k=1:length(number)
     
     
      filename=strcat(base,'_',num2str(number(k)),'.dat')
      fname(k,1)= {filename};
       
      
      %c1=findfre(filename,100,3,1700000,1000,[0.02 0.02 0.02]); %findfre(d,rate,enum,row,erow)
      %c2=phase_diff(filename,100,3,1700000,1000);%phase_diff(dat,dar,enum,cor,corl)
      %c3=drtion(filename,100,3,1700000,1000);%phase_diff1(dat,dar,enum,cor,corl);
      %c4=get_phase(filename,100,3,1700000,1000,20);
      %c5=phase_difference(filename,100,3,1700000,1000,20);
      %c1=c1' ;
      %c=[number(k) c1 c2 c3 c4 c5];
      
      %c=[c4 c5];
      c4=get_phase(filename,100,3,1000,1000,20);
      c5=phase_difference(filename,100,3,1000,1000,20);
      c=[number(k) c4 c5];
      
      
      %data(k,1)= R(k);
      data(k,:)=c;
    

 %fout=strcat(base,num2str(number(k)),'.tiff');
 %print('-dtiff','-r300', fout);
 %close ;

end

outp=strcat('A',base,'.dat');
save ('-ascii',outp,'data');
filename=char(fname)

fig_move(base);


%save -ascii mf012710.dat data

filename=char(fname)
end
  

