scene_bullet = {
    new = function(pos, spd, anim)
        return {
            anim = anim,
            is_active = true,
            pos = pos,
            spd = spd or vec2d.new(0, 1),

            lt_pos = vec2d.new(0, 0),
            rb_pos = {},

            coll_shape = function(self)
                return collutils.make_shape_rect(self.pos + self.lt_pos, self.rb_pos.x, self.rb_pos.y)
            end,

            update = function(self)
                if self.pos.y < -50 or self.pos.y > 150 or self.pos.x < -50 or self.pos.x > 150 then
                    self.is_active = false
                    return
                end
                self.pos += self.spd
            end,

            draw = function(self)
                spr(self.anim:next(), self.pos.x, self.pos.y)
            end
        }
    end
}

scene_player_bullet = {
    new = function(pos, spd)
        local bullet = scene_bullet.new(pos, spd, anim.make("17"))
        bullet.rb_pos = vec2d.new(5, 7)
        return bullet
    end
}

scene_enemy_bullet = {
    new = function(pos, spd)
        local bullet = scene_bullet.new(pos, spd, anim.make("18"))
        bullet.lt_pos = vec2d.new(1, 1)
        bullet.rb_pos = vec2d.new(3, 3)

        origin_draw = bullet.draw

        bullet.draw = function(self)
            if time() % 0.5 == 0 then
                for i = 0, 15 do
                    pal(i, 7)
                end
            end
            origin_draw(self)
            pal()
        end

        return bullet
    end
}