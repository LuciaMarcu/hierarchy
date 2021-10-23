module ParserStr

  def ParserStr.pick_str 
    puts "Enter your string" 
    gets.chomp    
  end

  def ParserStr.get_name(str)  
    new_str = str.scan(/\w+(?:"\w+)*/)   
    name = new_str[0]         
  end

   def ParserStr.get_sub(str) 
    str = str.gsub(/[\s]/, '') 
    i = str.index(",") 
    sub_str = ""
    if i.nil? 
      sub_str
    else
      sub_str = str[i+1..-2]     
    end
     return sub_str
  end

  def ParserStr.parse_str(sub_str) 
    str_array = []
    if sub_str.empty?
      return str_array
    end
    sub_str = sub_str.gsub(/[\s]/, '')  
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

      str_array.delete_if {|str| str == ',' || str.empty?}  
      str_array
  end

end
    

