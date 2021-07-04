extends Node2D


func update_drawn_grid():
	$DrawnGrid.rect_size = $CellMap.cellmap_size * 64
	$DrawnGrid.rect_scale = 4 * Vector2.ONE
	#$DrawnGrid.rect_scale = #Vector2.ONE * ($CellMap.cellmap_size.x / 64) * 4
	

func _ready():
	update_drawn_grid()
