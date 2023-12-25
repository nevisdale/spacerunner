scene_game = {
    reset = function(g)
        for bullet in all(scene_enemy_bullets) do
            del(scene_enemy_bullets, bullet)
        end

        g.player = scene_player.new(vec2d.new(64, 64), 2, 3)
        g.player_bullets = {}
        g.enemies = {}
        g.enemy_bullets = scene_enemy_bullets
        g.bg = scene_starfield.new()
        g.particals = {}
        g.score = 0
    end,

    init = function(g)
        scene_game.reset(g)
    end,

    before_update = function(g)
    end,

    update = function(g)
        local player = g.player
        local player_bullets = g.player_bullets

        local direction = scene_game.get_direction_from_input()
        direction:normalize()
        player:move(direction)
        player:update()

        if btn(5) then
            player:shoot(function(player)
                local bullet_pos = player.pos:copy()
                bullet_pos.x += 1
                local bullet = scene_player_bullet.new(bullet_pos, vec2d.new(0, -5))
                add(player_bullets, bullet)
                sfx(0)
            end)
        end

        -- collision: enemies x player
        collutils.responsd_nx1(
            g.enemies, player,
            function(enemy, player)
                if player:take_damage(1) then
                    local expl_pos = player.pos:copy()
                    local player_expl = scene_particals.new_explosion(expl_pos, 2)
                    add(g.particals, player_expl)
                    sfx(1)
                end
            end
        )

        -- collision: enemy bullets x player
        collutils.responsd_nx1(
            g.enemy_bullets, player,
            function(bullet, player)
                if player:take_damage(1) then
                    add(g.particals, scene_particals.new_explosion(player.pos:copy(), 2))
                    sfx(1)
                    del(g.enemy_bullets, bullet)
                end
            end
        )

        -- collision: enemies x player bullets
        collutils.responsd_nxn(
            g.enemies, player_bullets,
            function(enemy, bullet)
                enemy:take_damage(1)
                del(player_bullets, bullet)
                add(g.particals, scene_particals.new_spark(enemy.pos + vec2d.new(4, 0)))
                add(g.particals, scene_particals.new_wave(bullet.pos + vec2d.new(4, 0)))
                sfx(3)
                if enemy:is_dead() then
                    g.score += 10
                    add(g.particals, scene_particals.new_explosion(enemy.pos + vec2d.new(4, 0), 1))
                    sfx(2)
                end
            end
        )

        for enemy in all(g.enemies) do
            enemy:update()
            if enemy:is_dead() then
                del(g.enemies, enemy)
            end
        end

        for bullet in all(g.enemy_bullets) do
            bullet:update()
            if not bullet.is_active then
                del(g.enemy_bullets, bullet)
            end
        end

        for bullet in all(player_bullets) do
            bullet:update()
            if not bullet.is_active then
                del(player_bullets, bullet)
            end
        end

        if player:is_dead() then
            g.state = "over"
            return
        end

        if g.level != nil then
            g.level:update(g)
            if g.level:is_done(g) then
                g.state = "levels"
            end
        end
    end,

    draw = function(g)
        cls(0)

        if conf.collision_shape then
            collutils.show(g.player, 3)
            collutils.show_seq(g.player_bullets, 3)
            collutils.show_seq(g.enemies, 8)
            collutils.show_seq(g.enemy_bullets, 14)
        end

        g.bg:draw()
        g.player:draw()

        for bullet in all(g.player_bullets) do
            bullet:draw()
        end

        for bullet in all(g.enemy_bullets) do
            bullet:draw()
        end

        for enemy in all(g.enemies) do
            enemy:draw()
        end

        for part in all(g.particals) do
            part:draw()
            if not part.is_active then
                del(g.particals, part)
            end
        end

        -- UI on the top of the screen
        rectfill(0, 0, g.score / 5, 4, 5)
        print("score:" .. g.score, 0, 0, 6)
        for i = 1, g.player.max_hp do
            local sprite = 30
            if i <= g.player.hp then
                sprite = 29
            end
            spr(sprite, 85 + i * 9 - 8, 1)
        end
    end,

    get_direction_from_input = function()
        local direction = vec2d.new(0, 0)
        if btn(0) then direction.x -= 1 end
        if btn(1) then direction.x += 1 end
        if btn(2) then direction.y -= 1 end
        if btn(3) then direction.y += 1 end
        return direction
    end
}