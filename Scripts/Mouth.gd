extends Sprite

onready var s = scale

func _process(delta):
	var target = get_node("/root/Game/Ball")
	if target:
		var distance = (get_global_position().y - target.get_position().y)/get_viewport().size.y
		distance -= 0.2
		scale.y = s.y * distance
	else:
		scale = s
