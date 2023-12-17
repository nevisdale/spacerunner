scene_enemy_builder = {
    green = "green",
    red = "red",
    spinner = "spinner",
    boss = "boss",

    make = function(typ, pos, target, hp, wait)
        local createfn = nil
        if typ == scene_enemy_builder.green then
            createfn = scene_enemy_green.make
        elseif typ == scene_enemy_builder.red then
            createfn = scene_enemy_green.red
        elseif typ == scene_enemy_builder.spinner then
            createfn = scene_enemy_green.spinner
        elseif typ == scene_enemy_builder.boss then
            createfn = scene_enemy_green.boss
        end
        if createfn != nil then
            return createfn(pos, target, hp, wait)
        end
        return nil
    end
}