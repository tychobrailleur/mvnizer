# coordinate.rl

module Mvnizer
  class CoordinateLexer


%%{

  machine coordinate_lexer;

  type = 'jar';
  separator = ':';
  identifier = [a-zA-Z][a-zA-Z0-9\.\-]*;

  group = (identifier -- type)?$(identifier,0);
  name = (identifier -- type)$(identifier,1);

  action start_string { @start_string = p }
  action group_string { puts "Group: " + data[@start_string...p].pack("c*") }
  action name_string { puts "Name: " + data[@start_string...p].pack("c*") }
  action type_string { puts "Type: " + data[@start_string...p].pack("c*") }

  main := ( group >start_string %group_string separator )?
       	    name >start_string %name_string
          ( separator type >start_string %type_string )?
; 

}%%


    def initialize
      %% write data;
    end

    def scan(data)
      # convert string into an array of 8-bit signed integers.
      data = data.unpack("c*") if(data.is_a?(String))
      eof = pe = data.length

      %% write init;
      %% write exec;
    end
  end
end