class MainCharacter < Sprite

    def initialize()
        @speed = 5
        @bullet = []
        $score = 0
        img = Image[:heishi]
        return super(100,Window.height/2-img.height/2,img)
    end

    def move()

        self.draw()

        if(0..(Window.height-self.image.width)) === self.y + Input.y*@speed
            self.y += Input.y*@speed
        end
        MainCharacter.check(Enemy.enemies,self)
        self.shooting()
    end

    def shooting()
        if Input.key_push?(K_SPACE)
            @bullet << Bullet.new(self.x,self.y)
        end
        @bullet.each do |b|
            b.through()
            b.check(Enemy.enemies()).each do |e|
                e.vanish()
                b.vanish()
                $score += 100
            end
        end
        MainCharacter.clean(@bullet)
        MainCharacter.clean(Enemy.enemies())
    end

    def hit(o)
        $scene = "gameover"
        @bullet.clear
        $score = 0
    end

end
