import os
import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy


@hook.subscribe.startup
def autostart():
    startup_script = os.path.expanduser('~/.local/bin/autostart')
    subprocess.Popen([startup_script])


mod = "mod4"
groups = []

cmd_keys = [
    Key(["mod1"], "Tab", lazy.layout.next()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "e", lazy.shutdown()),

    Key([mod], "h", lazy.layout.left()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "l", lazy.layout.right()),

    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),

    Key([mod], "minus", lazy.layout.shrink_main()),
    Key([mod], "equal", lazy.layout.grow_main()),
    Key([mod], "0", lazy.layout.reset()),
    Key([mod], "m", lazy.window.toggle_fullscreen()),

    Key([mod], "space", lazy.layout.swap_main()),
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

]
nav_keys = []
move_keys = []
app_keys = []


def make_workspace(name, key):
    global groups
    global nav_keys
    global move_keys

    # Declare the group
    groups.append(Group(name))

    # Keybind to switch to/from the group
    nav_keys.append(Key([mod], key, lazy.group[name].toscreen(toggle=True)))

    # Keybind to move a window to a group
    move_keys.append(Key([mod, "shift"], key, lazy.window.togroup(name, switch_group=False)))


def make_launcher(app, key):
    global app_keys
    app_keys.append(Key([mod], key, lazy.spawn(app)))


make_launcher("firefox", "w")
make_launcher("flameshot gui", "p")
make_launcher("nautilus", "e")
make_launcher("rofi -modi drun -show drun", "d")
make_launcher("rofi -modi run -show run", "r")
make_launcher("rofi -modi window -show window", "g")
make_launcher("xfce4-terminal -e zsh", "Return")


# Named workspaces
make_workspace("Web", "1")
make_workspace("Editor", "2")
make_workspace("Services", "3")
make_workspace("Git", "4")
make_workspace("Misc. 1", "5")
make_workspace("Misc. 2", "6")
make_workspace("Spotify", "7")
make_workspace("Slack", "8")
make_workspace("Password", "9")


keys = [
    *cmd_keys,
    *app_keys,
    *nav_keys,
    *move_keys,
]


bg_color = "#282C34"
alpha_bg_color = "#282C34AB"
fg_color = "#ABB2BF"
accent_color = "#61AFEF"
accent_color2 = "#C678DD"
accent_color3 = "#56B6C2"
good_color = "#98C379"
warn_color = "#E5C07B"
error_color = "#E06C75"


layouts = [
    layout.MonadTall(
        border_focus=accent_color,
        border_normal=fg_color,
        margin=9,
        border_width=2,
        ratio=0.6,
        new_client_position="top",
    ),
]


widget_defaults = dict(
    font='font-awesome',
    fontsize=14,
    padding=3,
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="line",
                    hide_unused=True,
                    borderwidth=2,
                    active=accent_color,
                    inactive=fg_color,
                    foreground=accent_color,
                    this_screen_border=accent_color,
                    this_current_screen_border=accent_color,
                    warn_color=warn_color,
                    urgent_border=error_color,
                ),
                widget.WindowName(
                    foreground=accent_color2,
                ),
                widget.Chord(
                    chords_colors={
                        'launch': (accent_color2, bg_color),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CurrentLayout(foreground=good_color),
                widget.MemoryGraph(),
                widget.Systray(),
                widget.Clock(
                    format='  %a %-m/%-d %-I:%M %p  ',
                    foreground=fg_color,
                ),
            ],
            24,
            background=bg_color,
        ),
    )
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules[:-2],
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
    ],
    border_focus=accent_color,
    border_normal=fg_color,
    border_width=3,
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
