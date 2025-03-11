extends Area3D

func _on_body_entered(body):
	if body.name == "Player":
		body.position = Vector3(0, 3, 0)
