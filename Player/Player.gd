extends VBoxContainer


export var cell_map_path : NodePath
onready var cell_map = get_node(cell_map_path)


var placing_cells : bool = false


func _on_Simulate_button_down():
	cell_map.simulate()


func _on_Play_button_down():
	cell_map.get_node("SimulationTimer").start()


func _on_Stop_button_down():
	cell_map.get_node("SimulationTimer").stop()


func _on_Place_toggled(button_pressed):
	placing_cells = button_pressed
	

func _input(event):
	if placing_cells:
		if event is InputEventMouseButton:
			var clicked = event.position
			clicked = cell_map.world_to_map(clicked)
			if Input.is_action_pressed("place_alive_cell"):
				cell_map.set_cell(clicked.x, clicked.y, cell_map.ALIVE_CELL)
			if Input.is_action_pressed("place_dead_cell"):
				cell_map.set_cell(clicked.x, clicked.y, cell_map.DEAD_CELL)
				

