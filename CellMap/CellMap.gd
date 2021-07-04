extends TileMap

enum {
	ALIVE_CELL,
	DEAD_CELL = -1
}

const directions = [
	Vector2.UP,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.RIGHT,
	Vector2.UP + Vector2.LEFT,
	Vector2.DOWN + Vector2.LEFT,
	Vector2.DOWN + Vector2.RIGHT,
	Vector2.UP + Vector2.RIGHT
]


export var cellmap_size : Vector2


func simulate():
	for x in range(0, cellmap_size.x):
		for y in range(0, cellmap_size.y):
			var neighbors = get_neighbor_cells(x, y)
			var alive_neighbors_count = neighbors.count(ALIVE_CELL)
			
			# rules
			if get_cell(x, y) == ALIVE_CELL:
				# under-population
				if alive_neighbors_count < 2:
					set_cell(x, y, DEAD_CELL)
				# live on
				if alive_neighbors_count == 2 or alive_neighbors_count == 3:
					pass
				# over-population
				if alive_neighbors_count > 3:
					set_cell(x, y, DEAD_CELL)
			elif get_cell(x, y) == DEAD_CELL:
				# reproduction
				if alive_neighbors_count == 3:
					set_cell(x, y, ALIVE_CELL)
				
				
func get_neighbor_cells(x, y):
	var cells = []
	
	for dir in directions.size():
		cells.append(
			get_cellv(
				Vector2(directions[dir]) + 
				Vector2(x, y)
			)
		)
	
	return cells


func _on_SimulationTimer_timeout():
	simulate()
