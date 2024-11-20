extends Node2D

var NewRunningEnemy
var NewEnemy
var random = RandomNumberGenerator.new()
var newEnemy = load("res://scenes/enemy.tscn")
var newRunningEnemy = load("res://scenes/running_enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
		
	get_tree().set_auto_accept_quit(true)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED) 
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(Global.enemyCount <= 0):
		SpawnEnemy()



func SpawnEnemy():
	print("RUNNING NEW ENEMY")
	Global.enemies += 1
	Global.enemyCount = Global.enemies
	for i in Global.enemyCount:
		var randomize = random.randi_range(1,2)
		if(randomize == 1):
			NewEnemy = newEnemy.instantiate()
			NewEnemy.position = Vector2(random.randi_range(50,200),random.randi_range(50,200))
			get_parent().add_child(NewEnemy)
		else:
			NewRunningEnemy = newRunningEnemy.instantiate()
			NewRunningEnemy.position = Vector2(random.randi_range(50,200),random.randi_range(50,200))
			get_parent().add_child(NewRunningEnemy)
	


func _on_player_tree_exited() -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
