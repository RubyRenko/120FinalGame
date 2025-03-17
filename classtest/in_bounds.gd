extends Area3D
@export var dialogue_resource: DialogueResource = load("res://Talky_Talky_Dialogue/outboundsdia.dialogue")
@export var dialogue_start: String = "start"
var out_of_bounds = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_exited(body):
	if body.name == "Player":
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
		await get_tree().create_timer(3).timeout
		body.position = Vector3(0, 50, 0)
