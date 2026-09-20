-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Make Claude the default AI chat shortcut (was ChatGPT).
hl.unbind("SUPER + SHIFT + A")
o.bind("SUPER + SHIFT + A", "Claude", { webapp = "https://claude.ai" })


-- BEGIN dictation
-- Voxtype dictation on SUPER + R (inherited from hyprvoice, now removed).
-- Toggle rather than push-to-talk: SUPER+R is a chord, so hold-to-talk is
-- awkward. Omarchy's F9 push-to-talk and SUPER+CTRL+X toggle still apply.
--
-- Engine is Parakeet TDT int8 (see ~/.config/voxtype/config.toml). Measured
-- ~0.29s vs ~44s for Whisper large-v3-turbo on this hardware.
--
-- Three lanes off the single voxtype daemon. The flags are per-recording
-- overrides, so each lane only pays for what it uses:
--   SUPER + R          raw transcript, no post-processing (fast lane)
--   SUPER + SHIFT + R  same, then piped through Claude via [profiles.polish]
--   SUPER + ALT + R    same, then presses Enter (dictate a prompt and send it)
--
-- Note: there is no per-recording --engine flag, and --model is ignored across
-- engines, so a Whisper lane is not possible while the daemon runs Parakeet.
o.bind("SUPER + R", "Dictate", "voxtype record toggle")
o.bind("SUPER + SHIFT + R", "Dictate + cleanup", "voxtype record toggle --profile polish")
o.bind("SUPER + ALT + R", "Dictate + send", "voxtype record toggle --auto-submit")
-- END dictation

-- BEGIN Sandman lid action override
-- Sandman manages laptop lid-close actions. Omarchy's default lid-close
-- binding locks immediately on lid close, before Sandman can apply Do nothing
-- or Display off, so replace it with monitor/clamshell reconciliation only.
hl.unbind("switch:on:Lid Switch")
o.bind("switch:on:Lid Switch", nil, "omarchy-hyprland-monitor-clamshell", { locked = true })
-- END Sandman lid action override
