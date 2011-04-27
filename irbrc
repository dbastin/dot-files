# require 'rubygems'
# require 'wirble'
# 
# Wirble.init(:history_size => 10000)
# Wirble.colorize
# 
# Wirble::Colorize.colors = {
#   # delimiter colors
#   :comma              => :white,
#   :refers             => :white,
# 
#   # container colors (hash and array)
#   :open_hash          => :white,
#   :close_hash         => :white,
#   :open_array         => :white,
#   :close_array        => :white,
# 
#   # object colors
#   :open_object        => :light_red,
#   :object_class       => :red,
#   :object_addr_prefix => :blue,
#   :object_line_prefix => :blue,
#   :close_object       => :light_red,
# 
#   # symbol colors
#   :symbol             => :blue,
#   :symbol_prefix      => :blue,
# 
#   # string colors
#   :open_string        => :light_green,
#   :string             => :light_green,
#   :close_string       => :light_green,
# 
#   # misc colors
#   :number             => :light_blue,
#   :keyword            => :orange,
#   :class              => :red,
#   :range              => :light_blue,
# }
# 
# class Object
#   # Return a list of methods defined locally for a particular object.  Useful
#   # for seeing what it does whilst losing all the guff that's implemented
#   # by its parents (eg Object).
#   def local_methods(obj = self)
#     (obj.methods - obj.class.superclass.instance_methods).sort
#   end
# end
#


class Symbol
  def ^ other
    fixed = Readline::HISTORY.entries[-2].sub(self.to_s, other.to_s)  
    begin
      puts "> #{fixed}"
      eval fixed
    ensure
      Readline::HISTORY.pop
      Readline::HISTORY << fixed
    end
  end
end

require 'pp'

require 'rubygems'
require 'hirb'
require 'wirble'

Wirble.init
Wirble.colorize
Hirb::View.enable

if rails_env = ENV['RAILS_ENV']
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}> ",
    :PROMPT_S => "#{rails_root}* ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN => "=> %s\n" 
  }
  IRB.conf[:PROMPT_MODE] = :RAILS 
  IRB.conf[:IRB_RC] = Proc.new do
    begin
      ActiveRecord::Base.logger = Logger.new(STDOUT)
    rescue
      puts "No ActiveRecord for this project."
    end
  end
end

