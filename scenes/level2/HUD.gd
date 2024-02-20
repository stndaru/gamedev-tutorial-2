extends CanvasLayer

signal start_game


func _ready():
	$Message.hide()
	$StartButton.hide()
	$Image.hide()
	
func show_message(text):
	$Message.text = text
	$Message.show()

func show_game_over():
	show_message("YIPPEEEE")
	$Image.show()
	$StartButton.show()
	
func _on_StartButton_pressed():
	$Message.hide()
	$StartButton.hide()
	$Image.hide()
	emit_signal("start_game")

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip" || body.name == "GreenShip"):
		show_game_over()
