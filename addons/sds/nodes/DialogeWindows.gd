@tool

@icon("res://addons/sds/images/window.svg")
class_name DialogeWindows
extends Node2D

@export_category("data")
@export var Text : Label
@export var Name : Label
@export var avatar : Sprite2D
@export var Choices : Container
@export_category("music")
@export var textMusic : AudioStream
@export var AvatarMusic : AudioStream
@export_category("settings")
@export var is_animate_window : bool
@export var is_animate_text : bool
@export var is_animate_name : bool

func _enter_tree() -> void:
	pass

func _exit_tree() -> void:
	pass

func _ready():
	if Engine.is_editor_hint():
		return

func _input(event: InputEvent) -> void:
	pass

func _process(delta: float) -> void:
	pass
