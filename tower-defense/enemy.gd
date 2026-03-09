extends Node3D

var speed = 3.0
var follow  # declare here so all functions can see it

func _ready():
	follow = get_parent()  # grab it once on start

func _process(delta):
	follow.progress += speed * delta

	if follow.progress_ratio >= 1.0:
		reached_end()

func reached_end():
	follow.queue_free()
