extends Spatial

func vertex_surface():
	# Define all traingles individually
	var vec1 := Vector3(-1, -1, 1)
	var vec2 := Vector3(1, -1, 1)
	var vec3 := Vector3(1, 1, 1)
	var vec4 := Vector3(-1, 1, 1)
	var vec5 := Vector3(-1, 1, 1)
	var vec6 := Vector3(1, -1, -1) 
	var vec7 := Vector3(1, 1, -1)
	var vec8 := Vector3(-1, 1, -1) 
	
	# Define vertex using triangulation
	var vertex := [
		vec7,vec8,vec5,  vec7,vec5,vec6,
		vec4,vec3,vec2,  vec4,vec2,vec1,
		vec8,vec4,vec1,  vec8,vec1,vec5,
		vec3,vec7,vec6,  vec3,vec6,vec2,
		vec8,vec7,vec3,  vec8,vec3,vec4,
		vec1,vec2,vec6,  vec1,vec6,vec5,
	]
	
	return vertex;

func create_cube():
	# Create a mesh and array for mesh
	var cubeMesh := ArrayMesh.new()
	var arrayMesh := [] 
	
	# Resize array mesh for max size
	arrayMesh.resize(Mesh.ARRAY_MAX)
	
	# Get vertex surface
	arrayMesh[Mesh.ARRAY_VERTEX] = PoolVector3Array(vertex_surface())

	# Add surface using array mesh to cube mesh using primitive triangl strip
	cubeMesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLE_STRIP, arrayMesh)
	
	return cubeMesh

func _ready():
	
	# Create new Mesh Instance
	var cube := MeshInstance.new()
	
	# Assign cube mesh
	cube.mesh = create_cube()

	# Add to scene
	add_child(cube)
