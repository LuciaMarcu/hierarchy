def pick_str  
    gets.chomp    
  end
  
  def get_name(str)  
    new_str = str.scan(/\w+(?:"\w+)*/)   
    name = new_str[0]  
    p name
  end
  
  def get_sub(str)
    empty_str = ""
    i = str.index(",") 
    if i.nil? 
      empty_str
    else
      sub_str = str[i+1..-2].strip!
      p sub_str 
    end
    
  end
  
     
  
  str = pick_str
  get_name(str)
  get_sub(str)