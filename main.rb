require "dxopal"
include DXOpal
Image.register(:img1, './images/background-title.png')
Image.register(:img2, './images/game-bg.png')
Image.register(:img3, './images/gameover-bg.png')
Image.register(:tama,'./images/tama.png')
Image.register(:bee1,'./images/bee1.png')
Image.register(:heishi,'./images/heishi1.png')

require_remote "./sprites/main_character.rb"
require_remote "./sprites/enemy.rb"
require_remote "./sprites/bullet.rb"




Window.load_resources do

# Window.bgcolor = C_CYAN
Window.width = 800
Window.height = 600

$scene = "title"
font = Font.new(50)

character = MainCharacter.new()

Window.loop do
    case $scene
        when "title"
            Window.draw(0,0,Image[:img1])
            Window.draw_font(Window.width/2-100, Window.height/2-50, "キラービー", font)
            Window.draw_font(Window.width/2-100, Window.height/2-20, "Push space to start.", font)
            $scene = "main" if Input.key_push?(K_SPACE)

        when "main" # メイン画面
            Window.draw(0,0,Image[:img2])
            Enemy.auto_generate()
            character.move()
            Window.draw_font(0,0,"score:#{$score}",font)

        when "gameover"
            Window.draw(-80,0,Image[:img3])
            Enemy.enemies().each do |e|
              e.vanish()
            end
            Sprite.clean(Enemy.enemies())
            Window.draw_font(130,500, "Push Tab to retry.",font)
            if Input.key_push?(K_TAB)
                $scene = "title"
            end
    end


end
end
