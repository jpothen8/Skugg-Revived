extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null 
var health = 100
var player_inattack_zone = false
var bullet = load("res://scenes/bullet.tscn")

func _physics_process(delta):
	rotate(.05)
	
	var b = bullet.instantiate()
	b.position.x += 10
	b.rotation = self.rotation
	get_parent().add_child(b)
	
	
	deal_with_damage()
	if player_chase:
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
	move_and_slide()
	
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false


func _on_enemy_hitbox_body_entered(body):
	if body.is_in_group("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.is_in_group("player"):
		player_inattack_zone = false

func deal_with_damage():
	if player_inattack_zone == true:
		health -= 25
		$healthbar.set_value_no_signal(health)
		print("Slime health: " + str(health))

		if health <= 0: 
			$AnimatedSprite2D.play("defeat")
			self.queue_free()


func _on_timer_timeout() -> void:
	health -= 5
	$healthbar.set_value_no_signal(health)
