#!/usr/bin/env fish

set -gx elecom_id (string replace -r '^.*id=([0-9]*).*$' '$1' (xinput list | grep ELECOM | grep pointer))
echo $elecom_id

xinput --set-prop $elecom_id 'libinput Scroll Method Enabled' 0, 0, 1
xinput --set-prop $elecom_id 'libinput Button Scrolling Button' 2
xinput --set-prop $elecom_id 'libinput Button Scrolling Button Lock Enabled' 0

