extends RigidBody3D

var pastel_colors = [
	Color8(255, 192, 203),  # 연분홍
	Color8(255, 240, 178),  # 연노랑
	Color8(189, 224, 254),  # 연하늘
	Color8(204, 255, 204),  # 연녹
	Color8(230, 200, 255),  # 연보라
	Color8(255, 220, 200),  # 살구빛
	Color8(255, 255, 240),  # 아이보리
	Color8(240, 255, 255)   # 민트화이트
]

func _ready():
	var mesh = $MeshInstance3D
	var mat = StandardMaterial3D.new()
	mat.albedo_color = pastel_colors.pick_random()
	mat.roughness = 0.3
	mat.specular = 0.8
	mesh.material_override = mat
