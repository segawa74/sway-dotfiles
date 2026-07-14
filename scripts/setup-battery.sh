#!/bin/bash
# ThinkPadのバッテリー充電しきい値を設定するスクリプト

echo "Setting ThinkPad battery thresholds (85% - 90%)..."
sudo sh -c 'echo 85 > /sys/class/power_supply/BAT0/charge_control_start_threshold'
sudo sh -c 'echo 90 > /sys/class/power_supply/BAT0/charge_control_end_threshold'

echo "Current thresholds:"
echo "Start: $(cat /sys/class/power_supply/BAT0/charge_control_start_threshold)"
echo "End:   $(cat /sys/class/power_supply/BAT0/charge_control_end_threshold)"
