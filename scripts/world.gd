extends Node2D

var NewRunningEnemy
var NewEnemy
var NewBoss
var random = RandomNumberGenerator.new()
var newEnemy = load("res://scenes/enemy.tscn")
var newRunningEnemy = load("res://scenes/running_enemy.tscn")
var newBoss = load("res://scenes/boss.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SpawnEnemy()
	Global.gameover = false
	get_tree().set_auto_accept_quit(true)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED) 
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(Global.enemyCount <= 0):
		get_tree().change_scene_to_file("res://scenes/path.tscn")
		



func SpawnEnemy():
	print("RUNNING NEW ENEMY")
	#Global.enemyCount = Global.enemies 
	if ((Global.enemies - 2) % 4 == 0):
		NewBoss = newBoss.instantiate()
		NewBoss.position = Vector2(random.randi_range(50,200),random.randi_range(50,200))
		get_parent().add_child(NewBoss)
	else:
		for i in Global.enemies:
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
	if get_tree() != null:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
