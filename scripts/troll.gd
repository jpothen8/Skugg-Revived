extends Node2D

var value = 0
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().set_auto_accept_quit(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer >= 1:
		if value >= 8:
			get_tree().change_scene_to_file("res://scenes/catch_skugg.tscn")
		$ProgressBar.value = value
		value = 0
		timer = 0


func _on_button_pressed() -> void:
	value += 1
