-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1.25

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- LG 34" ultrawide, to the left of the laptop and unscaled for more usable space.
-- The laptop sits on a stand ~1.5" higher, so the LG is offset upward to make the
-- cursor cross the seam at the right physical height.
hl.monitor({ output = "desc:LG Electronics LG HDR WQHD 0x0005C54E", mode = "preferred", position = "-3440x-396", scale = 1 })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
