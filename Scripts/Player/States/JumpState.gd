extends State
func get_state_name():
	return "Jump"
func enter():
	player.velocity.y = player.jump_force

@warning_ignore("unused_parameter")
func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = direction * player.speed
	
	if player.is_on_floor():
		if direction == 0:
			state_machine.change_state($"../IdleState")
		else:
			state_machine.change_state($"../MoveRunState")
	if Input.is_action_just_pressed("attack_button"):
		state_machine.change_state($"../AttackState")
		
	if Input.is_action_pressed("move_right") and Input.is_action_just_pressed("attack_button"):
		state_machine.change_state($"../AttackRightState")
