module Opening
	class Director
		def initialize
			#文字サイズを決める
			@font = Font.new(32)
		end

		def play(score= nil)
			Window.draw_font(300, 300, "オープニング", @font)
			scene_transaction
		end

		private
		def scene_transaction
			Scene.move_to(:game) if Input.key_push?(K_ESCAPE)
		end
	end

end