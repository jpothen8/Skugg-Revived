extends Node2D

var total_time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	total_time += delta
	$ProgressBar.value = 15.0 - total_time


func _on_back_pressed() -> void:
	if total_time > 15.0:
		get_tree().change_scene_to_file("res://start.tscn")
	total_time -= 1.0
