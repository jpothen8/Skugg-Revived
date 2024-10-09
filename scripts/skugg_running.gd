extends CharacterBody2D
		
var rng = RandomNumberGenerator.new()
var speed = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.x = 0
	self.position.y = rng.randf_range(50.0, 600.0)

func _physics_process(delta: float) -> void:
	self.position.x += speed
	
	if (self.position.x > 1200 and self.position.y > 0):
		self.queue_free()
		Global.skugg_off_screen = true


func _on_hitbox_pressed() -> void:
	Global.skugg_pressed = true
