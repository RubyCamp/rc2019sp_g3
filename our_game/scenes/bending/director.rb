module Bending
	class Director
	   	def initialize
	      	@font = Font.new(32)
	      	@poi_img = Image.load('images/poi1.png')
	   	end 
	    
		def play(score)
			
		    Window.draw(0,0,@poi_img)
		    Window.draw_font(200, 200, "残念！ スコアは#{score}です！" , @font)
		    scene_transition(score)
	   	end

		private
	    def scene_transition(score)
	        Scene.move_to(:opening) if Input.key_down?(K_ESCAPE)
    	end    
	end
end
