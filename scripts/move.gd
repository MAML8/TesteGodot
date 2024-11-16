extends RigidBody2D

var speed: float = 400;
var raycast: Object;
var interagiu: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	raycast = get_child(2);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var diry = (1 if Input.is_action_pressed("ui_down") || Input.is_key_pressed(KEY_S) else 0) - (1 if Input.is_action_pressed("ui_up") || Input.is_key_pressed(KEY_W) else 0);
	var dirx = (1 if Input.is_action_pressed("ui_right") || Input.is_key_pressed(KEY_D) else 0) - (1 if Input.is_action_pressed("ui_left") || Input.is_key_pressed(KEY_A) else 0);
	var dir = Vector2(dirx, diry);
	linear_velocity = speed * dir;
	
	if dir != Vector2.ZERO:
		raycast.target_position = 100 * dir.normalized();
	
	if Input.is_key_pressed(KEY_SPACE):
		if !interagiu:
			interagiu = true;
			var hit = raycast.get_collider();
			if hit != null && hit.has_method("interact"):
				hit.interact();
	else:
		interagiu = false;
