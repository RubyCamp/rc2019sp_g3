class Fish < CPBox 
	attr_accessor :x , :y
	COLLISION_TYPE = 10

	def initialize(x, y, mass, e = 2, u = 0)		
		image = Image.load("images/kingyo2.png")
		super x, y, image.width ,image.height ,mass, C_WHITE, e, u
		self.x = x
		self.y = y
		@image = image
		@body.apply_impulse(CP::Vec2.new(30,30), CP::Vec2.new(0,0))
		# apply_force(30,30)と同じ意味
		@shape.collision_type = self.class::COLLISION_TYPE 
 	end

	def move
	
		num = rand(1)
		if num == 0
			apply_force(30, 30)
		else 
			apply_force(-30,-30)
		end
	end

	#　物理空間で描画処理
	# def draw
	# 	Window.draw_rot(@body.p.x - @r , @body.p.y - @r ,@enemy_img, @body.a * 180 / Math::PI)
	# end

 #　プレイヤにダメージを与える
	def attack
		# if(処理)
				#player_HP -= 5
		#	else
	end

	#　すくわれたときに画像を変換する
	def image_when_caught

	end

	private

	def apply_force(x,y)
		body.apply_impulse(CP::Vec2.new(x,y),CP::Vec2.new(0, 0))
	end
end