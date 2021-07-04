extends Camera2D
class_name Cam


export var cell_map_path : NodePath
onready var cell_map = get_node(cell_map_path)


func _process(_delta):
	position = (cell_map.cellmap_size * 64) / 2
	zoom.x = (cell_map.cellmap_size.x / 64) * 4
	zoom.y = zoom.x
