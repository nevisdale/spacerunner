scene_enemy_spinner = {
    make = function(pos, target, hp)
        return {
            base = scene_enemy_base.make(pos, target, hp, anim.make("184,185,186,187", 0.5), 10),

            coll_shape = function(self)
                return collutils.make_shape_rect(self.pos, 7, 7)
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
    end
}