extends Node2D

@export var ground_scene: PackedScene
@export var scroll_speed = 200.0
@export var ground_y_position = 600.0

var ground_tiles: Array = []
var tile_width := 200.0

func _ready() -> void:
	# Spawn initial ground tiles
	for i in range(8):
		spawn_ground_tile(i * tile_width)

func _process(delta: float) -> void:
	# Move all ground tiles
	for tile in ground_tiles:
		tile.position.x -= scroll_speed * delta

	# Check if leftmost tile is off screen, recycle it
	if ground_tiles.size() > 0:
		var leftmost := ground_tiles[0]
		if leftmost.position.x < -tile_width:
			var rightmost := ground_tiles[-1]
			leftmost.position.x = rightmost.position.x + tile_width
			ground_tiles.pop_front()
			ground_tiles.append(leftmost)

func spawn_ground_tile(x_position: float) -> void:
	var tile := ground_scene.instantiate()
	tile.position = Vector2(x_position, ground_y_position)
	add_child(tile)
	ground_tiles.append(tile)

func set_scroll_speed(speed: float) -> void:
	scroll_speed = speed
