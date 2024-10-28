extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	if not Global.went_through_confirm_screen:
		get_tree().change_scene_to_file("res://scenes/confirm.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_info_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lore.tscn")
