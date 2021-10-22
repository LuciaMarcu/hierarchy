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

  def parse_str(sub_str)
    sub_str = sub_str.gsub(/[\s,]/, '')
    str_array = []
    balance = 0
    i = -1
    l = sub_str.length - 1 
    for j in 0..l
        if balance == 0
            i += 1
            str_array.push("")
        end      
      
        if sub_str[j] == "("
            balance += 1      
                             
        elsif sub_str[j] == ")"
            balance -= 1            
        end
        
        str_array[i] << sub_str[j]        

    end

    str_array
  end


  end  
  
  
  initial_str = pick_str
  get_name(initial_str)
  sub_str = get_sub(initial_str)
  parse_str(sub_str)