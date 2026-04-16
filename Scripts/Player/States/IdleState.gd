extends State


func get_state_name():
	return "idle"

func enter():
	player.jumps_left = player.TOTAL_JUMPS

@warning_ignore("unused_parameter")
func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	player.velocity.x = move_toward(player.velocity.x, 0, player.walk_speed * player.deceleration)
	
	if direction != 0:
		player.facing_direction = direction
		state_machine.change_state($"../MoveRunState")
	
	# Jump
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_machine.change_state($"../AirState")
	
	# FastFall
	if Input.is_action_just_pressed("fast_fall") and not player.is_on_floor():
		state_machine.change_state($"../FastFallState")
	
	if Input.is_action_just_pressed("attack_button"):
		state_machine.change_state($"../AttackState")
		
	if Input.is_action_just_pressed("move_left") and Input.is_action_just_pressed("attack_button"):
		state_machine.change_state($"../AttackFleeState")
		
	if Input.is_action_pressed("up") and Input.is_action_just_pressed("attack_button"):
		state_machine.change_state($"../AttackUpState")
		
	if  Input.is_action_pressed("fast_fall") and Input.is_action_just_pressed("attack_button"):
		state_machine.change_state($"../AttackDownState")
	
