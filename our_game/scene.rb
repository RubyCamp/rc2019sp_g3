class Scene
	@@scenes = {}

	@@current = nil

	def self.add(director, title)
		# シンボルにするメソッド＿
		@@scenes[title.to_sym] = director
	end

	def self.move_to (title)
		@@current = title.to_sym
	end

	def self.play
		back_img = Image.load("images/back.png")
		Window.draw(0,0,back_img)
		@@scenes[@@current].play
	end

end