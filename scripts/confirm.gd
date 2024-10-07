extends Node2D

var og_text = "Yeah, I don't care about Skugg"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.went_through_confirm_screen = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_mouse_entered() -> void:
	$play.text = "I'm a horrible person but I'll still read his lore"


func _on_play_mouse_exited() -> void:
	$play.text = og_text


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lore.tscn")


func _on_lore_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lore.tscn")
