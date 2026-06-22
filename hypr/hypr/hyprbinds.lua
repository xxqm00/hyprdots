---------------------
---- KEYBINDINGS ----
---------------------
local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "thunar"
local browser     = "firefox"
local menu        = "vicinae toggle"
local spotify     = "com.spotify.Client"
local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

-- [no modifier]
hl.bind(" + code:110", hl.dsp.exec_cmd("swaync-client -t -sw"))              -- code:110 = home key
hl.bind(" + ALT + TAB",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(" + ALT + SHIFT + TAB", hl.dsp.window.move({ workspace = "special:magic" }))


-- [ALT]
hl.bind("ALT + R", hl.dsp.submap("resize"))
hl.bind("ALT + CTRL + TAB", hl.dsp.submap("subspace"))


-- [CTRL]
hl.bind("CTRL + ALT + code:119", hl.dsp.exec_cmd("kitty -e hyprctl kill"))   -- kills application on click; code:119 = delete


-- [SUPER]
hl.bind(mainMod .. " + C",          hl.dsp.window.close())
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F",          hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + code:61",          hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + P",          hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Q",          hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + R",          hl.dsp.exec_cmd("kitty --title floating-term"))
hl.bind(mainMod .. " + T",          hl.dsp.layout("togglesplit"))             -- dwindle only
hl.bind(mainMod .. " + V",        hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + A",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + D",          hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + W",          hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + S",          hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + Z",          hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SPACE",      hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(mainMod .. " + ESCAPE",     hl.dsp.exec_cmd("veila lock"))
hl.bind(mainMod .. " + PRINT",      hl.dsp.exec_cmd("hyprshot -m region -o /home/komari/Pictures/Screenshots"))
hl.bind(mainMod .. " + TAB",        function()
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
    hl.dispatch(hl.dsp.window.move({workspace = "+0"}))
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
    hl.dispatch(hl.dsp.window.move({workspace = "special:minimize"}))
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
end)
hl.bind(mainMod .. " + code:61",    hl.dsp.exec_cmd("hyprkcs"),               { description = "your description here" })
hl.bind(mainMod .. " + code:112",   hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))


-- [SUPER + ALT]
hl.bind(mainMod .. " + ALT + C",      hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"))
hl.bind(mainMod .. " + ALT + E",      hl.dsp.exec_cmd("vicinae vicinae://launch/core/search-emojis"))
hl.bind(mainMod .. " + ALT + ESCAPE", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) -- logout to sddm
hl.bind(mainMod .. " + ALT + S",      hl.dsp.exec_cmd(spotify))


-- [SUPER + SHIFT]
hl.bind(mainMod .. " + SHIFT + A",        hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + D",        hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + S",        hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + W",        hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + code:112", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))


-- [SUPER + number] Switch workspaces / move window to workspace
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end


-- [SUPER + mouse]
hl.bind(mainMod .. " + mouse_down",  hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",    hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272",   hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",   hl.dsp.window.resize(), { mouse = true })


-- [XF86 / multimedia keys]
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),                                  { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl play-pause"),                            { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"),                            { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),                              { locked = true })

hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("mpc toggle"))       
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("mpc prev")) 
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("mpc next"))
--------------------------
--       SUBMAPS        --
--------------------------

hl.define_submap("resize", function()

    -- Move window
    hl.bind("ALT + A", hl.dsp.window.move({ x = -30, y = 0,  relative = true }), { repeating = true })
    hl.bind("ALT + D", hl.dsp.window.move({ x = 30,  y = 0,  relative = true }), { repeating = true })
    hl.bind("ALT + S", hl.dsp.window.move({ x = 0,   y = -30, relative = true }), { repeating = true })
    hl.bind("ALT + W", hl.dsp.window.move({ x = 0,   y = 30, relative = true }), { repeating = true })

    -- Resize window
    hl.bind("A", hl.dsp.window.resize({ x = -30, y = 0,  relative = true }), { repeating = true })
    hl.bind("D", hl.dsp.window.resize({ x = 30,  y = 0,  relative = true }), { repeating = true })
    hl.bind("S", hl.dsp.window.resize({ x = 0,   y = -30, relative = true }), { repeating = true })
    hl.bind("W", hl.dsp.window.resize({ x = 0,   y = 30, relative = true }), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))

end)

---
-- Called with CTRL + ALT + TAB
hl.define_submap("subspace", function()
    local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())

    hl.bind("1",       hl.dsp.workspace.toggle_special("sub1"))
    hl.bind("2",       hl.dsp.workspace.toggle_special("sub2"))
    hl.bind("3",       hl.dsp.workspace.toggle_special("sub3"))
    hl.bind("4",       hl.dsp.workspace.toggle_special("sub4"))
    hl.bind("5",       hl.dsp.workspace.toggle_special("sub5"))

    hl.bind("ALT + 1", hl.dsp.window.move({ workspace = "special:sub1" }))
    hl.bind("ALT + 2", hl.dsp.window.move({ workspace = "special:sub2" }))
    hl.bind("ALT + 3", hl.dsp.window.move({ workspace = "special:sub3" }))
    hl.bind("ALT + 4", hl.dsp.window.move({ workspace = "special:sub4" }))
    hl.bind("ALT + 5", hl.dsp.window.move({ workspace = "special:sub5" }))

    hl.bind("escape", hl.dsp.submap("reset"))

end)