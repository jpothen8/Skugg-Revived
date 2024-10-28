extends CharacterBody2D

var speed = 5
var player_chase = false
var player = null 
var health = 100
var player_inattack_zone = false
var bullet = load("res://scenes/bullet.tscn")
var added_rotation = 0
var random = RandomNumberGenerator.new()
func _physics_process(delta):
	added_rotation += 2
	
	
	self.position.x += speed
	
	
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

func deal_with_damage():
	
		if health <= 0: 
			$AnimatedSprite2D.play("defeat")
			self.queue_free()


func _on_timer_timeout() -> void:

	$healthbar.set_value_no_signal(health)

func _on_hitbox_area_entered(area: Area2D) -> void:
	if(area.is_in_group("PlayerBullet")):
		health -=25


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	speed = -speed

func choose_attack():
	
	var attack = random.randi_range(1,6)
	if(attack == 1):
		pass
		circle_attack()
		await get_tree().create_timer(1.0).timeout
		circle_attack()
		await get_tree().create_timer(1.0).timeout
		circle_attack()
	elif(attack == 2):
		rotating_attack()
		await get_tree().create_timer(0.5).timeout
		rotating_attack()
		await get_tree().create_timer(0.5).timeout
		rotating_attack()
		await get_tree().create_timer(0.5).timeout
		rotating_attack()
		await get_tree().create_timer(0.5).timeout
		rotating_attack()
		await get_tree().create_timer(0.5).timeout
	elif(attack == 3):
		pass
	elif(attack == 4):
		pass
	elif(attack == 5):
		pass
	elif(attack == 6):
		pass

func _on_attacktimer_timeout() -> void:
	choose_attack()
	$attacktimer.start()

func circle_attack():
	var a = bullet.instantiate()
	var b = bullet.instantiate()
	var c = bullet.instantiate()
	var d = bullet.instantiate()
	var e = bullet.instantiate()
	var f = bullet.instantiate()
	var g = bullet.instantiate()
	var h = bullet.instantiate()
	a.rotation = 0
	b.rotation = (PI/2.0)
	c.rotation = (PI)
	d.rotation = (3.0 * PI/2.0)
	e.rotation = (PI/4.0)
	f.rotation = (-PI/4.0)
	g.rotation = (5.0 * PI/4.0)
	h.rotation = (3.0 * PI/4.0)
	a.position = self.position + Vector2(50.0, 0.0)
	b.position = self.position + Vector2(0.0, 50.0)
	c.position = self.position + Vector2(-50.0, 0.0)
	d.position = self.position + Vector2(0.0, -50.0)
	e.position = self.position + Vector2(50.0 * sin(e.rotation), 50.0 * cos(e.rotation))
	f.position = self.position + Vector2(-50.0 * sin(f.rotation), -50.0 * cos(f.rotation))
	g.position = self.position + Vector2(50.0 * sin(g.rotation), 50.0 * cos(g.rotation))
	h.position = self.position + Vector2(-50.0 * sin(h.rotation), -50.0 * cos(h.rotation))
	get_parent().add_child(a)
	get_parent().add_child(b)
	get_parent().add_child(c)
	get_parent().add_child(d)
	get_parent().add_child(e)
	get_parent().add_child(f)
	get_parent().add_child(g)
	get_parent().add_child(h)

func rotating_attack():
	var added_rotation = PI/10
	for i in 20:
		var b = bullet.instantiate()
		b.rotation = added_rotation
		b.position = self.position + Vector2(-50.0 * sin(b.rotation), 50.0 * cos(b.rotation))
		added_rotation += PI/10
		get_parent().add_child(b)
	
