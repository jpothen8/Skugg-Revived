extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("INC")
	Global.enemies +=1
	Global.enemyCount = Global.enemies + 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_store_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/store.tscn")
