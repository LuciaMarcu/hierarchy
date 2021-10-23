require_relative 'parser_str.rb'
require_relative 'employee.rb'

def construct_tree(entry)
    employee = Employee.new
    employee.name = ParserStr.get_name(entry)      
    employee_body = ParserStr.get_sub(entry)   
    child_arr = ParserStr.parse_str(employee_body)
   
      child_arr.each do |str|
        sub = construct_tree(str)
        employee.subordonates.push(sub)
    end   
    return employee
end

def compose_stringtree(employee)     
    tree_str= ""
    tree_str.concat(%q[("]).concat(employee.name).concat(%q["])
    if employee.subordonates.length > 0
        tree_str.concat(", ")
    end

    employee.subordonates = employee.subordonates.reject{|e| e.name == "Unavailable"}        
    

    employee.subordonates.each do |sub|
        tree_str.concat(compose_stringtree(sub)).concat(", ")
    end

    if employee.subordonates.length > 0
        tree_str = tree_str.slice(0..-3)
    end   
    tree_str.concat(")")
    return tree_str
end


entry = ParserStr.pick_str
boss = construct_tree(entry)
str = compose_stringtree(boss)
puts str







