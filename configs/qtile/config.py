import os
import subprocess

from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy


# from libqtile.widget import pulse_volume
# -------------------------------------------------
# BASIC SETTINGS
# -------------------------------------------------
os.environ["QT_QPA_PLATFORMTHEME"] = "gtk3"
os.environ["GTK_USE_PORTAL"] = "1"
os.environ["QT_QPA_PLATFORMTHEME"] = "gtk3"

mod = "mod4"
terminal = "kitty"
browser = "brave"
file_manager = "thunar"
logout = "archlinux-logout"

normal_border_color = "#4c566a"
focused_border_color = "#ffb86c"
active_border_color = "#50fa7b"

# -------------------------------------------------
# KEYBINDINGS
# -------------------------------------------------

keys = [
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "space", lazy.layout.next()),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod], "n", lazy.layout.normalize()),

    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "t", lazy.window.toggle_floating()),

    Key([mod], "b", lazy.spawn(browser)),
    Key([mod], "e", lazy.spawn(file_manager)),
    Key([mod], "x", lazy.spawn(logout)),
    Key([mod], "d", lazy.spawn(os.path.expanduser("~/.config/qtile/launcher.sh"))),
    # Key([], "Print", lazy.spawn("flameshot gui")),
    Key([], "Print", lazy.spawn("flatpak run org.flameshot.Flameshot gui")),
    Key(["mod1"], "n", lazy.spawn("variety --next"), desc="Variety next wallpaper"),
    Key(["mod1"], "p", lazy.spawn("variety --previous"), desc="Variety previous wallpaper"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/volume_control.sh up"))),
    Key([], "XF86AudioLowerVolume", lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/volume_control.sh down"))),
    Key([], "XF86AudioMute", lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/volume_control.sh mute"))),
    
#    Key([mod, "control"], "r", lazy.reload_config()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),
]

# -------------------------------------------------
# WORKSPACES
# -------------------------------------------------

group_labels = ["⬤"] * 10

# group_labels = [""] * 10
#group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
# group_labels = ["DEV", "WWW", "SYS", "DOC", "VBOX", "CHAT", "MUS", "VID", "GFX", "MISC"]

groups = []
for i, label in enumerate(group_labels):
    name = str(i + 1)
    groups.append(Group(name=name, label=label))

for i, g in enumerate(groups):
    if i < 9:
        key_name = str(i + 1)
    else:
        key_name = "0"

    keys.extend(
        [
            Key([mod], key_name, lazy.group[g.name].toscreen()),
            Key([mod, "shift"], key_name, lazy.window.togroup(g.name, switch_group=True)),
        ]
    )

# -------------------------------------------------
# LAYOUTS
# -------------------------------------------------

layouts = [
    layout.Bsp(
        border_width=3,
        border_focus=focused_border_color,
        border_normal=normal_border_color,
        grow_amount=10,
        fair=True,
        margin=1,
        border_on_single=True,
    ),
    layout.Max(),
]



# -------------------------------------------------
# BAR WIDGETS
# -------------------------------------------------

widget_defaults = dict(
    font="JetBrains Mono",
    fontsize=12,
    padding=3,
    background="#1a1b26",
)
extension_defaults = widget_defaults.copy()


def init_widgets():
    return [
        widget.Spacer(length=8),

        widget.Image(
            filename=os.path.expanduser("~/.config/qtile/icons/archlinux.svg"),
            scale=True,
            margin_y=4,
            mouse_callbacks={
                "Button1": lazy.spawn(os.path.expanduser("~/.config/qtile/launcher.sh"))
            },
        ),

        widget.Prompt(),

        widget.GroupBox(
            fontsize=10,
            margin_y=5,
            margin_x=10,
            padding_x=4,
            borderwidth=3,
            active="#faa356",
            inactive="#cea5fb",
            highlight_method="line",
            this_current_screen_border="#fff29c",
            rounded=False,
        ),

        widget.TextBox(text="|", padding=4),

        widget.CurrentLayout(padding=6, foreground="#faa356", fontsize=14, font="JetBrains Mono Bold"),

        widget.TextBox(text="|", padding=4),

        widget.WindowName(max_chars=80, padding=8, fontsize="14", foreground="#7ce38b", font="JetBrains Mono Bold"),

        # widget.Spacer(),

        # widget.TaskList(
        #     # highlight_method="block",
        #     # border="#",
        #     foreground="#7ce38b",
        #     icon_size=18,
        #     padding=6,
        #     rounded=False,
        #     fontsize=14,
        #     font="JetBrains Mono Bold",
        # ),

        widget.Spacer(),

        widget.Systray(
                padding=8
                ),

        widget.CPU(
                 foreground = "#fa7970",
                 padding = 8, 
                 mouse_callbacks = {'Button1': lazy.spawn(terminal + ' -e btop')}, 
                 format = 'Cpu :{load_percent}%',
                 fontsize=14,
                 font="JetBrains Mono Bold",
                #  fmt="<u>{}</u>",
                 ),

        widget.Memory(
                 foreground = "#7aa2f7",
                 padding = 8, 
                 mouse_callbacks = {'Button1': lazy.spawn(terminal + ' -e btop')},
                 format = '{MemUsed: .0f}{mm}',
                 fmt = 'Mem: {}',
                 fontsize=14,
                 font="JetBrains Mono Bold",
                 ),

        widget.GenPollText(
            update_interval=1,
            func=lambda: subprocess.check_output("pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1", shell=True).decode("utf-8").strip(),
            padding=8,
            # fmt=" {}",
            fmt="Vol: {}",
            # fmt="Vol: {}",
            fontsize=14,
            font="JetBrains Mono Bold",
            mouse_callbacks={
                "Button1": lazy.spawn("pavucontrol"),
                "Button3": lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
            },
            foreground="#faa356",
        ),

        widget.Battery(
                fontsize=14,
                font="JetBrains Mono Bold",
                format="{percent:2.0%}",
                fmt = 'Bat 󰁹: {}',
                show_short_text=False,
                padding=8,
                foreground="#7ce38b",
        ),

        widget.Clock(
                fontsize=14,
                font="JetBrains Mono Bold",
                format="%d %B %A | %I:%M:%S %p",
                padding=8,
                foreground="#a2d2fd",
                # mouse_callbacks={"Button1": lazy.spawn("gsimplecal")},
                mouse_callbacks={"Button1": lazy.spawn("gsimplecal && xdotool search --name gsimplecal windowactivate")}
        ),
    ]




# -------------------------------------------------
# SCREENS
# -------------------------------------------------

screens = [
    Screen(
        top=bar.Bar(
            widgets=init_widgets(),
            size=30,
        ),
    ),
]


# -------------------------------------------------
# MOUSE
# -------------------------------------------------

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# -------------------------------------------------
# FLOATING RULES
# -------------------------------------------------

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(title="pinentry"),
        Match(wm_class="ssh-askpass"),
    ]
)

# -------------------------------------------------
# GENERAL BEHAVIOR
# -------------------------------------------------

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"

# -------------------------------------------------
# AUTOSTART
# -------------------------------------------------

@hook.subscribe.startup_once
def autostart():
    subprocess.Popen([os.path.expanduser("~/.config/qtile/autostart.sh")])

    # Launch startup apps on specific workspaces
    # startup_cmd = (
    #     "sleep 1; "
    #     "qtile cmd-obj -o group 1 -f toscreen; kitty & "
    #     "sleep 1; "
    #     "qtile cmd-obj -o group 2 -f toscreen; brave & "
    #     "sleep 1; "
    #     "qtile cmd-obj -o group 3 -f toscreen; firefox &"
    # )
    # subprocess.Popen(startup_cmd, shell=True)
