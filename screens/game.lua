scene_game = {
    reset = function(g)
        g.player = scene_player.new(vec2d.new(64, 64), 2, 3)
        g.player_bullets = {}
        g.enemies = {}
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

        -- if there are many enemies bullets
        if btn(4) then
            player.spd = 1
        else
            player.spd = 2
        end

        -- collision: enemies x player
        collutils.responsd_seq(
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

        -- collision: enemies x player bullets
        collutils.responsd_2seq(
            g.enemies, player_bullets,
            function(enemy, bullet)
                local spark_pos = enemy.pos + vec2d.new(4, 0)
                local spark = scene_particals.new_spark(spark_pos)
                add(g.particals, spark)
                local wave_pos = bullet.pos + vec2d.new(4, 0)
                local wave = scene_particals.new_wave(wave_pos)
                add(g.particals, wave)
                enemy:take_damage(1)
                del(player_bullets, bullet)
                sfx(3)
                if enemy:is_dead() then
                    local expl_pos = enemy.pos + vec2d.new(4, 0)
                    local enemy_expl = scene_particals.new_explosion(expl_pos, 1)
                    add(g.particals, enemy_expl)
                    g.score += 10
                    del(g.enemies, enemy)
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

        foreach(
            player_bullets, function(bullet)
                bullet:update()
                if not bullet.is_active then
                    del(player_bullets, bullet)
                end
            end
        )

        -- CHANGE SCEREEN
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

        -- END CHANGE SCREEN
    end,

    draw = function(g)
        cls(0)

        if conf.collision_shape then
            collutils.show(g.player, 3)
            collutils.show_seq(g.player_bullets, 3)
            collutils.show_seq(g.enemies, 8)
        end

        g.bg:draw()
        g.player:draw()
        foreach(
            g.player_bullets, function(bullet)
                bullet:draw()
            end
        )

        for enemy in all(g.enemies) do
            enemy:draw()
        end

        scene_particals.draw(g.particals)

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