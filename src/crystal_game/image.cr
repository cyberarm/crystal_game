module CrystalGame
  class Image
    def initialize(image_path)
      @texture = SF::Texture.from_file(image_path)
      @texture.smooth = true

      @sprite = SF::Sprite.new(@texture)
    end

    def draw(x,y,z)
      $window.draw(@sprite)
    end
  end
end
