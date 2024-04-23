extends Upgrade

class_name Mega

func _init():
	cost = 20000
	packets_per_second = Globals.auto_packets_per_second * 1.25
	packets_per_click = Globals.packets_per_click * 1.25
	cost_increase_rate = 2.5
	default_text = "Ultimate Network Update"

func _process(_delta):
	# Change the opacity of the button depending on if the player has enough packets
	var tween = get_tree().create_tween()
	var color
	if Globals.num_packets >= cost:
		# Change the opacity of the button to full
		tween.tween_property(upgrade_button, "modulate:a", 1, 0.3)
		color = Color.GREEN
	else:
		# Change opacity of the button to half
		tween.tween_property(upgrade_button, "modulate:a", 0.5, 0.3)
		color = Color.RED
	
	update_button_text(color)
	
	packets_per_second = Globals.auto_packets_per_second * 1.25
	packets_per_click = Globals.packets_per_click * 1.25
	
	# If the upgrade increases packets per click
	if packets_per_click > 0 and packets_per_second > 0:
		upgrade_button.tooltip_text = "+" + str(packets_per_click) + " Packets Per Click / +" + str(packets_per_second) + " Packets Per Second"
	elif packets_per_second > 0:
		upgrade_button.tooltip_text = "+" + str(packets_per_second) + " Packets Per Second"
	else:
		upgrade_button.tooltip_text = "+" + str(packets_per_click) + " Packets Per Click"
