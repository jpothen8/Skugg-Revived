extends Node2D

var timer = 10.0

var skugg = preload("res://scenes/skugg_running.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer -= delta
	if timer > 0.0:
		$RichTextLabel.text = "Skugg is happy now! He wants to play with you in "+ str(round(timer)) + " seconds! Try to tickle him!"
	else:
		$RichTextLabel.text = ""
		if Global.skugg_off_screen:
			var instance = skugg.instantiate()
			instance.visible = true
			add_child(instance)
			Global.skugg_off_screen = false
