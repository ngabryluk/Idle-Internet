extends Control

@onready var packet_total_label: Label = $PacketTotal
@onready var packet_rate_label: Label = $PacketRateLabel

func _ready():
	packet_total_label.text = str(Globals.num_packets) + " packet(s)"
	packet_rate_label.text = "1 packet/click\n" + str(Globals.auto_packets_per_second) + " packet(s)/second"

func _on_packet_button_pressed():
	var val
	if Globals.packets_per_click == 0:
		val = 1
	else:
		val = Globals.packets_per_click
	
	update_packets(val)

func update_packets(value):
	Globals.num_packets += value
	packet_total_label.text = str(Globals.num_packets) + " packet(s)"

func _on_auto_timer_timeout():
	update_packets(Globals.auto_packets_per_second)
