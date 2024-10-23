extends Node

var atlas_dictionary: Dictionary = {
	"black": "res://assets/black_pieces.tres",
	"white": "res://assets/white_pieces.tres",
}

var tile_size: int = 16
var piece_dictionary: Dictionary = {
	"pawn": 0,
	"knight": 1,
	"rook": 2,
	"bishop": 3,
	"queen": 4,
	"king": 5,
}


func _ready() -> void:
	preload("res://assets/black_pieces.tres")
	preload("res://assets/white_pieces.tres")
