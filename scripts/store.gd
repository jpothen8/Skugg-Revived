extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_health_up_button_down() -> void:
	Global.health += .25
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_dmg_up_button_down() -> void:
	Global.dmg += .25
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_skip_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")