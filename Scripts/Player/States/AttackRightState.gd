extends State

var hitbox_offset := 50

func get_state_name():
	return "AttackRight"

func enter():
	player.animacion_ataque.stop()
	player.animacion_ataque.play("ataque_derecha")
	player.animacion_ataque.seek(0, true)
	player.hitbox.monitoring = true
	player.attack = true
	player.hitbox.scale.x = player.facing_direction
	player.invincible = true
	player.iframe_timer.start()
	

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	var speed = player.run_speed if Input.is_action_pressed("run") else player.walk_speed
	player.velocity.x = move_toward(player.velocity.x, direction * speed, speed * player.acceleration)
	if direction != 0:
		var target_rotation = PI/3 if direction > 0 else -PI/3
		player.player_model.rotation.y = lerp_angle(
			player.player_model.rotation.y,
			target_rotation,
			player.rotation_speed * delta
		)
		if !player.is_on_floor():
			state_machine.change_state($"../AirState")
func exit():
	player.hitbox.monitoring = false
	player.attack = false
	player.invincible = false

func on_attack_finished():
	state_machine.change_state($"../AttackRightState")
