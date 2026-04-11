extends State
@onready var hit_box: Area2D = $"../../HitBox"

var attack_time := 0.2
var timer := 0.0

func enter():
	timer = attack_time
	player.velocity.x *= 0.5
	

func physics_update(delta):
	timer -= delta
	
	var direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = direction * player.walk_speed
	if direction != 0:
		var target_rotation = PI/3 if direction > 0 else -PI/3
		player.player_model.rotation.y = lerp_angle(
			player.player_model.rotation.y,
			target_rotation,
			player.rotation_speed * delta
		)
	if timer <= 0:
		if player.is_on_floor():
			if direction == 0:
				state_machine.change_state($"../IdleState")
			else:
				state_machine.change_state($"../MoveRunState")
		else:
			state_machine.change_state($"../AirState")
			
	
