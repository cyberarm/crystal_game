module CrystalGame
  class Window
    def initialize(width = 640, height = 480, fullscreen = false, vsync = true, fps = nil)
      @window = SF::RenderWindow.new(SF.video_mode(width, height), "Gosu")
      @window.vertical_sync_enabled = true

      $window = self
    end

    def caption=(string)
      @window.title = string
    end

    def needs_cursor?
      false
    end

    def button_down(key_id)
    end

    def button_up(key_id)
    end

    def draw
    end

    def update
    end

    def event(_event)
    end

    def width; @window.size.x end

    def height; @window.size.y end

    def fill(color)
      fill_rect(0, 0, self.width, self.height, color)
    end

    def fill_rect(x, y, width, height, fill_color = CrystalGame::Color::BLACK, border_color = CrystalGame::Color::TRANSPARENT)
      rectangle = SF::RectangleShape.new(SF.vector2(width, height))
      rectangle.fill_color = color
      @window.draw(rectangle)
    end

    def show
      while @window.open?
        while _event = @window.poll_event()
          event(_event)
          case _event.type
          when SF::Event::KeyPressed
            button_down(_event.key.code)
          when SF::Event::KeyReleased
            button_up(_event.key.code)
          when SF::Event::Closed
            @window.close()
          end
        end
        @window.clear()
        update
        draw
        @window.display()
      end
    end
  end
end
