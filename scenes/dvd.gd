extends Node2D

var fullsizeX = DisplayServer.screen_get_size().x
var fullsizeY = DisplayServer.screen_get_size().y

var velocity = Vector2i(20, 20)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().unresizable = true
	get_window().borderless = true
	
	get_window().size = Vector2i(fullsizeX * 0.35, fullsizeY*0.35)
	print(fullsizeX)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_window().position += velocity
	
	if (get_window().position.y < 0
		or get_window().position.y + get_window().size.y > fullsizeY):
		velocity = Vector2i(velocity.x, -velocity.y)
		
	if (get_window().position.x < 0
		or get_window().position.x + get_window().size.x > fullsizeX):
		velocity = Vector2i(-velocity.x, velocity.y)
