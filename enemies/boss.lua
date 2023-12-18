scene_enemy_boss = {
    make = function(pos, target, hp)
        return {
            base = scene_enemy_base.make(pos, target, hp, anim.make("208,210", 1), 10),

            coll_shape = function(self)
                return collutils.make_shape_rect(
                    self.pos + vec2d.new(2, 4),
                    15, 15
                )
            end,

            take_damage = function(self, n)
                scene_enemy_base.take_damage(self.base, n)
            end,

            is_died = function(self)
                return scene_enemy_base.is_died(self.base)
            end,

            update = function(self)
                scene_enemy_base.update(self.base)
            end,

            draw = function(self)
                self.base.w = 2
                self.base.h = 2
                scene_enemy_base.draw(self.base)
            end
        }
    end
}