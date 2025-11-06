extends Node2D

@export var obstacle_scene: PackedScene
@export var scroll_speed = 200.0
@export var spawn_interval = 2.0
@export var min_spawn_interval = 1.0
@export var spawn_x_position = 1400.0
@export var ground_y_position = 600.0

var spawn_timer := 0.0
var obstacles: Array = []
var game_running := true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if not game_running:
		return

	spawn_timer += delta

	# Spawn new obstacles
	if spawn_timer >= spawn_interval:
		spawn_obstacle()
		spawn_timer = 0.0
		# Gradually decrease spawn interval
		spawn_interval = max(min_spawn_interval, spawn_interval - 0.02)

	# Move and clean up obstacles
	for obstacle in obstacles:
		obstacle.position.x -= scroll_speed * delta

		# Remove obstacles that are off screen
		if obstacle.position.x < -100:
			obstacle.queue_free()
			obstacles.erase(obstacle)

func spawn_obstacle() -> void:
	var obstacle := obstacle_scene.instantiate()
	obstacle.position = Vector2(spawn_x_position, ground_y_position - 40)
	add_child(obstacle)
	obstacles.append(obstacle)

	# Connect to player collision
	obstacle.body_entered.connect(_on_obstacle_hit)

func _on_obstacle_hit(body: Node2D) -> void:
	if body.name == "Player":
		# Trigger game over
		get_parent().game_over()

func set_scroll_speed(speed: float) -> void:
	scroll_speed = speed

func stop() -> void:
	game_running = false
