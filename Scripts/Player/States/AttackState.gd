extends State

var attack_time := 0.0

const WINDUP = 0.1
const ACTIVE = 0.1
const RECOVERY = 0.2

var attack_dir = "right"

func enter():
	attack_time = 0.0
	player.attack = true
	
	if Input.is_action_pressed("ui_up"):
		attack_dir = "up"
	elif Input.is_action_pressed("ui_down"):
		attack_dir = "down"
	else:
		attack_dir = "right" if player.facing_direction > 0 else "left"

func physics_update(delta):
	attack_time += delta


	if attack_time >= WINDUP and attack_time < WINDUP + ACTIVE:
		activate_hitbox()
		
	else:
		deactivate_hitbox()

	if attack_time >= WINDUP + ACTIVE + RECOVERY:
		if player.is_on_floor():
			state_machine.change_state($"../IdleState")
		else:
			state_machine.change_state($"../AirState")

func exit():
	deactivate_hitbox()
	player.attack = false

func activate_hitbox():
	player.hitbox.scale = Vector2(1.2, 1.2)
	player.hitbox.get_node("AttackCollision").disabled = false

func deactivate_hitbox():
	for child in player.hitbox.get_children():
		if child is CollisionShape2D:
			child.disabled = true
