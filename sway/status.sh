date_formatted=$(date "+%a %F %H:%M")

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo $battery_status $date_formatted
