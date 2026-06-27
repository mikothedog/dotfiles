#!/bin/bash
busctl get-property org.bluez /org/bluez/hci0 org.bluez.Adapter1 Powered | grep -q true && echo '󰂯' || echo ""
