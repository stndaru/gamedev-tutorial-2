extends RigidBody2D

var thrust = Vector2(0, 500)
var torque = 20000
var reset_state = false

#func _process(delta):
	#print("Current Position: ", position)

func _integrate_forces(state):
	if Input.is_action_pressed("ui_up"):
		applied_force = -thrust.rotated(rotation)
	elif Input.is_action_pressed("ui_down"):
		applied_force = thrust.rotated(rotation)
	else:
		applied_force = Vector2()
		
	var rotation_dir = 0
	
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
		
	applied_torque = rotation_dir * torque
	
	if reset_state:
		var t = state.get_transform()   
		t.origin.x = 64
		t.origin.y = 482
		reset_state = false
		
		linear_velocity.y = 0
		linear_velocity.x = 0
		state.set_transform(t)
		
func _reset_ship():
	reset_state = true

func _on_GameplayArea_body_exited(body):
	_reset_ship()

func _on_Button_pressed():
	_reset_ship()

func _on_CanvasLayer_start_game():
	_reset_ship()
