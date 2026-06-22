--------------------------
--       SUBMAPS        --
--------------------------
local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "thunar"
local browser     = "firefox"
local menu        = "vicinae toggle"
local spotify     = "com.spotify.Client"

-- [ALT]
hl.bind("ALT + R", hl.dsp.submap("resize"))
hl.bind("ALT + CTRL + TAB", hl.dsp.submap("subspace"))


hl.define_submap("resize", function()

    -- Move window
    hl.bind("ALT + A", hl.dsp.window.move({ x = -30, y = 0,  relative = true }), { repeating = true })
    hl.bind("ALT + D", hl.dsp.window.move({ x = 30,  y = 0,  relative = true }), { repeating = true })
    hl.bind("ALT + W", hl.dsp.window.move({ x = 0,   y = -30, relative = true }), { repeating = true })
    hl.bind("ALT + S", hl.dsp.window.move({ x = 0,   y = 30, relative = true }), { repeating = true })

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