class Bullet < Sprite

    def initialize(x, y)
        img = Image[:tama]
        return super(x+100,y+10,img)
    end

    def through()
        self.draw()
        self.x += 5
    end

end
