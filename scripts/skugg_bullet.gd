extends Node2D

var dir = Vector2(1.0,0.0)
var bullet_speed = 10
var bullet_dir = "right"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

			
	
	
	if(bullet_dir == "right"):
		self.position += Vector2(1.0, 0.0).rotated(rotation)
		self.position += dir * delta * bullet_speed
	elif(bullet_dir == "left"):
		self.position -= Vector2(1.0, 0.0).rotated(rotation)
		self.position -= dir * delta * bullet_speed
		
	if($RayCast2D.is_colliding() and not $RayCast2D.get_collider() == null):
		var collide = $RayCast2D.get_collider()
		if($RayCast2D.get_collider()).is_in_group("Enemy"):
			#await get_tree().create_timer(0.25).timeout
			queue_free()
		


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	get_parent().remove_child(self)
	queue_free()

func change_dir(direction):
	if(direction == "right"):
		bullet_dir = "right"
	elif(direction == "left"):
		bullet_dir = "left"
