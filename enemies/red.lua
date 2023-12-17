scene_enemy_red = {
    make = function(pos, target)
        local red = {
            base = scene_enemy_base.make(pos, target, 10, anim.make("140,141,142,143", 0.3), 10),

            coll_shape = function(self)
                return collutils.make_shape_rect(self.base.pos, 7, 7)
            end,

            take_damage = function(self, n)
                scene_enemy_base.take_damage(self.base, n)
            end,

            is_dead = function(self)
                return scene_enemy_base.is_died(self.base)
            end,

            update = function(self)
                scene_enemy_base.update(self.base)
            end,

            draw = function(self)
                scene_enemy_base.draw(self.base)
            end
        }

        return setmetatable(red, red.base)
    end
}