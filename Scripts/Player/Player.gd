extends CharacterBody2D

# Velocidades
@export var walk_speed = 650.0
@export var run_speed = 1000.0
@export_range(0, 1) var acceleration = 0.1
@export_range(0, 1) var deceleration = 0.1
@export var rotation_speed = 10.0
@onready var state_label: Label = $StateDebugLabel
@export var jump_force = -400.0
@onready var healthBar: TextureProgressBar = $"../UI/TextureProgressBar"

var health: int
var Maxhealth: int = 3

# Slam
const GROUND_SLAM_SPEED = 1200.0

var jumps_left: int = 0
const TOTAL_JUMPS: int = 2

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Cositas chistosas
@onready var player_model: Node3D = $SubViewport/Node3D/low_poly_prot
@onready var camera_2d: Camera2D = $Camera2D

#State Machine
@onready var state_machine: Node = $StateMachine


func _ready():
	state_machine.init(self)
	health = Maxhealth
	healthBar.max_value = Maxhealth
	healthBar.value = Maxhealth
	
func takeDamage():
	health -= 1
	healthBar.value = health
	
	if healthBar.value == 0:
		get_tree().call_deferred("reload_current_scene")
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	state_machine.physics_update(delta)
	move_and_slide()
	
