def pick_str  
  gets.chomp    
end

def get_name(str)  
  new_str = str.scan(/\w+(?:"\w+)*/)   
  name = new_str[0]  
  puts "The name #{name}" 
end

def get_sub(str)  
  i = str.index(",") 
  if i.nil? 
    puts "String empty"
  else
    sub_str = str[i+1..-2].strip!
    puts "Substring #{sub_str}"
    puts sub_str.length
  end
  sub_str
end

def parse_str(sub_str) 
  str_array = []
  if sub_str.empty?
    puts "String is empty #{str_array}"
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
    puts "Parse #{str_array}"
end
  
  
initial_str = pick_str
get_name(initial_str)
sub_str = get_sub(initial_str)
parse_str("")
