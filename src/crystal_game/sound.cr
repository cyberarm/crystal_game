module CrystalGame
  class Sound
    def initialize(sound_path = nil)
      if sound_path != nil
        @sound_buffer = SF::SoundBuffer.from_file(sound_path)
        @sound = SF::Sound.new(@sound_buffer)
      end
    end

    def play(volume = 1.0, speed = 1.0, looping = false)
      @sound.volume = get_volume_from_decimal(volume)
      @sound.pitch  = speed
      @sound.loop   = looping
    end

    def pause
      @sound.pause
    end

    def stop
      @sound.stop
    end

    def volume
      @sound.volume
    end

    def volume=(float)
      @sound.volume = get_volume_from_decimal(volume)
    end

    private def get_volume_from_decimal(float)
      float*100.0
    end
  end
end
