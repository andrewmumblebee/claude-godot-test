extends ParallaxBackground

@export var scroll_speed = 100.0

var game_running := true

func _process(delta: float) -> void:
	if not game_running:
		return

	scroll_base_offset.x -= scroll_speed * delta

func set_scroll_speed(speed: float) -> void:
	scroll_speed = speed * 0.5  # Parallax moves slower than foreground

func stop() -> void:
	game_running = false
