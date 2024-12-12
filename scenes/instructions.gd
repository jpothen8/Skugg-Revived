extends Node2D

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().set_auto_accept_quit(true)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")
