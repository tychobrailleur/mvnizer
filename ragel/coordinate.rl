# coordinate.rl

module Mvnizer
  class CoordinateLexer


%%{

  machine coordinate_lexer;

  type = 'jar';
  separator = ':';
  identifier = ([a-zA-Z][a-zA-Z0-9\.\-]+) - type;
  group = (identifier separator)?;
  name = identifier;
  packaging = (separator type)?;

  action start_string { @start_string = p }

  action group_string { puts "Group: #{get_string(data,p)}" }
  action name_string { puts "Name: #{get_string(data,p)}" }
  action type_string { puts "Type: #{get_string(data,p)}" }

  main := |*
           group => { puts "#{ts} => #{te} #{data[ts...te].pack("c*")} " };
           name => { puts "Blah" };
           packaging => { puts "Doh" };
     #     (( identifier >start_string %group_string separator )? ;
     #       identifier >start_string %name_string ) ;
     #     ( separator type >start_string %type_string )?;
  *|;

}%%


    def initialize
      @group_found = false
      %% write data;
    end

    def scan(data)
      # convert string into an array of 8-bit signed integers.
      data = data.unpack("c*") if(data.is_a?(String))
      eof = pe = data.length
      ts = te = 0

      %% write init;
      %% write exec;
    end

    private

    def get_string(data, p)
      data[@start_string...p].pack("c*")
    end
  end
end