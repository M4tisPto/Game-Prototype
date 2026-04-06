extends CharacterBody2D

@export var walk_speed = 650.0
@export var run_speed = 1000.0
@export var acceleration = 0.1
@export var deceleration = 0.1
@export var jump_force = -400.0

const GROUND_SLAM_SPEED = 1200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var state_machine: StateMachine = $StateMachine
@onready var player_model: Node3D = $SubViewport/Node3D/low_poly_prot
@onready var camera_2d: Camera2D = $Camera2D
func _ready():
	for state in state_machine.get_children():
		if state is State:
			state.player = self

func _physics_process(delta):
	# Gravedad
	if not is_on_floor():
		velocity.y += gravity * delta

	# Movimiento final
	move_and_slide()
