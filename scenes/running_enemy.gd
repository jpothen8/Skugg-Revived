extends CharacterBody2D

var speed = 5
var player_chase = false
var player = null 
var health = 100
var player_inattack_zone = false
var bullet = load("res://scenes/bullet.tscn")
var added_rotation = 0
func _physics_process(delta):
	added_rotation += 2
	
	
	self.position.x += speed
	var b = bullet.instantiate()
	b.position.x = self.position.x + 10
	b.rotation = added_rotation
	get_parent().add_child(b)
	
	
	deal_with_damage()
	if player_chase and health > 0:
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("walk")
	elif health > 0:
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
	
		if health <= 0: 
			$AnimatedSprite2D.play("defeat")
			self.queue_free()


func _on_timer_timeout() -> void:

	$healthbar.set_value_no_signal(health)
