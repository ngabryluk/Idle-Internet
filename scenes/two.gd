extends Upgrade

class_name Two

func _init():
	cost = 100
	packets_per_second = 2
	cost_increase_rate = 1.25
	default_text = "Packet Relay Upgrade"
