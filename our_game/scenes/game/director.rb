#同じディレクトリ内にあるファイルを読み込めるようにする
require_relative "player"
require "time"
module Game
	class Director

		def initialize()
			#ひとつ目の空間
			@space_fish = CP::Space.new
	    	@space_fish.gravity = CP::Vec2.new(0, 0)

	    	#二つ目の空間
	    	@space_poi = CP::Space.new
	    	@space_poi.gravity = CP::Vec2.new(0,0)

			@fishes = []
			@font = Font.new(32)
			@score = 0
			@limit_time = 100
			@loop_count = 0
			@time = Time.now

			image = Image.load("images/poi1.png")
			@player= Player.new(30,300,50,10, image)
			@space_poi.add(@player)
			#　1から10までの数の金魚を発生させる
			# (rand(9)+1).times do
			10.times do
				fish = Fish.new(
				  rand(600)+100,
				  rand(400)+100,
				  40
				)
				@space_fish.add(fish)
				@fishes << fish
			end
			#　ステージの壁の作成
			CPBase.generate_walls(@space_fish, Window.width,Window.height)

			#　衝突処理
			@space_fish.add_collision_handler(Fish::COLLISION_TYPE, Fish::COLLISION_TYPE) do |a, b, arb|
		     # 衝突個所（arb.points配列）から、先頭の1つを取得（複数個所ぶつかるケースもあり得るため配列になっている）
		    	pos = arb.points.first.point
		     # 衝突個所の座標に絵を表示（1フレームで消える点に留意）
		     	#sound = Sound.new("適当なファイル")
		    	#sound.play
		    end
	    end

		def play
			
			@player.move
			@player.draw
			@fishes.each do |fish|
			#　金魚を動かす
				fish.move
				fish.draw
			end
			Window.draw_font(0,0, "スコア：#{@score}, 時間:#{@limit_time}, #{@time}", @font)
			@space_fish.step( 1/ 60.0 )
			@space_poi.step (1 / 60.0 )
			@loop_count += 1
			if @loop_count % 30 == 0
				@limit_time -= 1
				if @limit_time == 0
					
				end
			end
			#scene_transition
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