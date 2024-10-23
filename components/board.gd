extends TileMapLayer

@export var BoardPadding: Vector2i
@export var rows: int
@export var Piece: PackedScene

var sprite_size: int
var sprite_offset: int
var half_rows: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_size = 16
	sprite_offset = ceil(sprite_size / 2.0)
	half_rows = ceil(rows / 2.0)
	_instantiate_squares()
	_instantiate_pieces()


func _instantiate_squares() -> void:
	var square_dimension: int = 1
	for i in rows:
		for j in rows:
			var isWhite = (i + j) % 2 == 0
			var pattern_id: Vector2i
			if isWhite:
				pattern_id = Vector2i(1, 0)
			else:
				pattern_id = Vector2i(0, 0)

			var x_offset = i * square_dimension
			var y_offset = j * square_dimension
			for x in square_dimension:
				for y in square_dimension:
					var coords: Vector2i = Vector2i(
						x + x_offset - half_rows, y + y_offset - half_rows
					)
					self.set_cell(coords, 1, pattern_id, 0)


func _instantiate_pieces() -> void:
	for i in range(-(half_rows) + 1, -(half_rows) - 1, -1):
		for j in range(-half_rows, half_rows, 1):
			var coords = Vector2i(j * sprite_size + sprite_offset, i * sprite_size + sprite_offset)
			var piece = Piece.instantiate()
			piece.position = coords
			add_child(piece)
	for i in range(half_rows - 1, half_rows + 1, 1):
		for j in range(-half_rows, half_rows, 1):
			var coords = Vector2i(j * sprite_size + sprite_offset, i * sprite_size - sprite_offset)
			var piece = Piece.instantiate()
			piece.position = coords
			add_child(piece)
