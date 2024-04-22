extends Control

func update_rate_display():
	$"../../../../PacketRateLabel".text = str(Globals.packets_per_click) + " packets/click\n" + str(Globals.auto_packets_per_second) + " packets/second"
	$"../PacketButton".tooltip_text = "Add " + str(Globals.packets_per_click) + " packets to your total"

func update_packet_amount():
	$"../../../../PacketTotal".text = str(Globals.num_packets) + " packet(s)"

func _on_upgrade_upgraded():
	update_rate_display()
	update_packet_amount()
