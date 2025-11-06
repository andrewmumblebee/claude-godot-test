extends Node2D

@onready var player = $Player
@onready var ground_spawner = $GroundSpawner
@onready var obstacle_spawner = $ObstacleSpawner
@onready var parallax_bg = $ParallaxBackground
@onready var score_label = $UI/ScoreLabel
@onready var game_over_panel = $UI/GameOverPanel
@onready var final_score_label = $UI/GameOverPanel/VBoxContainer/FinalScoreLabel
@onready var restart_button = $UI/GameOverPanel/VBoxContainer/RestartButton

var score = 0
var score_timer = 0.0
var game_running = true
var scroll_speed = 200.0

func _ready():
	restart_button.pressed.connect(_on_restart_button_pressed)
	game_over_panel.hide()

	# Initialize parallax background scroll speed
	parallax_bg.set_scroll_speed(scroll_speed)

func _process(delta):
	if not game_running:
		return

	# Update score
	score_timer += delta
	if score_timer >= 0.1:
		score += 1
		score_label.text = "Score: " + str(score)
		score_timer = 0.0

	# Gradually increase difficulty
	if score % 100 == 0 and score > 0:
		scroll_speed += 5
		ground_spawner.set_scroll_speed(scroll_speed)
		obstacle_spawner.set_scroll_speed(scroll_speed)
		parallax_bg.set_scroll_speed(scroll_speed)

func game_over():
	if not game_running:
		return

	game_running = false
	player.die()
	obstacle_spawner.stop()
	parallax_bg.stop()

	# Show game over screen
	final_score_label.text = "Score: " + str(score)
	game_over_panel.show()

func _on_restart_button_pressed():
	get_tree().reload_current_scene()
