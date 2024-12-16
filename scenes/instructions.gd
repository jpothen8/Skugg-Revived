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


func _on_dontpress_mouse_entered() -> void:
	$dontpress.text = "go back"


func _on_dontpress_pressed() -> void:
	Global.went_through_confirm_screen = false
	Global.dev_mode = true
	Global.skugg_off_screen = true
	Global.skugg_pressed = false
	Global.bullet_dir = "right"
	Global.enemies = 2
	Global.enemyCount = 2
	Global.gameover = false
	Global.deleteButtons = false
	Global.saidWow = false
	Global.killSpeech = false
	Global.money = 0
	Global.health = 1
	Global.dmg = 1
	$AudioStreamPlayer.stop()
	get_tree().change_scene_to_file("res://scenes/start.tscn")


func _on_dontpress_mouse_exited() -> void:
	$dontpress.text = "DON'T PRESS THIS BRUH"
