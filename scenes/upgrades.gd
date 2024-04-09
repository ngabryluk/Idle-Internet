extends Control

@onready var click_upgrade_button: Button = $HBoxContainer/VBoxContainer/Click
@onready var two_multiplier_upgrade_button: Button = $HBoxContainer/VBoxContainer/TwoMultiplier
@onready var five_multiplier_upgrade_button: Button = $HBoxContainer/VBoxContainer/FiveMultiplier

func _ready():
	click_upgrade_button.text = "Increase Packet Stream\n10 Packets"
	two_multiplier_upgrade_button.text = "Packet Relay Upgrade\n50 Packets"
	five_multiplier_upgrade_button.text = "Packet Relay Enhancement\n100 Packets"

func _on_click_pressed():
	Globals.multiplier += 1
