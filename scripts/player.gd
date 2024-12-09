extends CharacterBody2D

var health = 500 * Global.health
var speed = 500
var current_dir = "right"
var bullet = load("res://scenes/skugg_bullet.tscn")
var attackready = false

func _ready() -> void:
	get_tree().set_auto_accept_quit(true)

func _physics_process(delta: float) -> void:
	$healthbar.set_value_no_signal(health)
	if (health <= 0):
		deal_with_damage()
		
	player_movement(delta)
	var b 
	if(Input.is_action_pressed("shoot") and current_dir == "right" and attackready == true):
		print("SKUGGITY")
		Global.bullet_dir = "right"
		b = bullet.instantiate() 
		b.position.x = self.position.x
		b.position.y = self.position.y + 5
		get_parent().add_child(b)
		attackready = false
		$attacktimer.start()
	elif (Input.is_action_pressed("shoot") and current_dir == "left" and attackready == true):
		print("LEFT")
		Global.bullet_dir = "left"
		b = bullet.instantiate() 
		b.change_dir("left")
		b.position.x = self.position.x
		b.position.y = self.position.y + 5
		get_parent().add_child(b)
		attackready = false
		$attacktimer.start()
	elif (Input.is_action_pressed("shoot") and current_dir == "up" and attackready == true):
		Global.bullet_dir = "up"
		b = bullet.instantiate() 
		b.change_dir("up")
		b.position.x = self.position.x + 5
		b.position.y = self.position.y
		get_parent().add_child(b)
		attackready = false
		$attacktimer.start()
func player_movement(delta):
	#Grid based player movement logic
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_animation(1)
		#pass o value of 1 if player is moving, 0 if not
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_animation(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
		
		current_dir = "up"
		print(current_dir)
		play_animation(1)
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		#current_dir = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y = speed
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
func play_animation(movement):
	var dir = current_dir
	var animation = $AnimatedSprite2D
	
	if dir == "right":
		animation.flip_h = false
		if movement  == 1:
			animation.play("walk")
		elif movement == 0:
				animation.play("idle")
	if dir == "left":
		animation.flip_h = true
		if movement  == 1:
			animation.play("walk")
		elif movement == 0:
				animation.play("idle")
	if dir == "up":
		animation.flip_h = false
		if movement  == 1:
			animation.play("walk")
		elif movement == 0:
				animation.play("idle")
	if dir == "down":
		animation.flip_h = false
		if movement  == 1:
			animation.play("walk")
		elif movement == 0:
				animation.play("idle")


func _on_attacktimer_timeout() -> void:
	attackready = true
	
		
func deal_with_damage():
	if health <= 0: 
			self.queue_free()
			


func _on_playerdamagebox_area_entered(area: Area2D) -> void:
	if(area.is_in_group("EnemyBullet")):
		print("HIT")
		health -=25
