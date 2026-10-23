@tool

@icon("res://addons/sds/images/click.svg")
class_name DialogeChoice
extends Button

signal is_pressed

func _enter_tree() -> void:
	pass

func _exit_tree() -> void:
	pass

func _process(delta: float) -> void:
	if button_pressed:
		is_pressed.emit()
