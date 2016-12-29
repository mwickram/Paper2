function rate = koper_rate(potential)

  k1=2.5;k2=0.01;nalpha=0.5;
  e0=30.0;ed=35.0;b=0.5;
  
  
  theta = koper_theta(potential,ed,b);
  rate=k1*theta*theta + k2*exp(nalpha*(potential - e0));



  
end

