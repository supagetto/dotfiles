-- ┏━━━━━━━┓
-- ┃ execs ┃
-- ┗━━━━━━━┛

local main = function()
  -- ━ Startup ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.on('hyprland.start', function()
    hl.exec_cmd('hypridle')
    hl.exec_cmd('hyprpaper')
    hl.exec_cmd('systemctl --user start voxtype')
    hl.exec_cmd('dictate')
  end)

  -- ━ Cursor ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'phinger'")
  hl.exec_cmd('gsettings set org.gnome.desktop.interface cursor-size 24')

  -- ━ Font ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.exec_cmd('gsettings set org.gnome.desktop.interface font-name ' .. "'SauceCodePro Nerd Font Mono'")
  hl.exec_cmd('gsettings set org.gnome.desktop.interface document-font-name ' .. "'SauceCodePro Nerd Font Mono'")
  hl.exec_cmd('gsettings set org.gnome.desktop.interface monospace-font-name ' .. "'SauceCodePro Nerd Font Mono'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface font-hinting 'full'")

  -- ━ Misc ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
end

main()
