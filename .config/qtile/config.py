import subprocess

from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


@hook.subscribe.startup_once
def autostart():
    subprocess.Popen('/home/steven/.config/qtile/autostart.sh')

mod = "mod4"

group_names = [
    "Main",
    "Boxes",
    "Web",
    "Files",
    "Side 1",
    "Side 2",
    "Video",
    "Comms",
    "Music",
    "Background",
]

groups = [Group(name) for name in group_names]

keys = [

    # Changing Focus on Windows
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),

    # Moving Windows Around
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Resizing
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "control"], "n", lazy.layout.normalize()),

    # Layouts
    Key([mod], "Tab", lazy.layout.next()),
    Key([mod], "space", lazy.next_layout()),
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "e", lazy.shutdown()),

    # Changing Group
    Key([mod], "1", lazy.group[group_names[0]].toscreen()),
    Key([mod], "2", lazy.group[group_names[1]].toscreen()),
    Key([mod], "3", lazy.group[group_names[2]].toscreen()),
    Key([mod], "4", lazy.group[group_names[3]].toscreen()),
    Key([mod], "5", lazy.group[group_names[4]].toscreen()),
    Key([mod], "6", lazy.group[group_names[5]].toscreen()),
    Key([mod], "7", lazy.group[group_names[6]].toscreen()),
    Key([mod], "8", lazy.group[group_names[7]].toscreen()),
    Key([mod], "9", lazy.group[group_names[8]].toscreen()),
    Key([mod], "0", lazy.group[group_names[9]].toscreen()),

    # Moving window to Group
    Key([mod, "shift"], "1", lazy.window.togroup(group_names[0], switch_group=False)),
    Key([mod, "shift"], "2", lazy.window.togroup(group_names[1], switch_group=False)),
    Key([mod, "shift"], "3", lazy.window.togroup(group_names[2], switch_group=False)),
    Key([mod, "shift"], "4", lazy.window.togroup(group_names[3], switch_group=False)),
    Key([mod, "shift"], "5", lazy.window.togroup(group_names[4], switch_group=False)),
    Key([mod, "shift"], "6", lazy.window.togroup(group_names[5], switch_group=False)),
    Key([mod, "shift"], "7", lazy.window.togroup(group_names[6], switch_group=False)),
    Key([mod, "shift"], "8", lazy.window.togroup(group_names[7], switch_group=False)),
    Key([mod, "shift"], "9", lazy.window.togroup(group_names[8], switch_group=False)),
    Key([mod, "shift"], "0", lazy.window.togroup(group_names[9], switch_group=False)),

    # Launch Programs
    Key([mod], "w", lazy.spawn("firefox")),
    Key([mod], "Return", lazy.spawn("xfce4-terminal -e fish")),
    Key([mod, "shift"], "Return", lazy.spawn("xfce4-terminal")),
    Key([mod], "d", lazy.spawn("rofi -show drun -modi drun")),
    Key([mod, "shift"], "d", lazy.spawn("rofi -show run -modi run")),
    Key([mod], "e", lazy.spawn("thunar")),
    Key([mod], "b", lazy.spawn("battery-status")),

    Key([mod], "minus", lazy.spawn("decrease-brightness")),
    Key([mod], "equal", lazy.spawn("increase-brightness")),

    KeyChord([mod], "grave", [
        KeyChord([], "r", [
            Key([], "1", lazy.spawn("send_command assist")),
            Key([], "2", lazy.spawn("send_command spread2")),
            Key([], "3", lazy.spawn("send_command spread3")),
            Key([], "4", lazy.spawn("send_command spread4")),
        ]),
        Key([], "q", lazy.spawn("send_command assist")),
        Key([], "d", lazy.spawn("send_command nuke")),
        Key([], "a", lazy.spawn("send_command back")),
        Key([], "z", lazy.spawn("send_command sit")),
        Key([], "f", lazy.spawn("send_command follow")),
    ]),

]


bg_color = "#282C34"
fg_color = "#ABB2BF"
accent_color = "#61AFEF"
accent_color2 = "#C678DD"
accent_color3 = "#56B6C2"
good_color = "#98C379"
warn_color = "#E5C07B"
error_color = "#E06C75"




layouts = [
    layout.MonadTall(
        border_focus=good_color,
        border_normal=fg_color,
        margin=9,
        border_width=3
    ),
    layout.Matrix(
        border_focus=good_color,
        border_normal=fg_color,
        margin=3,
        border_width=3
    ),
    layout.Max(),
]


widget_defaults = dict(
    font='font-awesome',
    fontsize=12,
    padding=3,
)


extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(foreground=good_color),
                widget.GroupBox(
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
                        'launch': (accent_color2,bg_color),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Clock(
                    format='%Y-%m-%d %a %I:%M %p',
                    foreground=fg_color,
                ),
                widget.Sep(foreground=fg_color, padding=5),
                #widget.Bluetooth(),
                widget.Systray(),
                #widget.Battery(),
                widget.QuickExit(foreground=warn_color),
            ],
            24,
            background=bg_color,
        ),
    ),
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
    border_focus=good_color,
    border_normal=fg_color,
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
