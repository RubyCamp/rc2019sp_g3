class Fish < CPBox 
	attr_accessor :x , :y
	COLLISION_TYPE = 10

	def initialize(x, y, mass, e = 2, u = 0)		
		image = Image.load("images/kingyo_top.png")
		super x, y, image.width ,image.height ,mass, C_WHITE, e, u
		self.x = x
		self.y = y
		@image = image
		@body.v = CP::Vec2.new(rand(300)-150,rand(300)-150)
		#@body.apply_impulse(CP::Vec2.new(30,30), CP::Vec2.new(0,0))
		# apply_force(30,30)と同じ意味
		@shape.collision_type = self.class::COLLISION_TYPE 
		@caught = false
 	end

	def move(loop_count) 
                if loop_count % 5 == 0
		   apply_force(-@body.p.x / 2, 0)
		end
                if loop_count % 10 == 0
		   apply_force(0, -@body.p.y / 2 )
		end
                #if loop_count % 260 + rand(50) == 0
		#	   apply_force(0, -@body.p.y / 2 + 200)
		#end
                #if @loop_count % 130 + rand(50) == 0
		#	   apply_force(, )
		#end
                #if @loop_count % 130 + rand(50) == 0
		#	   apply_force(@body.p.x / 2 + 200, 0)
		##end
		if @body.p.x > Window.width - 100
			@body.v = CP::Vec2.new(rand(-300),rand(-300))
		elsif @body.p.x <   100
			@body.v = CP::Vec2.new(rand(300),rand(300))
		elsif @body.p.y > Window.height - 100
			@body.v = CP::Vec2.new(rand(100),-rand(300))
		elsif @body.p.y < 100
			@body.v = CP::Vec2.new(rand(300),rand(100))
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
	def caught
		@caught = true
	end

	def caught?
		@caught
	end

	private

	def apply_force(x,y)
		body.apply_impulse(CP::Vec2.new(x,y),CP::Vec2.new(0, 0))
	end
end