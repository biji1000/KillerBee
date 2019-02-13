class Enemy < Sprite
    @@enemies = []

    def initialize ()
        @speed = 5
        img = Image[:bee1]
        return super(Window.width-img.width,rand(0..(Window.height-img.height)),img)
    end

    def enemy_move()
        self.draw()
        self.x -= @speed
    end

    def self.auto_generate
        if(0..1) === rand(100)
            @@enemies << Enemy.new()
        end
        @@enemies.each do |e|
            e.enemy_move()
            if e.x < 0
                e.vanish()
            end
        end
    end

    def self.enemies()
        return @@enemies
    end
end
