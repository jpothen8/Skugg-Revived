extends CharacterBody2D

var speed = 500
var current_dir = "right"
var bullet = load("res://scenes/skugg_bullet.tscn")

func _ready() -> void:
	get_tree().set_auto_accept_quit(true)

func _physics_process(delta: float) -> void:
	player_movement(delta)
	var b 
	if(Input.is_action_just_pressed("shoot") and current_dir == "right"):
		print("SKUGGITY")
		Global.bullet_dir = "right"
		b = bullet.instantiate() 
		b.position.x = self.position.x
		b.position.y = self.position.y + 5
		get_parent().add_child(b)
	elif (Input.is_action_just_pressed("shoot") and current_dir == "left"):
		print("LEFT")
		Global.bullet_dir = "left"
		b = bullet.instantiate() 
		b.change_dir("left")
		b.position.x = self.position.x
		b.position.y = self.position.y + 5
		get_parent().add_child(b)
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
		#current_dir = "up"
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
