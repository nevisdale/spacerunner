scene_player_bullet = {
    new = function(pos, spd)
        return {
            spr = 17,
            is_active = true,
            pos = pos,
            spd = spd or vec2d.new(0, 1),

            coll_shape = function(self)
                return collutils.make_shape_rect(self.pos, 5, 7)
            end,

            update = function(self)
                if self.pos.y < -8 then
                    self.is_active = false
                    return
                end
                self.pos += self.spd
            end,

            draw = function(self)
                spr(self.spr, self.pos.x, self.pos.y)
            end
        }
    end
}