require "./crystal_game"

class CrystalGameTest < CrystalGame::Window
  def initialize
    super()
    @counter = 0
  end

  def draw
    fill(CrystalGame::Color::RED)
  end

  def update
    self.caption="#{@counter}"
    @counter+=1
    # XBOX 360 WIRELESS CONTROLLER
    if SF::Joystick.is_connected(0)
      puts "Joysticks connected: #{SF::Joystick::Count}"

      if SF::Joystick.is_button_pressed(0, 0)
        puts "A"
      elsif SF::Joystick.is_button_pressed(0, 1)
        puts "B"
      elsif SF::Joystick.is_button_pressed(0, 2)
        puts "X"
      elsif SF::Joystick.is_button_pressed(0, 3)
        puts "Y"
      elsif SF::Joystick.is_button_pressed(0, 4)
        puts "Left_bumper"
      elsif SF::Joystick.is_button_pressed(0, 5)
        puts "Right_bumper"
      end
      puts "Game pad button count: #{SF::Joystick.get_button_count(0)}"
      puts "Axis Left position X: #{SF::Joystick.get_axis_position(0, SF::Joystick::X)}"
      puts "Axis Left position Y: #{SF::Joystick.get_axis_position(0, SF::Joystick::Y)}"
      puts "Axis Right positionX: #{SF::Joystick.get_axis_position(0, SF::Joystick::U)}"
      puts "Axis Right positionY: #{SF::Joystick.get_axis_position(0, SF::Joystick::V)}"
      puts "Axis Left Trigger   : #{SF::Joystick.get_axis_position(0, SF::Joystick::Z)}"
      puts "Axis Right Trigger  : #{SF::Joystick.get_axis_position(0, SF::Joystick::R)}"
    else
      puts "No joystick..." unless @counter > 5
    end
  end
end

CrystalGameTest.new.show
