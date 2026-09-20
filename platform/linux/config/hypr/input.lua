-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    -- Caps Lock acts as Ctrl. Compose moves to Right Alt (was Caps Lock).
    -- Both Shifts together still toggles actual Caps Lock, as in Omarchy's default.
    kb_options = "ctrl:nocaps,compose:ralt,shift:both_capslock_cancel",

    -- Increase sensitivity for mouse/trackpad (default: 0).
    sensitivity = 0.3,

    touchpad = {
      -- Use natural (inverse) scrolling, like macOS.
      natural_scroll = true,

      -- Scroll speed. This is Omarchy's default (0.4). Raise toward 0.6-0.8 if
      -- scrolling feels too slow / requires oversized swipes; lower if it
      -- overshoots. NOTE: the old ~/.config/hypr/input.conf is NOT loaded by
      -- Quattro's Lua config -- this file is the one that takes effect.
      scroll_factor = 0.4,
    },
  },
})

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })
