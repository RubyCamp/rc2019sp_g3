require 'dxruby'

s = [Sprite.new(100, 100, Image.new(100, 100, C_RED)),
     Sprite.new(200, 200, Image.new(100, 100, C_GREEN)),
     Sprite.new(300, 300, Image.new(100, 100, C_BLUE))]
m = Sprite.new(0, 0, Image.new(50, 50, C_WHITE))
font = Font.new(32)

Window.loop do
  m.x, m.y = Input.mouse_pos_x, Input.mouse_pos_y

  Sprite.draw(s)
  m.draw

  if m === s
    Window.draw_font(0, 0, "hit!", font)
  end
end