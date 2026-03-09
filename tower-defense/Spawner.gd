extends Node3D

@export var enemy_scene: PackedScene
@onready var path: Path3D = $"../Path3D"

var enemies_remaining = 10
var timer: Timer

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	start_wave()

func start_wave():
	timer.wait_time = 1.5
	timer.start()

func spawn_enemy():
	var follow = PathFollow3D.new()
	follow.loop = false
	path.add_child(follow)
	var enemy = enemy_scene.instantiate()
	follow.add_child(enemy)

func _on_timer_timeout():
	if enemies_remaining > 0:
		spawn_enemy()
		enemies_remaining -= 1
	else:
		timer.stop()
