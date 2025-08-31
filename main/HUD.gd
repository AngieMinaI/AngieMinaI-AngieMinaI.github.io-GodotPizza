extends CanvasLayer

signal restart_game

func update_score(value):
	$ScoreLabel.text = "Puntos: %s" % value

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()

func show_restart_button():
	$RestartButton.show()

func _on_RestartButton_pressed():
	$RestartButton.hide()
	hide_message() 
	emit_signal("restart_game")
	
func hide_message():
	$MessageLabel.hide()
