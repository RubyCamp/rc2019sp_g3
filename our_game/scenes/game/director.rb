	# #同じディレクトリ内にあるファイルを読み込めるようにする
	require_relative "player"
	# require_relative "enemy"
module Game
	class Director

		def initialize()
			@space = CP::Space.new
	    	@space.gravity = CP::Vec2.new(0, 0)
			@fishes = []
			@font = Font.new(32)
			#　1から10までの数の金魚を発生させる

			# (rand(9)+1).times do
			1.times do
				fish = Fish.new(
				  rand(600)+100,
				  rand(400)+100,
				  40
				)
				@space.add(fish)
				@fishes << fish
			end
			#　ステージの壁の作成
			CPBase.generate_walls(@space, Window.width,Window.height)

			#　衝突処理
			@space.add_collision_handler(Fish::COLLISION_TYPE, Fish::COLLISION_TYPE) do |a, b, arb|
		     # 衝突個所（arb.points配列）から、先頭の1つを取得（複数個所ぶつかるケースもあり得るため配列になっている）
		    	pos = arb.points.first.point
		     # 衝突個所の座標に絵を表示（1フレームで消える点に留意）
		     	fish_img = Image.load("images/kingyo.png")
		    	Window.draw(pos.x, pos.y, fish_img)
		    end
	    end

		def play
			@fishes.each do |fish|
			#　金魚を動かす
				fish.move
				fish.draw
			end
			@space.step( 1/ 60.0 )
			scene_transition
		end

	  	def draw
	    	Window.draw_rot(@body.p.x - @r, @body.p.y - @r, @image, @body.p.to_angle * 360.0 )
	  	end

	  	private
	  	def scene_transition
      		Scene.move_to(:ending) unless @current
    	end
	end
end