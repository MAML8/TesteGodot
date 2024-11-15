extends CharacterBody2D

var speed = 500;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var diry = (1 if Input.is_action_pressed("ui_down") else 0) - (1 if Input.is_action_pressed("ui_up") else 0);
	var dirx = (1 if Input.is_action_pressed("ui_right") else 0) - (1 if Input.is_action_pressed("ui_left") else 0);
	position += Vector2(delta * speed * dirx, delta * speed * diry);
	
