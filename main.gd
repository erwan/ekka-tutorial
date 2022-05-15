extends Node

export(PackedScene) var mob_scene

func _ready():
	randomize()

func new_game():
	$Player.start(240, 560)

func _on_MobTimer_timeout():
	var mob = mob_scene.instance()

	mob.position.x = randi() % 240
	mob.position.y = randi() % 560

	var direction = rand_range(-PI / 2, PI / 2)
	mob.rotation = direction

	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	add_child(mob)
