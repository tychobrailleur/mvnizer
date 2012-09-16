
# line 1 "coordinate.rl"
# coordinate.rl

module Mvnizer
  class CoordinateLexer



# line 28 "coordinate.rl"



    def initialize
      
# line 17 "coordinate.rb"
class << self
	attr_accessor :_coordinate_lexer_actions
	private :_coordinate_lexer_actions, :_coordinate_lexer_actions=
end
self._coordinate_lexer_actions = [
	0, 1, 0, 1, 2, 1, 3, 2, 
	0, 1
]

class << self
	attr_accessor :_coordinate_lexer_key_offsets
	private :_coordinate_lexer_key_offsets, :_coordinate_lexer_key_offsets=
end
self._coordinate_lexer_key_offsets = [
	0, 0, 6, 11, 12, 13, 14, 24, 
	24, 35
]

class << self
	attr_accessor :_coordinate_lexer_trans_keys
	private :_coordinate_lexer_trans_keys, :_coordinate_lexer_trans_keys=
end
self._coordinate_lexer_trans_keys = [
	58, 106, 65, 90, 97, 122, 106, 65, 
	90, 97, 122, 106, 97, 114, 58, 106, 
	45, 46, 48, 57, 65, 90, 97, 122, 
	58, 97, 106, 45, 46, 48, 57, 65, 
	90, 98, 122, 58, 106, 45, 46, 48, 
	57, 65, 90, 97, 113, 115, 122, 0
]

class << self
	attr_accessor :_coordinate_lexer_single_lengths
	private :_coordinate_lexer_single_lengths, :_coordinate_lexer_single_lengths=
end
self._coordinate_lexer_single_lengths = [
	0, 2, 1, 1, 1, 1, 2, 0, 
	3, 2
]

class << self
	attr_accessor :_coordinate_lexer_range_lengths
	private :_coordinate_lexer_range_lengths, :_coordinate_lexer_range_lengths=
end
self._coordinate_lexer_range_lengths = [
	0, 2, 2, 0, 0, 0, 4, 0, 
	4, 5
]

class << self
	attr_accessor :_coordinate_lexer_index_offsets
	private :_coordinate_lexer_index_offsets, :_coordinate_lexer_index_offsets=
end
self._coordinate_lexer_index_offsets = [
	0, 0, 5, 9, 11, 13, 15, 22, 
	23, 31
]

class << self
	attr_accessor :_coordinate_lexer_indicies
	private :_coordinate_lexer_indicies, :_coordinate_lexer_indicies=
end
self._coordinate_lexer_indicies = [
	0, 3, 2, 2, 1, 3, 2, 2, 
	1, 4, 1, 5, 1, 6, 1, 8, 
	9, 7, 7, 7, 7, 1, 1, 8, 
	10, 9, 7, 7, 7, 7, 1, 8, 
	9, 7, 7, 7, 7, 7, 1, 0
]

class << self
	attr_accessor :_coordinate_lexer_trans_targs
	private :_coordinate_lexer_trans_targs, :_coordinate_lexer_trans_targs=
end
self._coordinate_lexer_trans_targs = [
	2, 0, 6, 8, 4, 5, 7, 6, 
	3, 8, 9
]

class << self
	attr_accessor :_coordinate_lexer_trans_actions
	private :_coordinate_lexer_trans_actions, :_coordinate_lexer_trans_actions=
end
self._coordinate_lexer_trans_actions = [
	7, 0, 1, 1, 1, 0, 0, 0, 
	3, 0, 0
]

class << self
	attr_accessor :_coordinate_lexer_eof_actions
	private :_coordinate_lexer_eof_actions, :_coordinate_lexer_eof_actions=
end
self._coordinate_lexer_eof_actions = [
	0, 0, 0, 0, 0, 0, 3, 5, 
	3, 3
]

class << self
	attr_accessor :coordinate_lexer_start
end
self.coordinate_lexer_start = 1;
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
self.coordinate_lexer_en_main = 1;


# line 33 "coordinate.rl"
    end

    def scan(data)
      # convert string into an array of 8-bit signed integers.
      data = data.unpack("c*") if(data.is_a?(String))
      eof = pe = data.length

      
# line 143 "coordinate.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = coordinate_lexer_start
end

# line 41 "coordinate.rl"
      
# line 152 "coordinate.rb"
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
	cs = _coordinate_lexer_trans_targs[_trans]
	if _coordinate_lexer_trans_actions[_trans] != 0
		_acts = _coordinate_lexer_trans_actions[_trans]
		_nacts = _coordinate_lexer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _coordinate_lexer_actions[_acts - 1]
when 0 then
# line 18 "coordinate.rl"
		begin
 @start_string = p 		end
when 1 then
# line 19 "coordinate.rl"
		begin
 puts "Group: " + data[@start_string...p].pack("c*") 		end
when 2 then
# line 20 "coordinate.rl"
		begin
 puts "Name: " + data[@start_string...p].pack("c*") 		end
# line 245 "coordinate.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
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
	__acts = _coordinate_lexer_eof_actions[cs]
	__nacts =  _coordinate_lexer_actions[__acts]
	__acts += 1
	while __nacts > 0
		__nacts -= 1
		__acts += 1
		case _coordinate_lexer_actions[__acts - 1]
when 2 then
# line 20 "coordinate.rl"
		begin
 puts "Name: " + data[@start_string...p].pack("c*") 		end
when 3 then
# line 21 "coordinate.rl"
		begin
 puts "Type: " + data[@start_string...p].pack("c*") 		end
# line 281 "coordinate.rb"
		end # eof action switch
	end
	if _trigger_goto
		next
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 42 "coordinate.rl"
    end
  end
end