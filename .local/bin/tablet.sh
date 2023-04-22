#!/usr/bin/env fish


set STYLUS_ID (xsetwacom --list | grep stylus | cut -f 2 | cut -d " " -f 2)
echo "STYLUS_ID $STYLUS_ID"
set PAD_ID (xsetwacom --list | grep "Pad pad" | cut -f 2 | cut -d " " -f 2)
echo "PAD_ID $PAD_ID"

set SCREEN_WIDTH 1920
set SCREEN_HEIGHT 1080

set TABLET_WIDTH (xsetwacom --get "$STYLUS_ID" Area | cut -d " " -f 3)
set TABLET_HEIGHT (xsetwacom --get "$STYLUS_ID" Area | cut -d " " -f 4)
echo "TABLET_WIDTH $TABLET_WIDTH TABLET_HEIGHT $TABLET_HEIGHT"

set NEW_TABLET_HEIGHT (math --scale=0 $SCREEN_HEIGHT \* $TABLET_WIDTH / $SCREEN_WIDTH)
set TABLET_OFFSET_Y (math $TABLET_HEIGHT - $NEW_TABLET_HEIGHT)
set TABLET_OFFSET_Y (math --scale=0 $TABLET_OFFSET_Y / 2)
echo "TABLET_OFFSET_Y $TABLET_OFFSET_Y"

set PRIMARY_SCREEN_ID (xrandr | grep primary | cut -d " " -f 1)
echo "PRIMARY_SCREEN_ID $PRIMARY_SCREEN_ID"

xsetwacom --set "$STYLUS_ID" ResetArea
echo "xsetwacom --set \"$STYLUS_ID\" ResetArea"
xsetwacom --set "$PAD_ID" RawSample 4
echo "xsetwacom --set \"$PAD_ID\" RawSample 4"
xinput map-to-output $STYLUS_ID $PRIMARY_SCREEN_ID
echo "xinput map-to-output $STYLUS_ID $PRIMARY_SCREEN_ID"
xsetwacom --set $STYLUS_ID Area 0 $TABLET_OFFSET_Y $TABLET_WIDTH $NEW_TABLET_HEIGHT
echo "xsetwacom --set $STYLUS_ID Area 0 $TABLET_OFFSET_Y $TABLET_WIDTH $NEW_TABLET_HEIGHT"

