extends StaticBody3D
var destructable : bool
@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	destructable = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if destructable and Input.is_action_just_pressed("hit"):
		print("boom!")
		anim.play("destroyed")
		await get_tree().create_timer(0.7).timeout
		queue_free()

func _on_destruct_area_body_entered(body):
	destructable = true

func _on_destruct_area_body_exited(body):
	destructable = false
