extends State
class_name JumpState

var has_left_ground = false

func enter():
	player.velocity.y = player.jump_force
	has_left_ground = false

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = direction * player.walk_speed

	# Detectar cuando realmente saltó
	if not player.is_on_floor():
		has_left_ground = true

	# Solo volver cuando ya estuvo en el aire
	if has_left_ground and player.is_on_floor():
		if direction == 0:
			state_machine.change_state("idlestate")
		else:
			state_machine.change_state("walkstate")
