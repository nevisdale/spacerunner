_g = {
    game = {},
    state = conf.start_screen,
    state_prev = "",

    events = {
        start = scene_start,
        levels = scene_levels,
        game = scene_game,
        win = scene_win,
        over = scene_over
    },

    update_before = function(self)
        local state_events = self.events[self.state]
        if self.state != self.state_prev then
            self.state_prev = self.state
            state_events.before_update(self)
        end
    end
}

function _init()
    for _, events in pairs(_g.events) do
        events.init(_g)
    end
end

function _update()
    _g:update_before()
    _g.events[_g.state].update(_g)
end

function _draw()
    _g:update_before()
    _g.events[_g.state].draw(_g)
end