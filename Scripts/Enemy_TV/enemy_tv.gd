extends CharacterBody2D

@export var speed = 550
@export var gravedad = 900
@onready var target = $"../Player"
@onready var enemy_model: Node3D = $SubViewport/TV_enemigo
@onready var camera_2d: Camera2D = $"../Player/Camera2D"
@export var is_dead = false

func _physics_process(delta):
	var direction = sign(target.position.x - position.x)
	$SubViewport/TV_enemigo.rotation.x = 0
	$SubViewport/TV_enemigo.rotation.z = 0
	velocity.x = direction * speed
	if not is_on_floor():
		velocity.y += gravedad * delta
	else:
		velocity.y = 0
	move_and_slide()





func _on_damage_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if body.has_method("playertakeDamage"):
			body.playertakeDamage()
			camera_2d.screen_shake(5, 0.5)


func _on_hit_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if is_dead:
		return
	if area.is_in_group("player_attack"):
		is_dead = true
		queue_free()
