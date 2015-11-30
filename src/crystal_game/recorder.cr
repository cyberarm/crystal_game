module CrystalGame
  class Recorder
    def initialize
      if SF::SoundBufferRecorder.available?
        @recorder = SF::SoundBufferRecorder.new
      else
        raise "Hardware unavailable for Microphone!"
      end
    end

    def record
      @recorder.start
    end

    def stop
      @recorder.stop
    end

    def microphone_available?
      SF::SoundBufferRecorder.available?
    end
  end
end
