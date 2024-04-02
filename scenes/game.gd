extends Control

@onready var packet_total_label: Label = $MarginContainer/TabContainer/Game/PacketTotal
@onready var multiplier_label: Label = $MarginContainer/TabContainer/Game/MultiplierLabel

var packet_total: int = 0
var multiplier: int = 0

func _ready():
	packet_total_label.text = str(packet_total)
	multiplier_label.text = "1 packet/click"

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/welcome.tscn")

func _on_packet_button_pressed():
	if multiplier == 0:
		packet_total += 1
	else:
		packet_total += multiplier
	
	packet_total_label.text = str(packet_total)

func _on_2xbutton_pressed():
	multiplier += 2
	multiplier_label.text = str(multiplier) + " packets/click"

func _on_4xbutton_pressed():
	multiplier += 4
	multiplier_label.text = str(multiplier) + " packets/click"

func _on_8xbutton_pressed():
	multiplier += 8
	multiplier_label.text = str(multiplier) + " packets/click"
