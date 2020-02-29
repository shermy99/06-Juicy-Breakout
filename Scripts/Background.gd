extends ColorRect


func _ready():
	color = Color(rand_range(0,0.5), rand_range(0,0.5), rand_range(0,0.5),1)


func _on_Timer_timeout():
	color = Color(rand_range(0,0.5), rand_range(0,0.5), rand_range(0,0.5),1)
