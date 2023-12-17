scene_enemy_green = {
    make = function(pos, target)
        local green = {
            base = scene_enemy_base.make(pos, target, 3, anim.make("21,22,23,24", 0.5), 10),

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
        return setmetatable(green, green.base)
        -- return green
    end
}