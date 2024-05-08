extends Node3D
@onready var screen = $Screen
@onready var override:MeshInstance3D = $"Screen/SCREEN OVVERIDE"
@onready var static_effect = $Screen/STATIC
func change_screen(view:SubViewport):
	var mesh = override.get_mesh()
	var count = mesh.get_surface_count()
	var material:ShaderMaterial = mesh.surface_get_material(0)
	var texture:ViewportTexture = material.get_shader_parameter("view_texture")
	texture.viewport_path = view.get_path()
func on():
	screen.show()
func off():
	screen.hide()
