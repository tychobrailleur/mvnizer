
# line 1 "coordinate.rl"
# coordinate.rl

module Mvnizer
  class CoordinateLexer



# line 33 "coordinate.rl"



    def initialize
      @group_found = false
      
# line 18 "coordinate.rb"
class << self
	attr_accessor :_coordinate_lexer_actions
	private :_coordinate_lexer_actions, :_coordinate_lexer_actions=
end
self._coordinate_lexer_actions = [
	0, 1, 2, 1, 5, 1, 6, 1, 
	7, 1, 8, 2, 0, 1, 2, 3, 
	4
]

class << self
	attr_accessor :_coordinate_lexer_key_offsets
	private :_coordinate_lexer_key_offsets, :_coordinate_lexer_key_offsets=
end
self._coordinate_lexer_key_offsets = [
	0, 0, 1, 2, 3, 11, 20, 26, 
	35
]

class << self
	attr_accessor :_coordinate_lexer_trans_keys
	private :_coordinate_lexer_trans_keys, :_coordinate_lexer_trans_keys=
end
self._coordinate_lexer_trans_keys = [
	106, 97, 114, 45, 46, 48, 57, 65, 
	90, 97, 122, 97, 45, 46, 48, 57, 
	65, 90, 98, 122, 58, 106, 65, 90, 
	97, 122, 58, 45, 46, 48, 57, 65, 
	90, 97, 122, 58, 114, 45, 46, 48, 
	57, 65, 90, 97, 122, 0
]

class << self
	attr_accessor :_coordinate_lexer_single_lengths
	private :_coordinate_lexer_single_lengths, :_coordinate_lexer_single_lengths=
end
self._coordinate_lexer_single_lengths = [
	0, 1, 1, 1, 0, 1, 2, 1, 
	2
]

class << self
	attr_accessor :_coordinate_lexer_range_lengths
	private :_coordinate_lexer_range_lengths, :_coordinate_lexer_range_lengths=
end
self._coordinate_lexer_range_lengths = [
	0, 0, 0, 0, 4, 4, 2, 4, 
	4
]

class << self
	attr_accessor :_coordinate_lexer_index_offsets
	private :_coordinate_lexer_index_offsets, :_coordinate_lexer_index_offsets=
end
self._coordinate_lexer_index_offsets = [
	0, 0, 2, 4, 6, 11, 17, 22, 
	28
]

class << self
	attr_accessor :_coordinate_lexer_indicies
	private :_coordinate_lexer_indicies, :_coordinate_lexer_indicies=
end
self._coordinate_lexer_indicies = [
	0, 1, 2, 1, 3, 1, 5, 5, 
	5, 5, 4, 6, 5, 5, 5, 5, 
	1, 7, 9, 8, 8, 1, 11, 5, 
	5, 5, 5, 10, 11, 8, 5, 5, 
	5, 5, 10, 0
]

class << self
	attr_accessor :_coordinate_lexer_trans_targs
	private :_coordinate_lexer_trans_targs, :_coordinate_lexer_trans_targs=
end
self._coordinate_lexer_trans_targs = [
	2, 0, 3, 6, 6, 7, 8, 1, 
	4, 5, 6, 6
]

class << self
	attr_accessor :_coordinate_lexer_trans_actions
	private :_coordinate_lexer_trans_actions, :_coordinate_lexer_trans_actions=
end
self._coordinate_lexer_trans_actions = [
	0, 0, 0, 5, 9, 0, 14, 0, 
	0, 0, 7, 3
]

class << self
	attr_accessor :_coordinate_lexer_to_state_actions
	private :_coordinate_lexer_to_state_actions, :_coordinate_lexer_to_state_actions=
end
self._coordinate_lexer_to_state_actions = [
	0, 0, 0, 0, 0, 0, 11, 0, 
	0
]

class << self
	attr_accessor :_coordinate_lexer_from_state_actions
	private :_coordinate_lexer_from_state_actions, :_coordinate_lexer_from_state_actions=
end
self._coordinate_lexer_from_state_actions = [
	0, 0, 0, 0, 0, 0, 1, 0, 
	0
]

class << self
	attr_accessor :_coordinate_lexer_eof_trans
	private :_coordinate_lexer_eof_trans, :_coordinate_lexer_eof_trans=
end
self._coordinate_lexer_eof_trans = [
	0, 0, 0, 0, 5, 0, 0, 11, 
	11
]

class << self
	attr_accessor :coordinate_lexer_start
end
self.coordinate_lexer_start = 6;
class << self
	attr_accessor :coordinate_lexer_first_final
end
self.coordinate_lexer_first_final = 6;
class << self
	attr_accessor :coordinate_lexer_error
end
self.coordinate_lexer_error = 0;

class << self
	attr_accessor :coordinate_lexer_en_main
end
self.coordinate_lexer_en_main = 6;


# line 39 "coordinate.rl"
    end

    def scan(data)
      # convert string into an array of 8-bit signed integers.
      data = data.unpack("c*") if(data.is_a?(String))
      eof = pe = data.length
      ts = te = 0

      
# line 164 "coordinate.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = coordinate_lexer_start
	ts = nil
	te = nil
	act = 0
end

# line 48 "coordinate.rl"
      
# line 176 "coordinate.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_acts = _coordinate_lexer_from_state_actions[cs]
	_nacts = _coordinate_lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _coordinate_lexer_actions[_acts - 1]
			when 2 then
# line 1 "NONE"
		begin
ts = p
		end
# line 210 "coordinate.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _coordinate_lexer_key_offsets[cs]
	_trans = _coordinate_lexer_index_offsets[cs]
	_klen = _coordinate_lexer_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _coordinate_lexer_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _coordinate_lexer_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _coordinate_lexer_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _coordinate_lexer_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _coordinate_lexer_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	_trans = _coordinate_lexer_indicies[_trans]
	end
	if _goto_level <= _eof_trans
	cs = _coordinate_lexer_trans_targs[_trans]
	if _coordinate_lexer_trans_actions[_trans] != 0
		_acts = _coordinate_lexer_trans_actions[_trans]
		_nacts = _coordinate_lexer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _coordinate_lexer_actions[_acts - 1]
when 3 then
# line 1 "NONE"
		begin
te = p+1
		end
when 4 then
# line 26 "coordinate.rl"
		begin
act = 2;		end
when 5 then
# line 25 "coordinate.rl"
		begin
te = p+1
 begin  puts "#{ts} => #{te} #{data[ts...te].pack("c*")} "  end
		end
when 6 then
# line 27 "coordinate.rl"
		begin
te = p+1
 begin  puts "Doh"  end
		end
when 7 then
# line 26 "coordinate.rl"
		begin
te = p
p = p - 1; begin  puts "Blah"  end
		end
when 8 then
# line 1 "NONE"
		begin
	case act
	when 0 then
	begin	begin
		cs = 0
		_trigger_goto = true
		_goto_level = _again
		break
	end
end
	when 2 then
	begin begin p = ((te))-1; end
 puts "Blah" end
end 
			end
# line 321 "coordinate.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _coordinate_lexer_to_state_actions[cs]
	_nacts = _coordinate_lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _coordinate_lexer_actions[_acts - 1]
when 0 then
# line 1 "NONE"
		begin
ts = nil;		end
when 1 then
# line 1 "NONE"
		begin
act = 0
		end
# line 346 "coordinate.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _coordinate_lexer_eof_trans[cs] > 0
		_trans = _coordinate_lexer_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 49 "coordinate.rl"
    end

    private

    def get_string(data, p)
      data[@start_string...p].pack("c*")
    end
  end
end