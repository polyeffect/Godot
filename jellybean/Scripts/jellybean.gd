extends RigidBody3D

const Y_KILL_THRESHOLD = -10.0

# Pastel Color
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

# Vivid Color
var vivid_colors := [
	Color8(255, 71, 87),    # 쨍한 레드
	Color8(255, 195, 0),    # 망고옐로우
	Color8(0, 210, 255),    # 시안블루
	Color8(120, 255, 100),  # 형광 연두
	Color8(190, 0, 255),    # 바이올렛
	Color8(255, 115, 185),  # 핑크
	Color8(255, 140, 0),    # 오렌지
	Color8(0, 255, 170),    # 민트
	Color8(255, 255, 0),    # 레몬 옐로우
	Color8(0, 160, 255)     # 파랑
]

func _ready():
	var mesh = $MeshInstance3D
	var mat = StandardMaterial3D.new()
	mat.albedo_color = vivid_colors.pick_random()
	#mat.albedo_color.a = 0.98
	mat.roughness = 0.2
	mat.specular = 0.9
	#mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mesh.material_override = mat

func _physics_process(delta):
	if position.y < Y_KILL_THRESHOLD:
		queue_free()
