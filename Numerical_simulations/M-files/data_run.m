function data_run (base)


R=[inf]% 1000000 100000 10000 5000 2500 1000 500 400 375 350 345 343 340 337 335 333 330 327 323 320 310 297.5 289 284 277 274 269.5 263 256 229 222 207 200 190 180 170 160 150 140 130 120 111 100 92 90 88 15 12 10 7 1];

rl=length(R);
number=[1:rl];
    
for k=1:length(number)
     data=run_odek(36.7395,0.02000,R(k),[1.003 0.995 0.988897]);
     pack('data');
     filename=strcat(base,'_',num2str(k),'.dat')
     save ('-ascii',filename,'data');
     
     movefile('m*.dat',base);

     fname(k,1)= {filename};
       
       
      %c1=findfre(filename,100,3,1000,1000,[0.02 0.02 0.02]); %findfre(d,rate,enum,row,erow)
      %c2=phase_diff(filename,100,3,1000,1000);%phase_diff(dat,dar,enum,cor,corl)
      %c3=drtion(filename,100,3,1000,1000);%phase_diff1(dat,dar,enum,cor,corl);
      c4=get_phase(filename,100,3,1000,1000,20);
      c5=phase_difference(filename,100,3,1000,1000);
      
      %c1=c1';
      %c=[c1 c2 c3 c4 c5];
      c=[c4 c5];
      
      
      %data(k,1)= R(k);
    
    
      data_out(k,1:18)=c;
      
  
  
end

outp=strcat('G',base,'.dat');
save ('-ascii',outp,'data_out');
filename=char(fname)

fig_move(base);
end
  

