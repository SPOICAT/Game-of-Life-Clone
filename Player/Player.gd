extends VBoxContainer


export var cell_map_path : NodePath
onready var cell_map = get_node(cell_map_path)


var placing_cells : bool = false


func _on_Simulate_button_down():
	cell_map.simulate()
	

func _on_Paint_toggled(button_pressed):
	placing_cells = button_pressed


func _on_Playstop_toggled(button_pressed):
	if button_pressed:
		cell_map.get_node("SimulationTimer").start()
	else:
		cell_map.get_node("SimulationTimer").stop()


func _input(event):
	if placing_cells:
		if event is InputEventMouseButton:
			var clicked = get_global_mouse_position() * (cell_map.cellmap_size.x / 64) * 4
			clicked = cell_map.world_to_map(clicked)
			print(clicked)
			if Input.is_action_pressed("place_alive_cell"):
				cell_map.set_cell(clicked.x, clicked.y, cell_map.ALIVE_CELL)
			if Input.is_action_pressed("place_dead_cell"):
				cell_map.set_cell(clicked.x, clicked.y, cell_map.DEAD_CELL)
				
