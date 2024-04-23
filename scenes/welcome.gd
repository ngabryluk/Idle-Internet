extends Control

@onready var welcome_popup = $Container

signal game_start

func _on_start_pressed():
	game_start.emit()
