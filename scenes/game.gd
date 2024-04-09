extends Control

@onready var packet_total_label: Label = $PacketTotal
@onready var packet_rate_label: Label = $PacketRateLabel

func _ready():
	# Specify the text in the display labels at the top
	packet_total_label.text = str(Globals.num_packets) + " packet(s)"
	packet_rate_label.text = str(Globals.packets_per_click) + " packet/click\n" + str(Globals.auto_packets_per_second) + " packet(s)/second"

func _on_packet_button_pressed():
	update_packets(Globals.packets_per_click)

func update_packets(value):
	# Add the value to the num_packets global variable and update the packet total in the label
	Globals.num_packets += value
	packet_total_label.text = str(Globals.num_packets) + " packet(s)"

func _on_auto_timer_timeout():
	# Update the packet total by adding the amount that we're supposed to get every second
	update_packets(Globals.auto_packets_per_second)
