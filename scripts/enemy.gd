extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null 
var health = 100
var player_inattack_zone = false
var bullet = load("res://scenes/bullet.tscn")

var added_rotation = 0.0

func _physics_process(delta):
	$healthbar.set_value_no_signal(health)
	added_rotation += 0.2
	var b = bullet.instantiate()
	b.position.x = self.position.x + 10
	b.rotation = added_rotation
	get_parent().add_child(b)
	if (health <= 0):
		self.queue_free()
	
	deal_with_damage()
	if player_chase and health > 0:
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("walk")
	elif health > 0:
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()
	

func deal_with_damage():
	
		if health <= 0: 
			$AnimatedSprite2D.play("defeat")
			

func _on_animated_sprite_2d_animation_finished() -> void:
	self.queue_free()





func _on_hitbox_area_entered(area: Area2D) -> void:
	print("colliding")
	if(area.is_in_group("PlayerBullet")):
		health -=25
