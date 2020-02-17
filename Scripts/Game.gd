extends Node2D

export var lives = 3
export var score = 0
var max_score = 0

var new_ball = preload("res://Scenes/Ball.tscn")


func _ready():
	randomize()
	$Score.update_score(score)
	$Lives.update_lives(lives)
	for tile in get_tree().get_nodes_in_group("Tiles"):
		max_score += tile.points

func change_score(s):
	score += s
	$Score.update_score(score)
	#if there are no more tiles, show the winning screen
	if len(get_tree().get_nodes_in_group("Tiles")) == 0:
		get_tree().change_scene("res://Scenes/Win.tscn")

func change_lives(l):
	lives += l
	$Lives.update_lives(lives)
	#if there are no more lives show the game over screen
	if lives <= 0:
		get_tree().change_scene("res://Scenes/GameOver.tscn")

func make_new_ball(pos):
	var ball = new_ball.instance()
	ball.position = pos
	ball.name = "Ball"
	var vector = Vector2(0, -300)
	#choose a random direction, constraining it so we don't get too steep an angle
	if randi()%2:
		vector = vector.rotated(rand_range(PI/6,PI/3))
	else: 
		vector = vector.rotated(rand_range(-PI/3,-PI/6))
	ball.linear_velocity = vector
	add_child(ball)

