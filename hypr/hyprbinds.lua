---------------------
---- KEYBINDINGS ----
---------------------
local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "thunar"
local browser     = "firefox"
local menu        = "vicinae toggle"
local spotify     = "com.spotify.Client"

-- [Codes]
hl.bind("CTRL + ALT + code:119", hl.dsp.exec_cmd("kitty -e hyprctl kill"),               { description = "FORCE kills the application on click (good for frozen applications)" })
hl.bind(mainMod .. " + code:36", hl.dsp.exec_cmd("swaync-client -t -sw"),               { description = "Opens notification menu" })             -- code:36 = ENTER key
hl.bind(mainMod .. " + code:61",          hl.dsp.exec_cmd("waypaper"),               { description = "Opens waypaper, wallpaper manager" })
hl.bind(mainMod .. " + code:60",          hl.dsp.exec_cmd("hyprkcs"),               { description = "Opens waypaper, wallpaper manager" })

-- [SUPER]
hl.bind(mainMod .. " + C",          hl.dsp.window.close               { description = "Closes / kills the window" })
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(fileManager),               { description = "Opens thunar, the file manager" })
hl.bind(mainMod .. " + F",          hl.dsp.window.fullscreen(),               { description = "Fullscreens your active window" })
hl.bind(mainMod .. " + P",          hl.dsp.window.pseudo(),               { description = "Activates pseudo tiling" })
-- hl.bind(mainMod .. " + Q",          hl.dsp.exec_cmd("kitty"),               { description = "Opens kitty, the terminal (tiled)" })
hl.bind(mainMod .. " + R",          hl.dsp.exec_cmd("kitty"),               { description = "Opens kitty, the terminal" })
hl.bind(mainMod .. " + T",          hl.dsp.layout("togglesplit"),               { description = "Toggles the splitting on windows (dwindle only)" })             -- dwindle only
hl.bind(mainMod .. " + V",        hl.dsp.window.float({ action = "toggle" }),               { description = "Toggles the floating of windows" })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"),               { description = "Hides the waybar (toggleable)" })
hl.bind(mainMod .. " + Z",          hl.dsp.exec_cmd(browser),               { description = "Opens the browser set on line 7 (hyprbinds.lua)" })
hl.bind(mainMod .. " + SPACE",      hl.dsp.exec_cmd("vicinae toggle"),               { description = "Toggles vicinae, kinda like wofi and friends" })
hl.bind(mainMod .. " + L",     hl.dsp.exec_cmd("veila lock"),               { description = "Logout (not to sddm)" })
hl.bind(mainMod .. " + PRINT",      hl.dsp.exec_cmd("hyprshot -m region -o /home/key/Pictures/Screenshots"),               { description = "Takes a screenshot and sends it to the written folder on Ln. 29" })

hl.bind(mainMod .. " + TAB",        function()
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"),               { description = "your description here" })
    hl.dispatch(hl.dsp.window.move({workspace = "+0"}),               { description = "your description here" })
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"),               { description = "your description here" })
    hl.dispatch(hl.dsp.window.move({workspace = "special:minimize"}),               { description = "your description here" })
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"),               { description = "your description here" })
end)



-- [SUPER + ALT]
hl.bind(mainMod .. " + ALT + C",      hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"),               { description = "Vicinaes clipboard feature" })
hl.bind(mainMod .. " + ALT + E",      hl.dsp.exec_cmd("vicinae vicinae://launch/core/search-emojis"),               { description = "Vicinaes emoji selector feature" })
hl.bind(mainMod .. " + ALT + ESCAPE", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),               { description = "Logout (to sddm)" }) -- logout to sddm
hl.bind(mainMod .. " + ALT + S",      hl.dsp.exec_cmd(spotify),               { description = "Opens your music player (spotify from flatpak by default)" })

-- [CTRL]

-- [ALT +]
hl.bind("ALT + TAB",         hl.dsp.workspace.toggle_special("magic"),               { description = "Opens the magic workspace" })
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.move({ workspace = "special:magic" }),               { description = "ADDS to magic workspace" })


-- [SUPER + SHIFT]
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"),               { description = "Refresh / update waybar" })


-- [SUPER + number] Switch workspaces / move window to workspace
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }),               { description = "Move to numerical workspace" })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }),               { description = "Move selected application to numerical workspace" })
end


