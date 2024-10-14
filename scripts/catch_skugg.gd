extends Node2D

var timer = 1.0

var skugg = preload("res://scenes/skugg_running.tscn")

var playing_lebron = false
var playing_goat = false
var playing_bing = false

var player_done = false
var finished_game = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer -= delta
	if timer > 0.0:
		$RichTextLabel.text = "Skugg is happy now! He wants to play with you in "+ str(round(timer)) + " seconds! Try to tickle him!"
	else:
		if player_done:
			$RichTextLabel.text = "Oh my Skibbity! You got Skugg. Now you can play the game!"
			if timer < finished_game - 10.0:
				get_tree().change_scene_to_file("res://scenes/world.tscn")
		elif timer < -50.0:
			$RichTextLabel.text = ""
			$bingchilling.stop()
		elif timer < -40.0:
			$RichTextLabel.text ="'The surest way to win is to not lose' - Sun Tzu, The Art of War"
			if not playing_bing:
				$bingchilling.play()
				playing_bing = true
		elif timer < -35.0:
			$RichTextLabel.text = ""
			$lebron.stop()
		elif timer < -30.0:
			$RichTextLabel.text = "If the 2020 Pistons beat LeBron James, you could definitely beat this."
			if not playing_lebron:
				$lebron.play()
				playing_lebron = true
		elif timer < -27.5:
			$RichTextLabel.text = ""
			$goat.stop()
		elif timer < -20.0:
			$RichTextLabel.text = "This is why Skugg is the GOAT."
			if not playing_goat:
				$goat.play()
				playing_goat = true
		else:
			$RichTextLabel.text = ""
		
		if Global.skugg_off_screen and not player_done:
			var instance = skugg.instantiate()
			instance.visible = true
			add_child(instance)
			Global.skugg_off_screen = false
		if Global.skugg_pressed:
			Global.skugg_pressed = false
			player_done = true
			finished_game = timer
