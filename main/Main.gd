extends Node

export (PackedScene) var Apple

export (int) var playtime

var level
var time_left
var screensize
var playing = false
var score

func _ready():
	randomize()
	screensize = get_viewport().get_visible_rect().size
	$Player.screensize = screensize
	$Player.hide()
	
	#Conectar señales
	$Player.connect("pickup", self, "_on_Player_pickup")
	$Player.connect("hurt", self, "_on_Player_hurt")
	$HUD.connect("restart_game", self, "new_game")

	
	new_game()

func _on_Player_pickup():
	score += 1
	# Actualiza el score en pantalla
	$HUD.update_score(score)
	
	if $AppleContainer.get_child_count() == 1:
		$HUD.show_message("🎉FELICIDADES COMISTE TODA LA PIZZA!")
		$HUD.show_restart_button()

	
func new_game():
	playing = true
	level = 1
	score = 0
	$HUD.update_score(score)
	time_left = playtime
	$Player.start($PlayerStart.position)
	$Player.show()
	$GameTimer.start()
	apple_spawn()
	
func apple_spawn():
	for i in range(3 + level):
		var apple = Apple.instance()
		$AppleContainer.add_child(apple)
		apple.screensize = screensize
		
		apple.position = Vector2(
			rand_range(0, screensize.x),
			rand_range(0, screensize.y))

func _on_RestartButton_pressed():
	pass # Replace with function body.
