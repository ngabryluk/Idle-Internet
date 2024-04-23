extends Control

class_name Upgrade

signal upgraded

@onready var upgrade_button: Button = $UpgradeButton
@onready var text: RichTextLabel = $UpgradeButton/Text

var cost: int = 0
var packets_per_click: int = 0
var packets_per_second: int = 0
var cost_increase_rate: float = 0
var default_text: String = ""

func _ready():
	update_button_text(Color.RED)
	
	# If the upgrade increases packets per click
	if packets_per_click > 0 and packets_per_second > 0:
		upgrade_button.tooltip_text = "+" + str(packets_per_click) + " Packets Per Click / +" + str(packets_per_second) + " Packets Per Second"
	elif packets_per_second > 0:
		upgrade_button.tooltip_text = "+" + str(packets_per_second) + " Packets Per Second"
	else:
		upgrade_button.tooltip_text = "+" + str(packets_per_click) + " Packets Per Click"

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

func _on_upgrade_button_pressed():
	if Globals.num_packets >= cost:
		# Update rate
		Globals.packets_per_click += packets_per_click
		Globals.auto_packets_per_second += packets_per_second
		
		# Deduct packets
		Globals.num_packets -= cost
		
		# Update cost
		cost = ceili(cost * cost_increase_rate)
		upgraded.emit()

func update_button_text(color):
	text.clear()
	text.push_paragraph(HORIZONTAL_ALIGNMENT_CENTER)
	text.push_font_size(25)
	text.append_text(default_text + "\n")
	text.push_color(color)
	text.append_text(str(cost))
	text.pop()
	text.append_text(" Packets")
	text.pop()
	text.pop()
	#upgrade_button.text = default_text + "\n" + str(cost) + " Packets"
