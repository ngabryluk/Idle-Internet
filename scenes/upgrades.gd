extends Control

@onready var click_upgrade_button: Button = $HBoxContainer/VBoxContainer/Click
@onready var two_multiplier_upgrade_button: Button = $HBoxContainer/VBoxContainer/TwoMultiplier
@onready var five_multiplier_upgrade_button: Button = $HBoxContainer/VBoxContainer/FiveMultiplier

var click_cost: int = 15
var two_cost: int = 100
var five_cost: int = 500

func _ready():
	update_button_text()

func _on_click_pressed():
	if Globals.num_packets >= click_cost:
		# Update rate
		Globals.packets_per_click += 1
		update_rate_display()
		
		# Deduct packets
		Globals.num_packets -= click_cost
		update_packet_amount()
		
		# Update cost
		click_cost = ceili(click_cost * 1.15)
		update_button_text()

func _on_two_multiplier_pressed():
	if Globals.num_packets >= two_cost:
		# Update rate
		Globals.auto_packets_per_second += 2
		update_rate_display()
		
		# Deduct packets
		Globals.num_packets -= two_cost
		update_packet_amount()
		
		# Update cost
		two_cost = ceili(two_cost * 1.15)
		update_button_text()

func _on_five_multiplier_pressed():
	if Globals.num_packets >= five_cost:
		# Update rate
		Globals.auto_packets_per_second += 5
		update_rate_display()
		
		# Deduct packets
		Globals.num_packets -= five_cost
		update_packet_amount()
		
		# Update cost
		five_cost = ceili(five_cost * 1.15)
		update_button_text()

func update_button_text():
	click_upgrade_button.text = "Increase Packet Stream\n" + str(click_cost) + " Packets"
	two_multiplier_upgrade_button.text = "Packet Relay Upgrade\n" + str(two_cost) + " Packets"
	five_multiplier_upgrade_button.text = "Packet Relay Enhancement\n" + str(five_cost) + " Packets"

func update_rate_display():
	$"../../../../PacketRateLabel".text = str(Globals.packets_per_click) + " packets/click\n" + str(Globals.auto_packets_per_second) + " packets/second"

func update_packet_amount():
	$"../../../../PacketTotal".text = str(Globals.num_packets) + " packet(s)"
