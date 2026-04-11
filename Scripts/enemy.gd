extends Area2D

var is_dead = false



const SPEED = 60
var direction = 2
@onready var camera_2d: Camera2D = $"../Player/Camera2D"

func _process(delta: float) -> void:
	position.x -= direction * SPEED * delta


func _on_hit_area_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	if body.name == "Player":
		is_dead = true
		queue_free()
		




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
