extends CharacterBody2D

@export var speed = 300
@export var chase_speed = 500 
@export var gravedad = 900
@onready var target = $"../Player"
@onready var enemy_model: Node3D = $SubViewport/TV_enemigo
@onready var camera_2d: Camera2D = $"../Player/Camera2D"
@export var is_dead = false
@onready var detection_area: Area2D = $DetectionArea
@onready var enemy_animation: AnimationPlayer = $Enemy_Animation
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var damage_area: Area2D = $DamageArea

var is_player_in_range = false
var is_close_to_player = false
var direction = Vector2.RIGHT


func _physics_process(delta):
	$SubViewport/TV_enemigo.rotation.x = 0
	$SubViewport/TV_enemigo.rotation.z = 0
	if not is_on_floor():
		velocity.y += gravedad * delta
	else:
		velocity.y = 0
	move_and_slide()
	
func on_player_detected(body):
	if body.name == "Player":
		var direction = sign(target.position.x - position.x)
		velocity.x = direction * speed
		is_player_in_range = true
		
func _on_player_lost(body):
	if body.name == "Player":
		
		is_player_in_range = false 
		

func _on_damage_area_entered(body: Node2D) -> void:
	if body.name == "Player":
		enemy_animation.play("ataque")
		if body.has_method("playertakeDamage"):
			body.playertakeDamage()
			camera_2d.screen_shake(5, 0.5)

func _on_death_area_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if is_dead:
		return
	if area.is_in_group("player_attack"):
		is_dead = true
		queue_free()
