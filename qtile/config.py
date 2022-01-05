import getpass
import subprocess


from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


@hook.subscribe.startup_once
def autostart():
    subprocess.Popen('/home/{getpass.getuser()}/.config/qtile/autostart.sh')

mod = "mod4"

group_names = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
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
    Key([mod], "Return", lazy.spawn("kitty -e fish")),
    Key([mod, "shift"], "Return", lazy.spawn("kitty")),
    Key([mod], "d", lazy.spawn("rofi -show drun -modi drun")),
    Key([mod, "shift"], "d", lazy.spawn("rofi -show run -modi run")),
    Key([mod], "e", lazy.spawn("nautilus")),

]

accent_color = "#FF00FF"


layouts = [
    layout.MonadTall(border_focus=accent_color, border_normal='#F0F0F0', margin=5, border_width=3),
    layout.Columns(border_focus=accent_color, border_normal='#F0F0F0', margin=5, border_width=3),
    layout.TreeTab(border_focus=accent_color, border_normal='#F0F0F0', margin=5, border_width=3),
    layout.Zoomy(border_focus=accent_color, border_normal='#F0F0F0', margin=5, border_width=3),
    layout.Max(),
]


widget_defaults = dict(font='font-awesome', fontsize=12, padding=3)


extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(
                    borderwidth=2,
                    this_screen_border=accent_color,
                    this_current_screen_border=accent_color,
                ),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={'launch': ("#ff0000", "#ffffff")},
                    name_transform=lambda name: name.upper(),
                ),
                widget.Bluetooth(),
                widget.Battery(),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.QuickExit(),
            ],
            24,
            background="#000000AA",
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
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
