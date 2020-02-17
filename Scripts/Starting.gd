extends Label

export var countdown = 5
onready var Timer = $Timer
onready var Game = get_node("/root/Game")
onready var Paddle = get_node("/root/Game/Paddle")

func _ready():
	if countdown > 0:
		startCountdown(countdown)

func startCountdown(c):
	countdown = c
	if countdown > 0:
		Timer.set_wait_time(1)
		Timer.start()
		text = "Starting in " + str(countdown)


func _on_Timer_timeout():
	countdown -= 1
	if countdown > 0:
		text = "Starting in " + str(countdown)
	else:
		text = ""
		if not Game.has_node("Ball"):
			var pos = Paddle.position - Vector2(0, 32)
			Game.make_new_ball(pos)
		Timer.stop()