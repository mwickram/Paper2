function theta = koper_theta(potential,ed,b)

  if (potential <= ed)
    theta=1;
  else 
    theta=exp(-1*b*(potential-ed)*(potential-ed));
  end
  
end
