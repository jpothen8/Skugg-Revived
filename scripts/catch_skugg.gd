extends Node2D

var timer = 5.0

var skugg = preload("res://scenes/skugg_running.tscn")

var playing_lebron = false
var playing_goat = false
var playing_bing = false

var player_done = false
var finished_game = 0.0

var random = RandomNumberGenerator.new()

var counter = 0

var frames_for_movement = 60

var fullsizeX = DisplayServer.screen_get_size().x
var fullsizeY = DisplayServer.screen_get_size().y

var prevGoal = Vector2i(1152, 648)
var goal = Vector2i(random.randi_range(0.10 * fullsizeX, 0.90 * fullsizeX), random.randi_range(0.10 * fullsizeY, 0.90 * fullsizeY))

var prevGoalPos = Vector2i(50, 50)
var goalPos = Vector2i(random.randi_range(0.0 * fullsizeX, 0.30 * fullsizeX), random.randi_range(0.0 * fullsizeY, 0.30 * fullsizeY))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	get_window().unresizable = true
	get_window().borderless = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	counter += 1
	
	if (counter % frames_for_movement == 0):
		prevGoal = goal
		goal =  Vector2i(random.randi_range(0.10 * fullsizeX, 0.90 * fullsizeX), random.randi_range(0.10 * fullsizeY, 0.90 * fullsizeY))
		prevGoalPos = goalPos
		goalPos = Vector2i(random.randi_range(0.0 * fullsizeX, 0.10 * fullsizeX), random.randi_range(0.0 * fullsizeY, 0.10 * fullsizeY))
		counter = 0
		
	get_window().size = Vector2i(
		roundi(prevGoal.x + (goal.x - prevGoal.x) * (counter / float(frames_for_movement))), 
		roundi(prevGoal.y + (goal.y - prevGoal.y) * (counter / float(frames_for_movement)))
	)
	
	get_window().position = Vector2i(
		roundi(prevGoalPos.x + (goalPos.x - prevGoalPos.x) * (counter / float(frames_for_movement))), 
		roundi(prevGoalPos.y + (goalPos.y - prevGoalPos.y) * (counter / float(frames_for_movement)))
	)
				
	timer -= delta
	if timer > 0.0:
		$RichTextLabel.text = "Skugg is happy now! He wants to play with you in "+ str(round(timer)) + " seconds! Try to tickle him!"
	else:
		if player_done:
			$RichTextLabel.text = "Oh my Skibbity! You got Skugg. Now, do something with a DVD logo..."
			if timer < finished_game - 5.0:
				get_tree().change_scene_to_file("res://scenes/dvd.tscn")
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
			get_window().unresizable = false
			get_window().borderless = false
			get_window().size = Vector2i(1152, 648)
			finished_game = timer
