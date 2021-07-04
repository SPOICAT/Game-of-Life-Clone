extends Node2D


func update_drawn_grid():
	$DrawnGrid.rect_size = ($CellMap.cellmap_size * 64) / 4
	$DrawnGrid.rect_scale = 4 * Vector2.ONE
	

func _ready():
	update_drawn_grid()
	get_tree().get_root().connect("size_changed", self, "update_camera")
	

func update_camera():
	$Camera2D.position = get_viewport_rect().size / 2
