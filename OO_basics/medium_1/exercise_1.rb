# Modify this class so both flip_switch and the 
# setter method switch= are private methods.

class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end
  
  def current_switch_state
    "The switch is currently #{switch}"
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

computer = Machine.new
p computer.start
p computer.current_switch_state
p computer.stop
p computer.current_switch_state