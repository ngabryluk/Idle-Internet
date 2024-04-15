extends Control

class_name Upgrade

signal upgraded

@onready var upgrade_button: Button = $UpgradeButton

var cost: int = 0
var packets_per_click: int = 0
var packets_per_second: int = 0
var cost_increase_rate: float = 0
var default_text: String = ""

func _ready():
	update_button_text()

func _on_upgrade_button_pressed():
	if Globals.num_packets >= cost:
		# Update rate
		Globals.packets_per_click += packets_per_click
		Globals.auto_packets_per_second += packets_per_second
		
		# Deduct packets
		Globals.num_packets -= cost
		
		# Update cost
		cost = ceili(cost * cost_increase_rate)
		update_button_text()
		upgraded.emit()

func update_button_text():
	upgrade_button.text = default_text + "\n" + str(cost) + " Packets"
