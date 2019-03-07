module Ending
  class Director
    attr_accessor :score

    def initialize
        @font = Font.new(32)
        @boi_img = Image.load('images/poi1.png')
    end

    def play(score)

        Window.draw(0, 0, @boi_img)
        Window.draw_font(200, 200, "今回のスコア:#{score}", @font)
        scene_transition
    end

    private
    def scene_transition
        Scene.move_to(:opening) if Input.key_down?(K_ESCAPE)
    end    
  end
end
