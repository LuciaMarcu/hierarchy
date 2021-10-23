require_relative 'parser_str.rb'
require_relative 'employee.rb'

def construct_tree(entry)
    boss = Employee.new
    boss.name = ParserStr.get_name(entry)
    p boss.name   
    boss_body = ParserStr.get_sub(entry)   
    child_arr = ParserStr.parse_str(boss_body)
   
      child_arr.each do |str|
        subx = construct_tree(str)
        boss.subordonates.push(subx)
    end
    boss
end


entry = ParserStr.pick_str
construct_tree(entry)








