require "dxruby"
require "chipmunk"

#　関連するサイズを読み込み
require_relative "scenes/game/cp"
require_relative "scenes/game/cp_static_box"
require_relative "scenes/game/director"
require_relative "scenes/game/cp_box"
require_relative "scenes/game/fish"
require_relative "scenes/game/cp_circle"
require_relative "scenes/game/player"
require_relative "scene"
require_relative "scenes/opening/director"
require_relative "scenes/game/director"
#　ウィンドウサイズを固定
Window.width = 800
Window.height = 600


Scene.add(Opening::Director.new, :opening)
Scene.add(Game::Director.new, :game)
#Scene.add(Ending::Director.new, :ending)
Scene.move_to :opening
op_music = Sound.new("sounds/opening.mid")
op_music.play

Window.loop do 
	#break if Input.key_push?(K_ESCAPE)
	Scene.play
end