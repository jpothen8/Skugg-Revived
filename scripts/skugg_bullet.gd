extends Node2D

var dir = Vector2(1.0,0.0)
var bullet_speed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

			
			
	
	if(Global.bullet_dir == "right"):
		self.position += Vector2(1.0, 0.0).rotated(rotation)
		self.position += dir * delta * bullet_speed
	elif(Global.bullet_dir == "left"):
		self.position -= Vector2(1.0, 0.0).rotated(rotation)
		self.position -= dir * delta * bullet_speed
		
	if($RayCast2D.is_colliding() and not $RayCast2D.get_collider() == null):
		if(($RayCast2D.get_collider()).is_in_group("enemy")):
			print("Hit!")
			queue_free()
		


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	get_parent().remove_child(self)
	queue_free()
