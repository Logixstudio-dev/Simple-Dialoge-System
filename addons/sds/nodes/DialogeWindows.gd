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
@export var KeyForNext : InputEventAction
@export var time_opening : float

var is_open = false

signal pressed_key_for_next
signal dialoge_finished


func _enter_tree() -> void:
	pass

func _exit_tree() -> void:
	pass

func _ready():
	if Engine.is_editor_hint():
		return
	
	modulate = Color(1.0, 1.0, 1.0, 0.0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(KeyForNext.action):
		pressed_key_for_next.emit()

func _process(delta: float) -> void:
	pass

func openWindow():
	if is_animate_window:
		var x = get_tree().create_tween()
		x.tween_property(self, "modulate", Color(1.0, 1.0, 1.0, 1.0), time_opening).set_trans(Tween.TRANS_QUAD)
	else:
		modulate.a = 1

func closeWindow():
	if is_animate_window:
		var x = get_tree().create_tween()
		x.tween_property(self, "modulate", Color(1.0, 1.0, 1.0, 0.0), time_opening).set_trans(Tween.TRANS_QUAD)
	else:
		modulate.a = 0
	is_open = true

func start(dialoge: String):
	if not FileAccess.file_exists(dialoge):
		print("ERROR: not file from dialogue")
		return
	
	var f = FileAccess.open(dialoge, FileAccess.READ)
	var d = JSON.parse_string(f.get_as_text())
	if d == {}:
		print("ERROR: dialogue is null")
		return
	
	openWindow()
	
	if is_open:
		processDialoge(d)

func processDialoge(data: Dictionary):
	pass
