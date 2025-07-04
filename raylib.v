module raylib

pub const pi = 3.14159265358979323846264338327950288419716939937510582097494459
pub const deg2rad = pi / 180.0
pub const rad2deg = 180.0 / pi

// Some Basic Colors
// NOTE: Custom raylib color palette for amazing visuals on WHITE background
pub const lightgray = Color{200, 200, 200, 255}
pub const gray = Color{130, 130, 130, 255}
pub const darkgray = Color{80, 80, 80, 255}
pub const yellow = Color{253, 249, 0, 255}
pub const gold = Color{255, 203, 0, 255}
pub const orange = Color{255, 161, 0, 255}
pub const pink = Color{255, 109, 194, 255}
pub const red = Color{230, 41, 55, 255}
pub const maroon = Color{190, 33, 55, 255}
pub const green = Color{0, 228, 48, 255}
pub const lime = Color{0, 158, 47, 255}
pub const darkgreen = Color{0, 117, 44, 255}
pub const skyblue = Color{102, 191, 255, 255}
pub const blue = Color{0, 121, 241, 255}
pub const darkblue = Color{0, 82, 172, 255}
pub const purple = Color{200, 122, 255, 255}
pub const violet = Color{135, 60, 190, 255}
pub const darkpurple = Color{112, 31, 126, 255}
pub const beige = Color{211, 176, 131, 255}
pub const brown = Color{127, 106, 79, 255}
pub const darkbrown = Color{76, 63, 47, 255}

pub const white = Color{255, 255, 255, 255}
pub const black = Color{0, 0, 0, 255}
pub const blank = Color{0, 0, 0, 0}
pub const magenta = Color{255, 0, 255, 255}
pub const raywhite = Color{245, 245, 245, 255}

// Structures Definition
pub type Vector2 = C.Vector2

// Vector2, 2 components
pub struct C.Vector2 {
	// Vector x component
	x f32
	// Vector y component
	y f32
}

pub type Vector3 = C.Vector3

// Vector3, 3 components
pub struct C.Vector3 {
	// Vector x component
	x f32
	// Vector y component
	y f32
	// Vector z component
	z f32
}

pub type Vector4 = C.Vector4

// Vector4, 4 components
pub struct C.Vector4 {
	// Vector x component
	x f32
	// Vector y component
	y f32
	// Vector z component
	z f32
	// Vector w component
	w f32
}

// Quaternion, 4 components (Vector4 alias)
pub type Quaternion = C.Vector4

pub type Matrix = C.Matrix

// Matrix, 4x4 components, column major, OpenGL style, right-handed
pub struct C.Matrix {
	// Matrix first row (4 components)
	m0 f32
	// Matrix first row (4 components)
	m4 f32
	// Matrix first row (4 components)
	m8 f32
	// Matrix first row (4 components)
	m12 f32
	// Matrix second row (4 components)
	m1 f32
	// Matrix second row (4 components)
	m5 f32
	// Matrix second row (4 components)
	m9 f32
	// Matrix second row (4 components)
	m13 f32
	// Matrix third row (4 components)
	m2 f32
	// Matrix third row (4 components)
	m6 f32
	// Matrix third row (4 components)
	m10 f32
	// Matrix third row (4 components)
	m14 f32
	// Matrix fourth row (4 components)
	m3 f32
	// Matrix fourth row (4 components)
	m7 f32
	// Matrix fourth row (4 components)
	m11 f32
	// Matrix fourth row (4 components)
	m15 f32
}

pub type Color = C.Color

// Color, 4 components, R8G8B8A8 (32bit)
pub struct C.Color {
	// Color red value
	r u8
	// Color green value
	g u8
	// Color blue value
	b u8
	// Color alpha value
	a u8
}

pub type Rectangle = C.Rectangle

// Rectangle, 4 components
pub struct C.Rectangle {
	// Rectangle top-left corner position x
	x f32
	// Rectangle top-left corner position y
	y f32
	// Rectangle width
	width f32
	// Rectangle height
	height f32
}

pub type Image = C.Image

// Image, pixel data stored in CPU memory (RAM)
pub struct C.Image {
	// Image raw data
	data voidptr
	// Image base width
	width int
	// Image base height
	height int
	// Mipmap levels, 1 by default
	mipmaps int
	// Data format (PixelFormat type)
	format int
}

pub type Texture = C.Texture

// Texture, tex data stored in GPU memory (VRAM)
pub struct C.Texture {
	// OpenGL texture id
	id u32
	// Texture base width
	width int
	// Texture base height
	height int
	// Mipmap levels, 1 by default
	mipmaps int
	// Data format (PixelFormat type)
	format int
}

// Texture2D, same as Texture
pub type Texture2D = C.Texture

// TextureCubemap, same as Texture
pub type TextureCubemap = C.Texture

pub type RenderTexture = C.RenderTexture

// RenderTexture, fbo for texture rendering
pub struct C.RenderTexture {
	// OpenGL framebuffer object id
	id u32
	// Color buffer attachment texture
	texture Texture
	// Depth buffer attachment texture
	depth Texture
}

// RenderTexture2D, same as RenderTexture
pub type RenderTexture2D = C.RenderTexture

// NPatchInfo, n-patch layout info
pub struct C.NPatchInfo {
	// Texture source rectangle
	source Rectangle
	// Left border offset
	left int
	// Top border offset
	top int
	// Right border offset
	right int
	// Bottom border offset
	bottom int
	// Layout of the n-patch: 3x3, 1x3 or 3x1
	layout int
}

pub type GlyphInfo = C.GlyphInfo

// GlyphInfo, font characters glyphs info
pub struct C.GlyphInfo {
	// Character value (Unicode)
	value int
	// Character offset X when drawing
	offset_x int
	// Character offset Y when drawing
	offset_y int
	// Character advance position X
	advance_x int
	// Character image data
	image Image
}

pub type Font = C.Font

// Font, font texture and GlyphInfo array data
pub struct C.Font {
	// Base size (default chars height)
	base_size int
	// Number of glyph characters
	glyph_count int
	// Padding around the glyph characters
	glyph_padding int
	// Texture atlas containing the glyphs
	texture Texture2D
	// Rectangles in texture for the glyphs
	recs &Rectangle
	// Glyphs info data
	glyphs &GlyphInfo
}

pub type Camera3D = C.Camera3D

// Camera, defines position/orientation in 3d space
pub struct C.Camera3D {
	// Camera position
	position Vector3
	// Camera target it looks-at
	target Vector3
	// Camera up vector (rotation over its axis)
	up Vector3
	// Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
	fovy f32
	// Camera projection: CAMERA_PERSPECTIVE (0) or CAMERA_ORTHOGRAPHIC (1)
	projection int
}

// Camera type fallback, defaults to Camera3D
pub type Camera = C.Camera3D

pub type Camera2D = C.Camera2D

// Camera2D, defines position/orientation in 2d space
pub struct C.Camera2D {
	// Camera offset (displacement from target)
	offset Vector2
	// Camera target (rotation and zoom origin)
	target Vector2
	// Camera rotation in degrees
	rotation f32
	// Camera zoom (scaling), should be 1.0f by default
	zoom f32
}

// Mesh, vertex data and vao/vbo
pub struct C.Mesh {
	// Number of vertices stored in arrays
	vertex_count int
	// Number of triangles stored (indexed or not)
	triangle_count int
	// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
	vertices &f32
	// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
	texcoords &f32
	// Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
	texcoords2 &f32
	// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
	normals &f32
	// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
	tangents &f32
	// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
	colors &u8
	// Vertex indices (in case vertex data comes indexed)
	indices &u16
	// Animated vertex positions (after bones transformations)
	anim_vertices &f32
	// Animated normals (after bones transformations)
	anim_normals &f32
	// Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning) (shader-location = 6)
	bone_ids &u8
	// Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)
	bone_weights &f32
	// Bones animated transformation matrices
	bone_matrices &Matrix
	// Number of bones
	bone_count int
	// OpenGL Vertex Array Object id
	vao_id u32
	// OpenGL Vertex Buffer Objects id (default vertex data)
	vbo_id &u32
}

pub type Shader = C.Shader

// Shader
pub struct C.Shader {
	// Shader program id
	id u32
	// Shader locations array (RL_MAX_SHADER_LOCATIONS)
	locs &int
}

pub type MaterialMap = C.MaterialMap

// MaterialMap
pub struct C.MaterialMap {
	// Material map texture
	texture Texture2D
	// Material map color
	color Color
	// Material map value
	value f32
}

pub type Material = C.Material

// Material, includes shader and maps
pub struct C.Material {
	// Material shader
	shader Shader
	// Material maps array (MAX_MATERIAL_MAPS)
	maps &MaterialMap
	// Material generic parameters (if required)
	params [4]f32
}

pub type Transform = C.Transform

// Transform, vertex transformation data
pub struct C.Transform {
	// Translation
	translation Vector3
	// Rotation
	rotation Quaternion
	// Scale
	scale Vector3
}

pub type BoneInfo = C.BoneInfo

// Bone, skeletal animation bone
pub struct C.BoneInfo {
	// Bone name
	name [32]char
	// Bone parent
	parent int
}

pub type Model = C.Model

// Model, meshes, materials and animation data
pub struct C.Model {
	// Local transform matrix
	transform Matrix
	// Number of meshes
	mesh_count int
	// Number of materials
	material_count int
	// Meshes array
	meshes &Mesh
	// Materials array
	materials &Material
	// Mesh material number
	mesh_material &int
	// Number of bones
	bone_count int
	// Bones information (skeleton)
	bones &BoneInfo
	// Bones base transformation (pose)
	bind_pose &Transform
}

pub type ModelAnimation = C.ModelAnimation

// ModelAnimation
pub struct C.ModelAnimation {
	// Number of bones
	bone_count int
	// Number of animation frames
	frame_count int
	// Bones information (skeleton)
	bones &BoneInfo
	// Poses array by frame
	frame_poses &&Transform
	// Animation name
	name [32]char
}

pub type Ray = C.Ray

// Ray, ray for raycasting
pub struct C.Ray {
	// Ray position (origin)
	position Vector3
	// Ray direction (normalized)
	direction Vector3
}

pub type RayCollision = C.RayCollision

// RayCollision, ray hit information
pub struct C.RayCollision {
	// Did the ray hit something?
	hit bool
	// Distance to the nearest hit
	distance f32
	// Point of the nearest hit
	point Vector3
	// Surface normal of hit
	normal Vector3
}

pub type BoundingBox = C.BoundingBox

// BoundingBox
pub struct C.BoundingBox {
	// Minimum vertex box-corner
	min Vector3
	// Maximum vertex box-corner
	max Vector3
}

pub type Wave = C.Wave

// Wave, audio wave data
pub struct C.Wave {
	// Total number of frames (considering channels)
	frame_count u32
	// Frequency (samples per second)
	sample_rate u32
	// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	sample_size u32
	// Number of channels (1-mono, 2-stereo, ...)
	channels u32
	// Buffer data pointer
	data voidptr
}

// Opaque structs declaration
// NOTE: Actual structs are defined internally in raudio module
pub struct C.rAudioBuffer {}

pub type AudioBuffer = C.rAudioBuffer

pub struct C.rAudioProcessor {}

pub type AudioProcessor = C.rAudioProcessor

pub type AudioStream = C.AudioStream

// AudioStream, custom audio stream
pub struct C.AudioStream {
	// Pointer to internal data used by the audio system
	buffer &AudioBuffer
	// Pointer to internal data processor, useful for audio effects
	processor &AudioProcessor
	// Frequency (samples per second)
	sample_rate u32
	// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	sample_size u32
	// Number of channels (1-mono, 2-stereo, ...)
	channels u32
}

pub type Sound = C.Sound

// Sound
pub struct C.Sound {
	// Audio stream
	stream AudioStream
	// Total number of frames (considering channels)
	frame_count u32
}

pub type Music = C.Music

// Music, audio stream, anything longer than ~10 seconds should be streamed
pub struct C.Music {
	// Audio stream
	stream AudioStream
	// Total number of frames (considering channels)
	frame_count u32
	// Music looping enable
	looping bool
	// Type of music context (audio filetype)
	ctx_type int
	// Audio context data, depends on type
	ctx_data voidptr
}

pub type VrDeviceInfo = C.VrDeviceInfo

// VrDeviceInfo, Head-Mounted-Display device parameters
pub struct C.VrDeviceInfo {
	// Horizontal resolution in pixels
	h_resolution int
	// Vertical resolution in pixels
	v_resolution int
	// Horizontal size in meters
	h_screen_size f32
	// Vertical size in meters
	v_screen_size f32
	// Distance between eye and display in meters
	eye_to_screen_distance f32
	// Lens separation distance in meters
	lens_separation_distance f32
	// IPD (distance between pupils) in meters
	interpupillary_distance f32
	// Lens distortion constant parameters
	lens_distortion_values [4]f32
	// Chromatic aberration correction parameters
	chroma_ab_correction [4]f32
}

pub type VrStereoConfig = C.VrStereoConfig

// VrStereoConfig, VR stereo rendering configuration for simulator
pub struct C.VrStereoConfig {
	// VR projection matrices (per eye)
	projection [2]Matrix
	// VR view offset matrices (per eye)
	view_offset [2]Matrix
	// VR left lens center
	left_lens_center [2]f32
	// VR right lens center
	right_lens_center [2]f32
	// VR left screen center
	left_screen_center [2]f32
	// VR right screen center
	right_screen_center [2]f32
	// VR distortion scale
	scale [2]f32
	// VR distortion scale in
	scale_in [2]f32
}

pub type FilePathList = C.FilePathList

// File path list
pub struct C.FilePathList {
	// Filepaths max entries
	capacity u32
	// Filepaths entries count
	count u32
	// Filepaths entries
	paths &&char
}

pub type AutomationEvent = C.AutomationEvent

// Automation event
pub struct C.AutomationEvent {
	// Event frame
	frame u32
	// Event type (AutomationEventType)
	typ u32
	// Event parameters (if required)
	params [4]int
}

pub type AutomationEventList = C.AutomationEventList

// Automation event list
pub struct C.AutomationEventList {
	// Events max entries (MAX_AUTOMATION_EVENTS)
	capacity u32
	// Events entries count
	count u32
	// Events entries
	events &AutomationEvent
}

// Enumerators Definition
// System/Window config flags
// NOTE: Every bit registers one state (use it with bit masks)
// By default all flags are set to 0
@[flag]
pub enum ConfigFlags as u32 {
	flag_unused_1                 // 0x00000001
	flag_fullscreen_mode          // Set to run program in fullscreen, 0x00000002
	flag_window_resizable         // Set to allow resizable window, 0x00000004
	flag_window_undecorated       // Set to disable window decoration (frame and buttons), 0x00000008
	flag_window_transparent       // Set to allow transparent framebuffer, 0x00000010
	flag_msaa_4x_hint             // Set to try enabling MSAA 4X, 0x00000020
	flag_vsync_hint               // Set to try enabling V-Sync on GPU, 0x00000040
	flag_window_hidden            // Set to hide window, 0x00000080
	flag_window_always_run        // Set to allow windows running while minimized, 0x00000100
	flag_window_minimized         // Set to minimize window (iconify), 0x00000200
	flag_window_maximized         // Set to maximize window (expanded to monitor), 0x00000400
	flag_window_unfocused         // Set to window non focused, 0x00000800
	flag_window_topmost           // Set to window always on top, 0x00001000
	flag_window_highdpi           // Set to support HighDPI, 0x00002000
	flag_window_mouse_passthrough // Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED, 0x00004000
	flag_borderless_windowed_mode // Set to run program in borderless windowed mode, 0x00008000
	flag_interlaced_hint          // Set to try enabling interlaced video format (for V3D), 0x00010000
}

// TODO

// TraceLogLevel
pub const log_all = 0
pub const log_trace = 1
pub const log_debug = 2
pub const log_info = 3
pub const log_warning = 4
pub const log_error = 5
pub const log_fatal = 6
pub const log_none = 7
// KeyboardKey
pub const key_null = 0
pub const key_apostrophe = 39
pub const key_comma = 44
pub const key_minus = 45
pub const key_period = 46
pub const key_slash = 47
pub const key_zero = 48
pub const key_one = 49
pub const key_two = 50
pub const key_three = 51
pub const key_four = 52
pub const key_five = 53
pub const key_six = 54
pub const key_seven = 55
pub const key_eight = 56
pub const key_nine = 57
pub const key_semicolon = 59
pub const key_equal = 61
pub const key_a = 65
pub const key_b = 66
pub const key_c = 67
pub const key_d = 68
pub const key_e = 69
pub const key_f = 70
pub const key_g = 71
pub const key_h = 72
pub const key_i = 73
pub const key_j = 74
pub const key_k = 75
pub const key_l = 76
pub const key_m = 77
pub const key_n = 78
pub const key_o = 79
pub const key_p = 80
pub const key_q = 81
pub const key_r = 82
pub const key_s = 83
pub const key_t = 84
pub const key_u = 85
pub const key_v = 86
pub const key_w = 87
pub const key_x = 88
pub const key_y = 89
pub const key_z = 90
pub const key_left_bracket = 91
pub const key_backslash = 92
pub const key_right_bracket = 93
pub const key_grave = 96
pub const key_space = 32
pub const key_escape = 256
pub const key_enter = 257
pub const key_tab = 258
pub const key_backspace = 259
pub const key_insert = 260
pub const key_delete = 261
pub const key_right = 262
pub const key_left = 263
pub const key_down = 264
pub const key_up = 265
pub const key_page_up = 266
pub const key_page_down = 267
pub const key_home = 268
pub const key_end = 269
pub const key_caps_lock = 280
pub const key_scroll_lock = 281
pub const key_num_lock = 282
pub const key_print_screen = 283
pub const key_pause = 284
pub const key_f1 = 290
pub const key_f2 = 291
pub const key_f3 = 292
pub const key_f4 = 293
pub const key_f5 = 294
pub const key_f6 = 295
pub const key_f7 = 296
pub const key_f8 = 297
pub const key_f9 = 298
pub const key_f10 = 299
pub const key_f11 = 300
pub const key_f12 = 301
pub const key_left_shift = 340
pub const key_left_control = 341
pub const key_left_alt = 342
pub const key_left_super = 343
pub const key_right_shift = 344
pub const key_right_control = 345
pub const key_right_alt = 346
pub const key_right_super = 347
pub const key_kb_menu = 348
pub const key_kp_0 = 320
pub const key_kp_1 = 321
pub const key_kp_2 = 322
pub const key_kp_3 = 323
pub const key_kp_4 = 324
pub const key_kp_5 = 325
pub const key_kp_6 = 326
pub const key_kp_7 = 327
pub const key_kp_8 = 328
pub const key_kp_9 = 329
pub const key_kp_decimal = 330
pub const key_kp_divide = 331
pub const key_kp_multiply = 332
pub const key_kp_subtract = 333
pub const key_kp_add = 334
pub const key_kp_enter = 335
pub const key_kp_equal = 336
pub const key_back = 4
pub const key_menu = 82
pub const key_volume_up = 24
pub const key_volume_down = 25
// MouseButton
pub const mouse_button_left = 0
pub const mouse_button_right = 1
pub const mouse_button_middle = 2
pub const mouse_button_side = 3
pub const mouse_button_extra = 4
pub const mouse_button_forward = 5
pub const mouse_button_back = 6
// MouseCursor
pub const mouse_cursor_default = 0
pub const mouse_cursor_arrow = 1
pub const mouse_cursor_ibeam = 2
pub const mouse_cursor_crosshair = 3
pub const mouse_cursor_pointing_hand = 4
pub const mouse_cursor_resize_ew = 5
pub const mouse_cursor_resize_ns = 6
pub const mouse_cursor_resize_nwse = 7
pub const mouse_cursor_resize_nesw = 8
pub const mouse_cursor_resize_all = 9
pub const mouse_cursor_not_allowed = 10
// GamepadButton
pub const gamepad_button_unknown = 0
pub const gamepad_button_left_face_up = 1
pub const gamepad_button_left_face_right = 2
pub const gamepad_button_left_face_down = 3
pub const gamepad_button_left_face_left = 4
pub const gamepad_button_right_face_up = 5
pub const gamepad_button_right_face_right = 6
pub const gamepad_button_right_face_down = 7
pub const gamepad_button_right_face_left = 8
pub const gamepad_button_left_trigger_1 = 9
pub const gamepad_button_left_trigger_2 = 10
pub const gamepad_button_right_trigger_1 = 11
pub const gamepad_button_right_trigger_2 = 12
pub const gamepad_button_middle_left = 13
pub const gamepad_button_middle = 14
pub const gamepad_button_middle_right = 15
pub const gamepad_button_left_thumb = 16
pub const gamepad_button_right_thumb = 17
// GamepadAxis
pub const gamepad_axis_left_x = 0
pub const gamepad_axis_left_y = 1
pub const gamepad_axis_right_x = 2
pub const gamepad_axis_right_y = 3
pub const gamepad_axis_left_trigger = 4
pub const gamepad_axis_right_trigger = 5
// MaterialMapIndex
pub const material_map_albedo = 0
pub const material_map_metalness = 1
pub const material_map_normal = 2
pub const material_map_roughness = 3
pub const material_map_occlusion = 4
pub const material_map_emission = 5
pub const material_map_height = 6
pub const material_map_cubemap = 7
pub const material_map_irradiance = 8
pub const material_map_prefilter = 9
pub const material_map_brdf = 10
// ShaderLocationIndex
pub const shader_loc_vertex_position = 0
pub const shader_loc_vertex_texcoord01 = 1
pub const shader_loc_vertex_texcoord02 = 2
pub const shader_loc_vertex_normal = 3
pub const shader_loc_vertex_tangent = 4
pub const shader_loc_vertex_color = 5
pub const shader_loc_matrix_mvp = 6
pub const shader_loc_matrix_view = 7
pub const shader_loc_matrix_projection = 8
pub const shader_loc_matrix_model = 9
pub const shader_loc_matrix_normal = 10
pub const shader_loc_vector_view = 11
pub const shader_loc_color_diffuse = 12
pub const shader_loc_color_specular = 13
pub const shader_loc_color_ambient = 14
pub const shader_loc_map_albedo = 15
pub const shader_loc_map_metalness = 16
pub const shader_loc_map_normal = 17
pub const shader_loc_map_roughness = 18
pub const shader_loc_map_occlusion = 19
pub const shader_loc_map_emission = 20
pub const shader_loc_map_height = 21
pub const shader_loc_map_cubemap = 22
pub const shader_loc_map_irradiance = 23
pub const shader_loc_map_prefilter = 24
pub const shader_loc_map_brdf = 25
// ShaderUniformDataType
pub const shader_uniform_float = 0
pub const shader_uniform_vec2 = 1
pub const shader_uniform_vec3 = 2
pub const shader_uniform_vec4 = 3
pub const shader_uniform_int = 4
pub const shader_uniform_ivec2 = 5
pub const shader_uniform_ivec3 = 6
pub const shader_uniform_ivec4 = 7
pub const shader_uniform_sampler2d = 8
// ShaderAttributeDataType
pub const shader_attrib_float = 0
pub const shader_attrib_vec2 = 1
pub const shader_attrib_vec3 = 2
pub const shader_attrib_vec4 = 3
// PixelFormat
pub const pixelformat_uncompressed_grayscale = 1
pub const pixelformat_uncompressed_gray_alpha = 2
pub const pixelformat_uncompressed_r5g6b5 = 3
pub const pixelformat_uncompressed_r8g8b8 = 4
pub const pixelformat_uncompressed_r5g5b5a1 = 5
pub const pixelformat_uncompressed_r4g4b4a4 = 6
pub const pixelformat_uncompressed_r8g8b8a8 = 7
pub const pixelformat_uncompressed_r32 = 8
pub const pixelformat_uncompressed_r32g32b32 = 9
pub const pixelformat_uncompressed_r32g32b32a32 = 10
pub const pixelformat_compressed_dxt1_rgb = 11
pub const pixelformat_compressed_dxt1_rgba = 12
pub const pixelformat_compressed_dxt3_rgba = 13
pub const pixelformat_compressed_dxt5_rgba = 14
pub const pixelformat_compressed_etc1_rgb = 15
pub const pixelformat_compressed_etc2_rgb = 16
pub const pixelformat_compressed_etc2_eac_rgba = 17
pub const pixelformat_compressed_pvrt_rgb = 18
pub const pixelformat_compressed_pvrt_rgba = 19
pub const pixelformat_compressed_astc_4x4_rgba = 20
pub const pixelformat_compressed_astc_8x8_rgba = 21
// TextureFilter
pub const texture_filter_point = 0
pub const texture_filter_bilinear = 1
pub const texture_filter_trilinear = 2
pub const texture_filter_anisotropic_4x = 3
pub const texture_filter_anisotropic_8x = 4
pub const texture_filter_anisotropic_16x = 5
// TextureWrap
pub const texture_wrap_repeat = 0
pub const texture_wrap_clamp = 1
pub const texture_wrap_mirror_repeat = 2
pub const texture_wrap_mirror_clamp = 3
// CubemapLayout
pub const cubemap_layout_auto_detect = 0
pub const cubemap_layout_line_vertical = 1
pub const cubemap_layout_line_horizontal = 2
pub const cubemap_layout_cross_three_by_four = 3
pub const cubemap_layout_cross_four_by_three = 4
pub const cubemap_layout_panorama = 5
// FontType
pub const font_default = 0
pub const font_bitmap = 1
pub const font_sdf = 2
// BlendMode
pub const blend_alpha = 0
pub const blend_additive = 1
pub const blend_multiplied = 2
pub const blend_add_colors = 3
pub const blend_subtract_colors = 4
pub const blend_alpha_premultiply = 5
pub const blend_custom = 6
// Gesture
pub const gesture_none = 0
pub const gesture_tap = 1
pub const gesture_doubletap = 2
pub const gesture_hold = 4
pub const gesture_drag = 8
pub const gesture_swipe_right = 16
pub const gesture_swipe_left = 32
pub const gesture_swipe_up = 64
pub const gesture_swipe_down = 128
pub const gesture_pinch_in = 256
pub const gesture_pinch_out = 512
// CameraMode
pub const camera_custom = 0
pub const camera_free = 1
pub const camera_orbital = 2
pub const camera_first_person = 3
pub const camera_third_person = 4
// CameraProjection
pub const camera_perspective = 0
pub const camera_orthographic = 1
// NPatchLayout
pub const npatch_nine_patch = 0
pub const npatch_three_patch_vertical = 1
pub const npatch_three_patch_horizontal = 2

// end enums

// start structs
@[typedef]
struct C.Vector2 {
pub mut:
	x f32
	y f32
}

pub type Vector2 = C.Vector2

@[typedef]
struct C.Vector3 {
pub mut:
	x f32
	y f32
	z f32
}

pub type Vector3 = C.Vector3

@[typedef]
struct C.Vector4 {
pub mut:
	x f32
	y f32
	z f32
	w f32
}

pub type Vector4 = C.Vector4

@[typedef]
struct C.Matrix {
pub mut:
	m0  f32
	m4  f32
	m8  f32
	m12 f32
	m1  f32
	m5  f32
	m9  f32
	m13 f32
	m2  f32
	m6  f32
	m10 f32
	m14 f32
	m3  f32
	m7  f32
	m11 f32
	m15 f32
}

pub type Matrix = C.Matrix

@[typedef]
struct C.Color {
pub mut:
	r u8
	g u8
	b u8
	a u8
}

pub type Color = C.Color

@[typedef]
struct C.Rectangle {
pub mut:
	x      f32
	y      f32
	width  f32
	height f32
}

pub type Rectangle = C.Rectangle

@[typedef]
struct C.Image {
pub mut:
	data    voidptr
	width   int
	height  int
	mipmaps int
	format  int
}

pub type Image = C.Image

@[typedef]
struct C.Texture {
pub mut:
	id      u32
	width   int
	height  int
	mipmaps int
	format  int
}

pub type Texture = C.Texture

@[typedef]
struct C.RenderTexture {
pub mut:
	id      u32
	texture Texture
	depth   Texture
}

pub type RenderTexture = C.RenderTexture

@[typedef]
struct C.NPatchInfo {
pub mut:
	source Rectangle
	left   int
	top    int
	right  int
	bottom int
	layout int
}

pub type NPatchInfo = C.NPatchInfo

@[typedef]
struct C.GlyphInfo {
pub mut:
	value    int
	offsetX  int
	offsetY  int
	advanceX int
	image    Image
}

pub type GlyphInfo = C.GlyphInfo

@[typedef]
struct C.Font {
pub mut:
	baseSize     int
	glyphCount   int
	glyphPadding int
	texture      Texture2D
	recs         &Rectangle
	glyphs       &GlyphInfo
}

pub type Font = C.Font

@[typedef]
struct C.Camera3D {
pub mut:
	position   Vector3
	target     Vector3
	up         Vector3
	fovy       f32
	projection int
}

pub type Camera3D = C.Camera3D

@[typedef]
struct C.Camera2D {
pub mut:
	offset   Vector2
	target   Vector2
	rotation f32
	zoom     f32
}

pub type Camera2D = C.Camera2D

@[typedef]
struct C.Mesh {
pub mut:
	vertexCount   int
	triangleCount int
	vertices      &f32
	texcoords     &f32
	texcoords2    &f32
	normals       &f32
	tangents      &f32
	colors        &u8
	indices       &u16
	animVertices  &f32
	animNormals   &f32
	boneIds       &u8
	boneWeights   &f32
	vaoId         u32
	vboId         &u32
}

pub type Mesh = C.Mesh

@[typedef]
struct C.Shader {
pub mut:
	id   u32
	locs &int
}

pub type Shader = C.Shader

@[typedef]
struct C.MaterialMap {
pub mut:
	texture Texture2D
	color   Color
	value   f32
}

pub type MaterialMap = C.MaterialMap

@[typedef]
struct C.Material {
pub mut:
	shader Shader
	maps   &MaterialMap
	params [4]f32
}

pub type Material = C.Material

@[typedef]
struct C.Transform {
pub mut:
	translation Vector3
	rotation    Quaternion
	scale       Vector3
}

pub type Transform = C.Transform

@[typedef]
struct C.BoneInfo {
pub mut:
	name   [32]i8
	parent int
}

pub type BoneInfo = C.BoneInfo

@[typedef]
struct C.Model {
pub mut:
	transform     Matrix
	meshCount     int
	materialCount int
	meshes        &Mesh
	materials     &Material
	meshMaterial  &int
	boneCount     int
	bones         &BoneInfo
	bindPose      &Transform
}

pub type Model = C.Model

@[typedef]
struct C.ModelAnimation {
pub mut:
	boneCount  int
	frameCount int
	bones      &BoneInfo
	framePoses &&Transform
}

pub type ModelAnimation = C.ModelAnimation

@[typedef]
struct C.Ray {
pub mut:
	position  Vector3
	direction Vector3
}

pub type Ray = C.Ray

@[typedef]
struct C.RayCollision {
pub mut:
	hit      bool
	distance f32
	point    Vector3
	normal   Vector3
}

pub type RayCollision = C.RayCollision

@[typedef]
struct C.BoundingBox {
pub mut:
	min Vector3
	max Vector3
}

pub type BoundingBox = C.BoundingBox

@[typedef]
struct C.Wave {
pub mut:
	frameCount u32
	sampleRate u32
	sampleSize u32
	channels   u32
	data       voidptr
}

pub type Wave = C.Wave

@[typedef]
struct C.AudioStream {
pub mut:
	buffer     voidptr
	processor  voidptr
	sampleRate u32
	sampleSize u32
	channels   u32
}

pub type AudioStream = C.AudioStream

@[typedef]
struct C.Sound {
pub mut:
	stream     AudioStream
	frameCount u32
}

pub type Sound = C.Sound

@[typedef]
struct C.Music {
pub mut:
	stream     AudioStream
	frameCount u32
	looping    bool
	ctxType    int
	ctxData    voidptr
}

pub type Music = C.Music

@[typedef]
struct C.VrDeviceInfo {
pub mut:
	hResolution            int
	vResolution            int
	hScreenSize            f32
	vScreenSize            f32
	vScreenCenter          f32
	eyeToScreenDistance    f32
	lensSeparationDistance f32
	interpupillaryDistance f32
	lensDistortionValues   [4]f32
	chromaAbCorrection     [4]f32
}

pub type VrDeviceInfo = C.VrDeviceInfo

@[typedef]
struct C.VrStereoConfig {
pub mut:
	projection        [2]Matrix
	viewOffset        [2]Matrix
	leftLensCenter    [2]f32
	rightLensCenter   [2]f32
	leftScreenCenter  [2]f32
	rightScreenCenter [2]f32
	scale             [2]f32
	scaleIn           [2]f32
}

pub type VrStereoConfig = C.VrStereoConfig

@[typedef]
struct C.FilePathList {
pub mut:
	capacity u32
	count    u32
	paths    &&i8
}

pub type FilePathList = C.FilePathList

// end structs
// start aliases
pub type Quaternion = C.Vector4
pub type Texture2D = C.Texture
pub type TextureCubemap = C.Texture
pub type RenderTexture2D = C.RenderTexture
pub type Camera = C.Camera3D

// end aliases
// start functions
fn C.InitWindow(width int, height int, title &i8)
@[inline]
pub fn init_window(width int, height int, title &i8) {
	C.InitWindow(width, height, title)
}

fn C.WindowShouldClose() bool
@[inline]
pub fn window_should_close() bool {
	return C.WindowShouldClose()
}

fn C.CloseWindow()
@[inline]
pub fn close_window() {
	C.CloseWindow()
}

fn C.IsWindowReady() bool
@[inline]
pub fn is_window_ready() bool {
	return C.IsWindowReady()
}

fn C.IsWindowFullscreen() bool
@[inline]
pub fn is_window_fullscreen() bool {
	return C.IsWindowFullscreen()
}

fn C.IsWindowHidden() bool
@[inline]
pub fn is_window_hidden() bool {
	return C.IsWindowHidden()
}

fn C.IsWindowMinimized() bool
@[inline]
pub fn is_window_minimized() bool {
	return C.IsWindowMinimized()
}

fn C.IsWindowMaximized() bool
@[inline]
pub fn is_window_maximized() bool {
	return C.IsWindowMaximized()
}

fn C.IsWindowFocused() bool
@[inline]
pub fn is_window_focused() bool {
	return C.IsWindowFocused()
}

fn C.IsWindowResized() bool
@[inline]
pub fn is_window_resized() bool {
	return C.IsWindowResized()
}

fn C.IsWindowState(flag u32) bool
@[inline]
pub fn is_window_state(flag u32) bool {
	return C.IsWindowState(flag)
}

fn C.SetWindowState(flags u32)
@[inline]
pub fn set_window_state(flags u32) {
	C.SetWindowState(flags)
}

fn C.ClearWindowState(flags u32)
@[inline]
pub fn clear_window_state(flags u32) {
	C.ClearWindowState(flags)
}

fn C.ToggleFullscreen()
@[inline]
pub fn toggle_fullscreen() {
	C.ToggleFullscreen()
}

fn C.MaximizeWindow()
@[inline]
pub fn maximize_window() {
	C.MaximizeWindow()
}

fn C.MinimizeWindow()
@[inline]
pub fn minimize_window() {
	C.MinimizeWindow()
}

fn C.RestoreWindow()
@[inline]
pub fn restore_window() {
	C.RestoreWindow()
}

fn C.SetWindowIcon(image Image)
@[inline]
pub fn set_window_icon(image Image) {
	C.SetWindowIcon(image)
}

fn C.SetWindowTitle(title &i8)
@[inline]
pub fn set_window_title(title &i8) {
	C.SetWindowTitle(title)
}

fn C.SetWindowPosition(x int, y int)
@[inline]
pub fn set_window_position(x int, y int) {
	C.SetWindowPosition(x, y)
}

fn C.SetWindowMonitor(monitor int)
@[inline]
pub fn set_window_monitor(monitor int) {
	C.SetWindowMonitor(monitor)
}

fn C.SetWindowMinSize(width int, height int)
@[inline]
pub fn set_window_min_size(width int, height int) {
	C.SetWindowMinSize(width, height)
}

fn C.SetWindowSize(width int, height int)
@[inline]
pub fn set_window_size(width int, height int) {
	C.SetWindowSize(width, height)
}

fn C.SetWindowOpacity(opacity f32)
@[inline]
pub fn set_window_opacity(opacity f32) {
	C.SetWindowOpacity(opacity)
}

fn C.GetWindowHandle() voidptr
@[inline]
pub fn get_window_handle() voidptr {
	return C.GetWindowHandle()
}

fn C.GetScreenWidth() int
@[inline]
pub fn get_screen_width() int {
	return C.GetScreenWidth()
}

fn C.GetScreenHeight() int
@[inline]
pub fn get_screen_height() int {
	return C.GetScreenHeight()
}

fn C.GetRenderWidth() int
@[inline]
pub fn get_render_width() int {
	return C.GetRenderWidth()
}

fn C.GetRenderHeight() int
@[inline]
pub fn get_render_height() int {
	return C.GetRenderHeight()
}

fn C.GetMonitorCount() int
@[inline]
pub fn get_monitor_count() int {
	return C.GetMonitorCount()
}

fn C.GetCurrentMonitor() int
@[inline]
pub fn get_current_monitor() int {
	return C.GetCurrentMonitor()
}

fn C.GetMonitorPosition(monitor int) Vector2
@[inline]
pub fn get_monitor_position(monitor int) Vector2 {
	return C.GetMonitorPosition(monitor)
}

fn C.GetMonitorWidth(monitor int) int
@[inline]
pub fn get_monitor_width(monitor int) int {
	return C.GetMonitorWidth(monitor)
}

fn C.GetMonitorHeight(monitor int) int
@[inline]
pub fn get_monitor_height(monitor int) int {
	return C.GetMonitorHeight(monitor)
}

fn C.GetMonitorPhysicalWidth(monitor int) int
@[inline]
pub fn get_monitor_physical_width(monitor int) int {
	return C.GetMonitorPhysicalWidth(monitor)
}

fn C.GetMonitorPhysicalHeight(monitor int) int
@[inline]
pub fn get_monitor_physical_height(monitor int) int {
	return C.GetMonitorPhysicalHeight(monitor)
}

fn C.GetMonitorRefreshRate(monitor int) int
@[inline]
pub fn get_monitor_refresh_rate(monitor int) int {
	return C.GetMonitorRefreshRate(monitor)
}

fn C.GetWindowPosition() Vector2
@[inline]
pub fn get_window_position() Vector2 {
	return C.GetWindowPosition()
}

fn C.GetWindowScaleDPI() Vector2
@[inline]
pub fn get_window_scale_dpi() Vector2 {
	return C.GetWindowScaleDPI()
}

fn C.GetMonitorName(monitor int) &i8
@[inline]
pub fn get_monitor_name(monitor int) &i8 {
	return C.GetMonitorName(monitor)
}

fn C.SetClipboardText(text &i8)
@[inline]
pub fn set_clipboard_text(text &i8) {
	C.SetClipboardText(text)
}

fn C.GetClipboardText() &i8
@[inline]
pub fn get_clipboard_text() &i8 {
	return C.GetClipboardText()
}

fn C.EnableEventWaiting()
@[inline]
pub fn enable_event_waiting() {
	C.EnableEventWaiting()
}

fn C.DisableEventWaiting()
@[inline]
pub fn disable_event_waiting() {
	C.DisableEventWaiting()
}

fn C.SwapScreenBuffer()
@[inline]
pub fn swap_screen_buffer() {
	C.SwapScreenBuffer()
}

fn C.PollInputEvents()
@[inline]
pub fn poll_input_events() {
	C.PollInputEvents()
}

fn C.WaitTime(seconds f64)
@[inline]
pub fn wait_time(seconds f64) {
	C.WaitTime(seconds)
}

fn C.ShowCursor()
@[inline]
pub fn show_cursor() {
	C.ShowCursor()
}

fn C.HideCursor()
@[inline]
pub fn hide_cursor() {
	C.HideCursor()
}

fn C.IsCursorHidden() bool
@[inline]
pub fn is_cursor_hidden() bool {
	return C.IsCursorHidden()
}

fn C.EnableCursor()
@[inline]
pub fn enable_cursor() {
	C.EnableCursor()
}

fn C.DisableCursor()
@[inline]
pub fn disable_cursor() {
	C.DisableCursor()
}

fn C.IsCursorOnScreen() bool
@[inline]
pub fn is_cursor_on_screen() bool {
	return C.IsCursorOnScreen()
}

fn C.ClearBackground(color Color)
@[inline]
pub fn clear_background(color Color) {
	C.ClearBackground(color)
}

fn C.BeginDrawing()
@[inline]
pub fn begin_drawing() {
	C.BeginDrawing()
}

fn C.EndDrawing()
@[inline]
pub fn end_drawing() {
	C.EndDrawing()
}

fn C.BeginMode2D(camera Camera2D)
@[inline]
pub fn begin_mode_2d(camera Camera2D) {
	C.BeginMode2D(camera)
}

fn C.EndMode2D()
@[inline]
pub fn end_mode_2d() {
	C.EndMode2D()
}

fn C.BeginMode3D(camera Camera3D)
@[inline]
pub fn begin_mode_3d(camera Camera3D) {
	C.BeginMode3D(camera)
}

fn C.EndMode3D()
@[inline]
pub fn end_mode_3d() {
	C.EndMode3D()
}

fn C.BeginTextureMode(target RenderTexture2D)
@[inline]
pub fn begin_texture_mode(target RenderTexture2D) {
	C.BeginTextureMode(target)
}

fn C.EndTextureMode()
@[inline]
pub fn end_texture_mode() {
	C.EndTextureMode()
}

fn C.BeginShaderMode(shader Shader)
@[inline]
pub fn begin_shader_mode(shader Shader) {
	C.BeginShaderMode(shader)
}

fn C.EndShaderMode()
@[inline]
pub fn end_shader_mode() {
	C.EndShaderMode()
}

fn C.BeginBlendMode(mode int)
@[inline]
pub fn begin_blend_mode(mode int) {
	C.BeginBlendMode(mode)
}

fn C.EndBlendMode()
@[inline]
pub fn end_blend_mode() {
	C.EndBlendMode()
}

fn C.BeginScissorMode(x int, y int, width int, height int)
@[inline]
pub fn begin_scissor_mode(x int, y int, width int, height int) {
	C.BeginScissorMode(x, y, width, height)
}

fn C.EndScissorMode()
@[inline]
pub fn end_scissor_mode() {
	C.EndScissorMode()
}

fn C.BeginVrStereoMode(config VrStereoConfig)
@[inline]
pub fn begin_vr_stereo_mode(config VrStereoConfig) {
	C.BeginVrStereoMode(config)
}

fn C.EndVrStereoMode()
@[inline]
pub fn end_vr_stereo_mode() {
	C.EndVrStereoMode()
}

fn C.LoadVrStereoConfig(device VrDeviceInfo) VrStereoConfig
@[inline]
pub fn load_vr_stereo_config(device VrDeviceInfo) VrStereoConfig {
	return C.LoadVrStereoConfig(device)
}

fn C.UnloadVrStereoConfig(config VrStereoConfig)
@[inline]
pub fn unload_vr_stereo_config(config VrStereoConfig) {
	C.UnloadVrStereoConfig(config)
}

fn C.LoadShader(vsFileName &i8, fsFileName &i8) Shader
@[inline]
pub fn load_shader(vsFileName &i8, fsFileName &i8) Shader {
	return C.LoadShader(vsFileName, fsFileName)
}

fn C.LoadShaderFromMemory(vsCode &i8, fsCode &i8) Shader
@[inline]
pub fn load_shader_from_memory(vsCode &i8, fsCode &i8) Shader {
	return C.LoadShaderFromMemory(vsCode, fsCode)
}

fn C.GetShaderLocation(shader Shader, uniformName &i8) int
@[inline]
pub fn get_shader_location(shader Shader, uniformName &i8) int {
	return C.GetShaderLocation(shader, uniformName)
}

fn C.GetShaderLocationAttrib(shader Shader, attribName &i8) int
@[inline]
pub fn get_shader_location_attrib(shader Shader, attribName &i8) int {
	return C.GetShaderLocationAttrib(shader, attribName)
}

fn C.SetShaderValue(shader Shader, locIndex int, value voidptr, uniformType int)
@[inline]
pub fn set_shader_value(shader Shader, locIndex int, value voidptr, uniformType int) {
	C.SetShaderValue(shader, locIndex, value, uniformType)
}

fn C.SetShaderValueV(shader Shader, locIndex int, value voidptr, uniformType int, count int)
@[inline]
pub fn set_shader_value_v(shader Shader, locIndex int, value voidptr, uniformType int, count int) {
	C.SetShaderValueV(shader, locIndex, value, uniformType, count)
}

fn C.SetShaderValueMatrix(shader Shader, locIndex int, mat Matrix)
@[inline]
pub fn set_shader_value_matrix(shader Shader, locIndex int, mat Matrix) {
	C.SetShaderValueMatrix(shader, locIndex, mat)
}

fn C.SetShaderValueTexture(shader Shader, locIndex int, texture Texture2D)
@[inline]
pub fn set_shader_value_texture(shader Shader, locIndex int, texture Texture2D) {
	C.SetShaderValueTexture(shader, locIndex, texture)
}

fn C.UnloadShader(shader Shader)
@[inline]
pub fn unload_shader(shader Shader) {
	C.UnloadShader(shader)
}

fn C.GetMouseRay(mousePosition Vector2, camera Camera) Ray
@[inline]
pub fn get_mouse_ray(mousePosition Vector2, camera Camera) Ray {
	return C.GetMouseRay(mousePosition, camera)
}

fn C.GetCameraMatrix(camera Camera) Matrix
@[inline]
pub fn get_camera_matrix(camera Camera) Matrix {
	return C.GetCameraMatrix(camera)
}

fn C.GetCameraMatrix2D(camera Camera2D) Matrix
@[inline]
pub fn get_camera_matrix_2d(camera Camera2D) Matrix {
	return C.GetCameraMatrix2D(camera)
}

fn C.GetWorldToScreen(position Vector3, camera Camera) Vector2
@[inline]
pub fn get_world_to_screen(position Vector3, camera Camera) Vector2 {
	return C.GetWorldToScreen(position, camera)
}

fn C.GetScreenToWorld2D(position Vector2, camera Camera2D) Vector2
@[inline]
pub fn get_screen_to_world_2d(position Vector2, camera Camera2D) Vector2 {
	return C.GetScreenToWorld2D(position, camera)
}

fn C.GetWorldToScreenEx(position Vector3, camera Camera, width int, height int) Vector2
@[inline]
pub fn get_world_to_screen_ex(position Vector3, camera Camera, width int, height int) Vector2 {
	return C.GetWorldToScreenEx(position, camera, width, height)
}

fn C.GetWorldToScreen2D(position Vector2, camera Camera2D) Vector2
@[inline]
pub fn get_world_to_screen_2d(position Vector2, camera Camera2D) Vector2 {
	return C.GetWorldToScreen2D(position, camera)
}

fn C.SetTargetFPS(fps int)
@[inline]
pub fn set_target_fps(fps int) {
	C.SetTargetFPS(fps)
}

fn C.GetFPS() int
@[inline]
pub fn get_fps() int {
	return C.GetFPS()
}

fn C.GetFrameTime() f32
@[inline]
pub fn get_frame_time() f32 {
	return C.GetFrameTime()
}

fn C.GetTime() f64
@[inline]
pub fn get_time() f64 {
	return C.GetTime()
}

fn C.GetRandomValue(min int, max int) int
@[inline]
pub fn get_random_value(min int, max int) int {
	return C.GetRandomValue(min, max)
}

fn C.SetRandomSeed(seed u32)
@[inline]
pub fn set_random_seed(seed u32) {
	C.SetRandomSeed(seed)
}

fn C.TakeScreenshot(fileName &i8)
@[inline]
pub fn take_screenshot(fileName &i8) {
	C.TakeScreenshot(fileName)
}

fn C.SetConfigFlags(flags u32)
@[inline]
pub fn set_config_flags(flags u32) {
	C.SetConfigFlags(flags)
}

fn C.SetTraceLogLevel(logLevel int)
@[inline]
pub fn set_trace_log_level(logLevel int) {
	C.SetTraceLogLevel(logLevel)
}

fn C.MemAlloc(size u32) voidptr
@[inline]
pub fn mem_alloc(size u32) voidptr {
	return C.MemAlloc(size)
}

fn C.MemRealloc(ptr voidptr, size u32) voidptr
@[inline]
pub fn mem_realloc(ptr voidptr, size u32) voidptr {
	return C.MemRealloc(ptr, size)
}

fn C.MemFree(ptr voidptr)
@[inline]
pub fn mem_free(ptr voidptr) {
	C.MemFree(ptr)
}

fn C.OpenURL(url &i8)
@[inline]
pub fn open_url(url &i8) {
	C.OpenURL(url)
}

fn C.SetTraceLogCallback(callback voidptr)
@[inline]
pub fn set_trace_log_callback(callback voidptr) {
	C.SetTraceLogCallback(callback)
}

fn C.SetLoadFileDataCallback(callback voidptr)
@[inline]
pub fn set_load_file_data_callback(callback voidptr) {
	C.SetLoadFileDataCallback(callback)
}

fn C.SetSaveFileDataCallback(callback voidptr)
@[inline]
pub fn set_save_file_data_callback(callback voidptr) {
	C.SetSaveFileDataCallback(callback)
}

fn C.SetLoadFileTextCallback(callback voidptr)
@[inline]
pub fn set_load_file_text_callback(callback voidptr) {
	C.SetLoadFileTextCallback(callback)
}

fn C.SetSaveFileTextCallback(callback voidptr)
@[inline]
pub fn set_save_file_text_callback(callback voidptr) {
	C.SetSaveFileTextCallback(callback)
}

fn C.LoadFileData(fileName &i8, bytesRead &u32) &u8
@[inline]
pub fn load_file_data(fileName &i8, bytesRead &u32) &u8 {
	return C.LoadFileData(fileName, bytesRead)
}

fn C.UnloadFileData(data &u8)
@[inline]
pub fn unload_file_data(data &u8) {
	C.UnloadFileData(data)
}

fn C.SaveFileData(fileName &i8, data voidptr, bytesToWrite u32) bool
@[inline]
pub fn save_file_data(fileName &i8, data voidptr, bytesToWrite u32) bool {
	return C.SaveFileData(fileName, data, bytesToWrite)
}

fn C.ExportDataAsCode(data &i8, size u32, fileName &i8) bool
@[inline]
pub fn export_data_as_code(data &i8, size u32, fileName &i8) bool {
	return C.ExportDataAsCode(data, size, fileName)
}

fn C.LoadFileText(fileName &i8) &i8
@[inline]
pub fn load_file_text(fileName &i8) &i8 {
	return C.LoadFileText(fileName)
}

fn C.UnloadFileText(text &i8)
@[inline]
pub fn unload_file_text(text &i8) {
	C.UnloadFileText(text)
}

fn C.SaveFileText(fileName &i8, text &i8) bool
@[inline]
pub fn save_file_text(fileName &i8, text &i8) bool {
	return C.SaveFileText(fileName, text)
}

fn C.FileExists(fileName &i8) bool
@[inline]
pub fn file_exists(fileName &i8) bool {
	return C.FileExists(fileName)
}

fn C.DirectoryExists(dirPath &i8) bool
@[inline]
pub fn directory_exists(dirPath &i8) bool {
	return C.DirectoryExists(dirPath)
}

fn C.IsFileExtension(fileName &i8, ext &i8) bool
@[inline]
pub fn is_file_extension(fileName &i8, ext &i8) bool {
	return C.IsFileExtension(fileName, ext)
}

fn C.GetFileLength(fileName &i8) int
@[inline]
pub fn get_file_length(fileName &i8) int {
	return C.GetFileLength(fileName)
}

fn C.GetFileExtension(fileName &i8) &i8
@[inline]
pub fn get_file_extension(fileName &i8) &i8 {
	return C.GetFileExtension(fileName)
}

fn C.GetFileName(filePath &i8) &i8
@[inline]
pub fn get_file_name(filePath &i8) &i8 {
	return C.GetFileName(filePath)
}

fn C.GetFileNameWithoutExt(filePath &i8) &i8
@[inline]
pub fn get_file_name_without_ext(filePath &i8) &i8 {
	return C.GetFileNameWithoutExt(filePath)
}

fn C.GetDirectoryPath(filePath &i8) &i8
@[inline]
pub fn get_directory_path(filePath &i8) &i8 {
	return C.GetDirectoryPath(filePath)
}

fn C.GetPrevDirectoryPath(dirPath &i8) &i8
@[inline]
pub fn get_prev_directory_path(dirPath &i8) &i8 {
	return C.GetPrevDirectoryPath(dirPath)
}

fn C.GetWorkingDirectory() &i8
@[inline]
pub fn get_working_directory() &i8 {
	return C.GetWorkingDirectory()
}

fn C.GetApplicationDirectory() &i8
@[inline]
pub fn get_application_directory() &i8 {
	return C.GetApplicationDirectory()
}

fn C.ChangeDirectory(dir &i8) bool
@[inline]
pub fn change_directory(dir &i8) bool {
	return C.ChangeDirectory(dir)
}

fn C.IsPathFile(path &i8) bool
@[inline]
pub fn is_path_file(path &i8) bool {
	return C.IsPathFile(path)
}

fn C.LoadDirectoryFiles(dirPath &i8) FilePathList
@[inline]
pub fn load_directory_files(dirPath &i8) FilePathList {
	return C.LoadDirectoryFiles(dirPath)
}

fn C.LoadDirectoryFilesEx(basePath &i8, filter &i8, scanSubdirs bool) FilePathList
@[inline]
pub fn load_directory_files_ex(basePath &i8, filter &i8, scanSubdirs bool) FilePathList {
	return C.LoadDirectoryFilesEx(basePath, filter, scanSubdirs)
}

fn C.UnloadDirectoryFiles(files FilePathList)
@[inline]
pub fn unload_directory_files(files FilePathList) {
	C.UnloadDirectoryFiles(files)
}

fn C.IsFileDropped() bool
@[inline]
pub fn is_file_dropped() bool {
	return C.IsFileDropped()
}

fn C.LoadDroppedFiles() FilePathList
@[inline]
pub fn load_dropped_files() FilePathList {
	return C.LoadDroppedFiles()
}

fn C.UnloadDroppedFiles(files FilePathList)
@[inline]
pub fn unload_dropped_files(files FilePathList) {
	C.UnloadDroppedFiles(files)
}

fn C.GetFileModTime(fileName &i8) i64
@[inline]
pub fn get_file_mod_time(fileName &i8) i64 {
	return C.GetFileModTime(fileName)
}

fn C.CompressData(data &u8, dataSize int, compDataSize &int) &u8
@[inline]
pub fn compress_data(data &u8, dataSize int, compDataSize &int) &u8 {
	return C.CompressData(data, dataSize, compDataSize)
}

fn C.DecompressData(compData &u8, compDataSize int, dataSize &int) &u8
@[inline]
pub fn decompress_data(compData &u8, compDataSize int, dataSize &int) &u8 {
	return C.DecompressData(compData, compDataSize, dataSize)
}

fn C.EncodeDataBase64(data &u8, dataSize int, outputSize &int) &i8
@[inline]
pub fn encode_data_base_64(data &u8, dataSize int, outputSize &int) &i8 {
	return C.EncodeDataBase64(data, dataSize, outputSize)
}

fn C.DecodeDataBase64(data &u8, outputSize &int) &u8
@[inline]
pub fn decode_data_base_64(data &u8, outputSize &int) &u8 {
	return C.DecodeDataBase64(data, outputSize)
}

fn C.IsKeyPressed(key int) bool
@[inline]
pub fn is_key_pressed(key int) bool {
	return C.IsKeyPressed(key)
}

fn C.IsKeyDown(key int) bool
@[inline]
pub fn is_key_down(key int) bool {
	return C.IsKeyDown(key)
}

fn C.IsKeyReleased(key int) bool
@[inline]
pub fn is_key_released(key int) bool {
	return C.IsKeyReleased(key)
}

fn C.IsKeyUp(key int) bool
@[inline]
pub fn is_key_up(key int) bool {
	return C.IsKeyUp(key)
}

fn C.SetExitKey(key int)
@[inline]
pub fn set_exit_key(key int) {
	C.SetExitKey(key)
}

fn C.GetKeyPressed() int
@[inline]
pub fn get_key_pressed() int {
	return C.GetKeyPressed()
}

fn C.GetCharPressed() int
@[inline]
pub fn get_char_pressed() int {
	return C.GetCharPressed()
}

fn C.IsGamepadAvailable(gamepad int) bool
@[inline]
pub fn is_gamepad_available(gamepad int) bool {
	return C.IsGamepadAvailable(gamepad)
}

fn C.GetGamepadName(gamepad int) &i8
@[inline]
pub fn get_gamepad_name(gamepad int) &i8 {
	return C.GetGamepadName(gamepad)
}

fn C.IsGamepadButtonPressed(gamepad int, button int) bool
@[inline]
pub fn is_gamepad_button_pressed(gamepad int, button int) bool {
	return C.IsGamepadButtonPressed(gamepad, button)
}

fn C.IsGamepadButtonDown(gamepad int, button int) bool
@[inline]
pub fn is_gamepad_button_down(gamepad int, button int) bool {
	return C.IsGamepadButtonDown(gamepad, button)
}

fn C.IsGamepadButtonReleased(gamepad int, button int) bool
@[inline]
pub fn is_gamepad_button_released(gamepad int, button int) bool {
	return C.IsGamepadButtonReleased(gamepad, button)
}

fn C.IsGamepadButtonUp(gamepad int, button int) bool
@[inline]
pub fn is_gamepad_button_up(gamepad int, button int) bool {
	return C.IsGamepadButtonUp(gamepad, button)
}

fn C.GetGamepadButtonPressed() int
@[inline]
pub fn get_gamepad_button_pressed() int {
	return C.GetGamepadButtonPressed()
}

fn C.GetGamepadAxisCount(gamepad int) int
@[inline]
pub fn get_gamepad_axis_count(gamepad int) int {
	return C.GetGamepadAxisCount(gamepad)
}

fn C.GetGamepadAxisMovement(gamepad int, axis int) f32
@[inline]
pub fn get_gamepad_axis_movement(gamepad int, axis int) f32 {
	return C.GetGamepadAxisMovement(gamepad, axis)
}

fn C.SetGamepadMappings(mappings &i8) int
@[inline]
pub fn set_gamepad_mappings(mappings &i8) int {
	return C.SetGamepadMappings(mappings)
}

fn C.IsMouseButtonPressed(button int) bool
@[inline]
pub fn is_mouse_button_pressed(button int) bool {
	return C.IsMouseButtonPressed(button)
}

fn C.IsMouseButtonDown(button int) bool
@[inline]
pub fn is_mouse_button_down(button int) bool {
	return C.IsMouseButtonDown(button)
}

fn C.IsMouseButtonReleased(button int) bool
@[inline]
pub fn is_mouse_button_released(button int) bool {
	return C.IsMouseButtonReleased(button)
}

fn C.IsMouseButtonUp(button int) bool
@[inline]
pub fn is_mouse_button_up(button int) bool {
	return C.IsMouseButtonUp(button)
}

fn C.GetMouseX() int
@[inline]
pub fn get_mouse_x() int {
	return C.GetMouseX()
}

fn C.GetMouseY() int
@[inline]
pub fn get_mouse_y() int {
	return C.GetMouseY()
}

fn C.GetMousePosition() Vector2
@[inline]
pub fn get_mouse_position() Vector2 {
	return C.GetMousePosition()
}

fn C.GetMouseDelta() Vector2
@[inline]
pub fn get_mouse_delta() Vector2 {
	return C.GetMouseDelta()
}

fn C.SetMousePosition(x int, y int)
@[inline]
pub fn set_mouse_position(x int, y int) {
	C.SetMousePosition(x, y)
}

fn C.SetMouseOffset(offsetX int, offsetY int)
@[inline]
pub fn set_mouse_offset(offsetX int, offsetY int) {
	C.SetMouseOffset(offsetX, offsetY)
}

fn C.SetMouseScale(scaleX f32, scaleY f32)
@[inline]
pub fn set_mouse_scale(scaleX f32, scaleY f32) {
	C.SetMouseScale(scaleX, scaleY)
}

fn C.GetMouseWheelMove() f32
@[inline]
pub fn get_mouse_wheel_move() f32 {
	return C.GetMouseWheelMove()
}

fn C.GetMouseWheelMoveV() Vector2
@[inline]
pub fn get_mouse_wheel_move_v() Vector2 {
	return C.GetMouseWheelMoveV()
}

fn C.SetMouseCursor(cursor int)
@[inline]
pub fn set_mouse_cursor(cursor int) {
	C.SetMouseCursor(cursor)
}

fn C.GetTouchX() int
@[inline]
pub fn get_touch_x() int {
	return C.GetTouchX()
}

fn C.GetTouchY() int
@[inline]
pub fn get_touch_y() int {
	return C.GetTouchY()
}

fn C.GetTouchPosition(index int) Vector2
@[inline]
pub fn get_touch_position(index int) Vector2 {
	return C.GetTouchPosition(index)
}

fn C.GetTouchPointId(index int) int
@[inline]
pub fn get_touch_point_id(index int) int {
	return C.GetTouchPointId(index)
}

fn C.GetTouchPointCount() int
@[inline]
pub fn get_touch_point_count() int {
	return C.GetTouchPointCount()
}

fn C.SetGesturesEnabled(flags u32)
@[inline]
pub fn set_gestures_enabled(flags u32) {
	C.SetGesturesEnabled(flags)
}

fn C.IsGestureDetected(gesture int) bool
@[inline]
pub fn is_gesture_detected(gesture int) bool {
	return C.IsGestureDetected(gesture)
}

fn C.GetGestureDetected() int
@[inline]
pub fn get_gesture_detected() int {
	return C.GetGestureDetected()
}

fn C.GetGestureHoldDuration() f32
@[inline]
pub fn get_gesture_hold_duration() f32 {
	return C.GetGestureHoldDuration()
}

fn C.GetGestureDragVector() Vector2
@[inline]
pub fn get_gesture_drag_vector() Vector2 {
	return C.GetGestureDragVector()
}

fn C.GetGestureDragAngle() f32
@[inline]
pub fn get_gesture_drag_angle() f32 {
	return C.GetGestureDragAngle()
}

fn C.GetGesturePinchVector() Vector2
@[inline]
pub fn get_gesture_pinch_vector() Vector2 {
	return C.GetGesturePinchVector()
}

fn C.GetGesturePinchAngle() f32
@[inline]
pub fn get_gesture_pinch_angle() f32 {
	return C.GetGesturePinchAngle()
}

fn C.SetCameraMode(camera Camera, mode int)
@[inline]
pub fn set_camera_mode(camera Camera, mode int) {
	C.SetCameraMode(camera, mode)
}

fn C.UpdateCamera(camera &Camera)
@[inline]
pub fn update_camera(camera &Camera) {
	C.UpdateCamera(camera)
}

fn C.SetCameraPanControl(keyPan int)
@[inline]
pub fn set_camera_pan_control(keyPan int) {
	C.SetCameraPanControl(keyPan)
}

fn C.SetCameraAltControl(keyAlt int)
@[inline]
pub fn set_camera_alt_control(keyAlt int) {
	C.SetCameraAltControl(keyAlt)
}

fn C.SetCameraSmoothZoomControl(keySmoothZoom int)
@[inline]
pub fn set_camera_smooth_zoom_control(keySmoothZoom int) {
	C.SetCameraSmoothZoomControl(keySmoothZoom)
}

fn C.SetCameraMoveControls(keyFront int, keyBack int, keyRight int, keyLeft int, keyUp int, keyDown int)
@[inline]
pub fn set_camera_move_controls(keyFront int, keyBack int, keyRight int, keyLeft int, keyUp int, keyDown int) {
	C.SetCameraMoveControls(keyFront, keyBack, keyRight, keyLeft, keyUp, keyDown)
}

fn C.SetShapesTexture(texture Texture2D, source Rectangle)
@[inline]
pub fn set_shapes_texture(texture Texture2D, source Rectangle) {
	C.SetShapesTexture(texture, source)
}

fn C.DrawPixel(posX int, posY int, color Color)
@[inline]
pub fn draw_pixel(posX int, posY int, color Color) {
	C.DrawPixel(posX, posY, color)
}

fn C.DrawPixelV(position Vector2, color Color)
@[inline]
pub fn draw_pixel_v(position Vector2, color Color) {
	C.DrawPixelV(position, color)
}

fn C.DrawLine(startPosX int, startPosY int, endPosX int, endPosY int, color Color)
@[inline]
pub fn draw_line(startPosX int, startPosY int, endPosX int, endPosY int, color Color) {
	C.DrawLine(startPosX, startPosY, endPosX, endPosY, color)
}

fn C.DrawLineV(startPos Vector2, endPos Vector2, color Color)
@[inline]
pub fn draw_line_v(startPos Vector2, endPos Vector2, color Color) {
	C.DrawLineV(startPos, endPos, color)
}

fn C.DrawLineEx(startPos Vector2, endPos Vector2, thick f32, color Color)
@[inline]
pub fn draw_line_ex(startPos Vector2, endPos Vector2, thick f32, color Color) {
	C.DrawLineEx(startPos, endPos, thick, color)
}

fn C.DrawLineBezier(startPos Vector2, endPos Vector2, thick f32, color Color)
@[inline]
pub fn draw_line_bezier(startPos Vector2, endPos Vector2, thick f32, color Color) {
	C.DrawLineBezier(startPos, endPos, thick, color)
}

fn C.DrawLineBezierQuad(startPos Vector2, endPos Vector2, controlPos Vector2, thick f32, color Color)
@[inline]
pub fn draw_line_bezier_quad(startPos Vector2, endPos Vector2, controlPos Vector2, thick f32, color Color) {
	C.DrawLineBezierQuad(startPos, endPos, controlPos, thick, color)
}

fn C.DrawLineBezierCubic(startPos Vector2, endPos Vector2, startControlPos Vector2, endControlPos Vector2, thick f32, color Color)
@[inline]
pub fn draw_line_bezier_cubic(startPos Vector2, endPos Vector2, startControlPos Vector2, endControlPos Vector2, thick f32, color Color) {
	C.DrawLineBezierCubic(startPos, endPos, startControlPos, endControlPos, thick, color)
}

fn C.DrawLineStrip(points &Vector2, pointCount int, color Color)
@[inline]
pub fn draw_line_strip(points &Vector2, pointCount int, color Color) {
	C.DrawLineStrip(points, pointCount, color)
}

fn C.DrawCircle(centerX int, centerY int, radius f32, color Color)
@[inline]
pub fn draw_circle(centerX int, centerY int, radius f32, color Color) {
	C.DrawCircle(centerX, centerY, radius, color)
}

fn C.DrawCircleSector(center Vector2, radius f32, startAngle f32, endAngle f32, segments int, color Color)
@[inline]
pub fn draw_circle_sector(center Vector2, radius f32, startAngle f32, endAngle f32, segments int, color Color) {
	C.DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
}

fn C.DrawCircleSectorLines(center Vector2, radius f32, startAngle f32, endAngle f32, segments int, color Color)
@[inline]
pub fn draw_circle_sector_lines(center Vector2, radius f32, startAngle f32, endAngle f32, segments int, color Color) {
	C.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
}

fn C.DrawCircleGradient(centerX int, centerY int, radius f32, color1 Color, color2 Color)
@[inline]
pub fn draw_circle_gradient(centerX int, centerY int, radius f32, color1 Color, color2 Color) {
	C.DrawCircleGradient(centerX, centerY, radius, color1, color2)
}

fn C.DrawCircleV(center Vector2, radius f32, color Color)
@[inline]
pub fn draw_circle_v(center Vector2, radius f32, color Color) {
	C.DrawCircleV(center, radius, color)
}

fn C.DrawCircleLines(centerX int, centerY int, radius f32, color Color)
@[inline]
pub fn draw_circle_lines(centerX int, centerY int, radius f32, color Color) {
	C.DrawCircleLines(centerX, centerY, radius, color)
}

fn C.DrawEllipse(centerX int, centerY int, radiusH f32, radiusV f32, color Color)
@[inline]
pub fn draw_ellipse(centerX int, centerY int, radiusH f32, radiusV f32, color Color) {
	C.DrawEllipse(centerX, centerY, radiusH, radiusV, color)
}

fn C.DrawEllipseLines(centerX int, centerY int, radiusH f32, radiusV f32, color Color)
@[inline]
pub fn draw_ellipse_lines(centerX int, centerY int, radiusH f32, radiusV f32, color Color) {
	C.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color)
}

fn C.DrawRing(center Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color Color)
@[inline]
pub fn draw_ring(center Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color Color) {
	C.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
}

fn C.DrawRingLines(center Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color Color)
@[inline]
pub fn draw_ring_lines(center Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color Color) {
	C.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments,
		color)
}

fn C.DrawRectangle(posX int, posY int, width int, height int, color Color)
@[inline]
pub fn draw_rectangle(posX int, posY int, width int, height int, color Color) {
	C.DrawRectangle(posX, posY, width, height, color)
}

fn C.DrawRectangleV(position Vector2, size Vector2, color Color)
@[inline]
pub fn draw_rectangle_v(position Vector2, size Vector2, color Color) {
	C.DrawRectangleV(position, size, color)
}

fn C.DrawRectangleRec(rec Rectangle, color Color)
@[inline]
pub fn draw_rectangle_rec(rec Rectangle, color Color) {
	C.DrawRectangleRec(rec, color)
}

fn C.DrawRectanglePro(rec Rectangle, origin Vector2, rotation f32, color Color)
@[inline]
pub fn draw_rectangle_pro(rec Rectangle, origin Vector2, rotation f32, color Color) {
	C.DrawRectanglePro(rec, origin, rotation, color)
}

fn C.DrawRectangleGradientV(posX int, posY int, width int, height int, color1 Color, color2 Color)
@[inline]
pub fn draw_rectangle_gradient_v(posX int, posY int, width int, height int, color1 Color, color2 Color) {
	C.DrawRectangleGradientV(posX, posY, width, height, color1, color2)
}

fn C.DrawRectangleGradientH(posX int, posY int, width int, height int, color1 Color, color2 Color)
@[inline]
pub fn draw_rectangle_gradient_h(posX int, posY int, width int, height int, color1 Color, color2 Color) {
	C.DrawRectangleGradientH(posX, posY, width, height, color1, color2)
}

fn C.DrawRectangleGradientEx(rec Rectangle, col1 Color, col2 Color, col3 Color, col4 Color)
@[inline]
pub fn draw_rectangle_gradient_ex(rec Rectangle, col1 Color, col2 Color, col3 Color, col4 Color) {
	C.DrawRectangleGradientEx(rec, col1, col2, col3, col4)
}

fn C.DrawRectangleLines(posX int, posY int, width int, height int, color Color)
@[inline]
pub fn draw_rectangle_lines(posX int, posY int, width int, height int, color Color) {
	C.DrawRectangleLines(posX, posY, width, height, color)
}

fn C.DrawRectangleLinesEx(rec Rectangle, lineThick f32, color Color)
@[inline]
pub fn draw_rectangle_lines_ex(rec Rectangle, lineThick f32, color Color) {
	C.DrawRectangleLinesEx(rec, lineThick, color)
}

fn C.DrawRectangleRounded(rec Rectangle, roundness f32, segments int, color Color)
@[inline]
pub fn draw_rectangle_rounded(rec Rectangle, roundness f32, segments int, color Color) {
	C.DrawRectangleRounded(rec, roundness, segments, color)
}

fn C.DrawRectangleRoundedLines(rec Rectangle, roundness f32, segments int, lineThick f32, color Color)
@[inline]
pub fn draw_rectangle_rounded_lines(rec Rectangle, roundness f32, segments int, lineThick f32, color Color) {
	C.DrawRectangleRoundedLines(rec, roundness, segments, lineThick, color)
}

fn C.DrawTriangle(v1 Vector2, v2 Vector2, v3 Vector2, color Color)
@[inline]
pub fn draw_triangle(v1 Vector2, v2 Vector2, v3 Vector2, color Color) {
	C.DrawTriangle(v1, v2, v3, color)
}

fn C.DrawTriangleLines(v1 Vector2, v2 Vector2, v3 Vector2, color Color)
@[inline]
pub fn draw_triangle_lines(v1 Vector2, v2 Vector2, v3 Vector2, color Color) {
	C.DrawTriangleLines(v1, v2, v3, color)
}

fn C.DrawTriangleFan(points &Vector2, pointCount int, color Color)
@[inline]
pub fn draw_triangle_fan(points &Vector2, pointCount int, color Color) {
	C.DrawTriangleFan(points, pointCount, color)
}

fn C.DrawTriangleStrip(points &Vector2, pointCount int, color Color)
@[inline]
pub fn draw_triangle_strip(points &Vector2, pointCount int, color Color) {
	C.DrawTriangleStrip(points, pointCount, color)
}

fn C.DrawPoly(center Vector2, sides int, radius f32, rotation f32, color Color)
@[inline]
pub fn draw_poly(center Vector2, sides int, radius f32, rotation f32, color Color) {
	C.DrawPoly(center, sides, radius, rotation, color)
}

fn C.DrawPolyLines(center Vector2, sides int, radius f32, rotation f32, color Color)
@[inline]
pub fn draw_poly_lines(center Vector2, sides int, radius f32, rotation f32, color Color) {
	C.DrawPolyLines(center, sides, radius, rotation, color)
}

fn C.DrawPolyLinesEx(center Vector2, sides int, radius f32, rotation f32, lineThick f32, color Color)
@[inline]
pub fn draw_poly_lines_ex(center Vector2, sides int, radius f32, rotation f32, lineThick f32, color Color) {
	C.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color)
}

fn C.CheckCollisionRecs(rec1 Rectangle, rec2 Rectangle) bool
@[inline]
pub fn check_collision_recs(rec1 Rectangle, rec2 Rectangle) bool {
	return C.CheckCollisionRecs(rec1, rec2)
}

fn C.CheckCollisionCircles(center1 Vector2, radius1 f32, center2 Vector2, radius2 f32) bool
@[inline]
pub fn check_collision_circles(center1 Vector2, radius1 f32, center2 Vector2, radius2 f32) bool {
	return C.CheckCollisionCircles(center1, radius1, center2, radius2)
}

fn C.CheckCollisionCircleRec(center Vector2, radius f32, rec Rectangle) bool
@[inline]
pub fn check_collision_circle_rec(center Vector2, radius f32, rec Rectangle) bool {
	return C.CheckCollisionCircleRec(center, radius, rec)
}

fn C.CheckCollisionPointRec(point Vector2, rec Rectangle) bool
@[inline]
pub fn check_collision_point_rec(point Vector2, rec Rectangle) bool {
	return C.CheckCollisionPointRec(point, rec)
}

fn C.CheckCollisionPointCircle(point Vector2, center Vector2, radius f32) bool
@[inline]
pub fn check_collision_point_circle(point Vector2, center Vector2, radius f32) bool {
	return C.CheckCollisionPointCircle(point, center, radius)
}

fn C.CheckCollisionPointTriangle(point Vector2, p1 Vector2, p2 Vector2, p3 Vector2) bool
@[inline]
pub fn check_collision_point_triangle(point Vector2, p1 Vector2, p2 Vector2, p3 Vector2) bool {
	return C.CheckCollisionPointTriangle(point, p1, p2, p3)
}

/*fn C.CheckCollisionPointPoly(point Vector2, points voidptr, pointCount int) bool
[inline]
pub fn check_collision_point_poly(point Vector2, points []Vector2) bool {
	return C.CheckCollisionPointPoly(point, points.data, points.len)
}*/

fn C.CheckCollisionLines(startPos1 Vector2, endPos1 Vector2, startPos2 Vector2, endPos2 Vector2, collisionPoint &Vector2) bool
@[inline]
pub fn check_collision_lines(startPos1 Vector2, endPos1 Vector2, startPos2 Vector2, endPos2 Vector2, collisionPoint &Vector2) bool {
	return C.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint)
}

fn C.CheckCollisionPointLine(point Vector2, p1 Vector2, p2 Vector2, threshold int) bool
@[inline]
pub fn check_collision_point_line(point Vector2, p1 Vector2, p2 Vector2, threshold int) bool {
	return C.CheckCollisionPointLine(point, p1, p2, threshold)
}

fn C.GetCollisionRec(rec1 Rectangle, rec2 Rectangle) Rectangle
@[inline]
pub fn get_collision_rec(rec1 Rectangle, rec2 Rectangle) Rectangle {
	return C.GetCollisionRec(rec1, rec2)
}

fn C.LoadImage(fileName &i8) Image
@[inline]
pub fn load_image(fileName &i8) Image {
	return C.LoadImage(fileName)
}

fn C.LoadImageRaw(fileName &i8, width int, height int, format int, headerSize int) Image
@[inline]
pub fn load_image_raw(fileName &i8, width int, height int, format int, headerSize int) Image {
	return C.LoadImageRaw(fileName, width, height, format, headerSize)
}

fn C.LoadImageAnim(fileName &i8, frames &int) Image
@[inline]
pub fn load_image_anim(fileName &i8, frames &int) Image {
	return C.LoadImageAnim(fileName, frames)
}

fn C.LoadImageFromMemory(fileType &i8, fileData &u8, dataSize int) Image
@[inline]
pub fn load_image_from_memory(fileType &i8, fileData &u8, dataSize int) Image {
	return C.LoadImageFromMemory(fileType, fileData, dataSize)
}

fn C.LoadImageFromTexture(texture Texture2D) Image
@[inline]
pub fn load_image_from_texture(texture Texture2D) Image {
	return C.LoadImageFromTexture(texture)
}

fn C.LoadImageFromScreen() Image
@[inline]
pub fn load_image_from_screen() Image {
	return C.LoadImageFromScreen()
}

fn C.UnloadImage(image Image)
@[inline]
pub fn unload_image(image Image) {
	C.UnloadImage(image)
}

fn C.ExportImage(image Image, fileName &i8) bool
@[inline]
pub fn export_image(image Image, fileName &i8) bool {
	return C.ExportImage(image, fileName)
}

fn C.ExportImageAsCode(image Image, fileName &i8) bool
@[inline]
pub fn export_image_as_code(image Image, fileName &i8) bool {
	return C.ExportImageAsCode(image, fileName)
}

fn C.GenImageColor(width int, height int, color Color) Image
@[inline]
pub fn gen_image_color(width int, height int, color Color) Image {
	return C.GenImageColor(width, height, color)
}

fn C.GenImageGradientV(width int, height int, top Color, bottom Color) Image
@[inline]
pub fn gen_image_gradient_v(width int, height int, top Color, bottom Color) Image {
	return C.GenImageGradientV(width, height, top, bottom)
}

fn C.GenImageGradientH(width int, height int, left Color, right Color) Image
@[inline]
pub fn gen_image_gradient_h(width int, height int, left Color, right Color) Image {
	return C.GenImageGradientH(width, height, left, right)
}

fn C.GenImageGradientRadial(width int, height int, density f32, inner Color, outer Color) Image
@[inline]
pub fn gen_image_gradient_radial(width int, height int, density f32, inner Color, outer Color) Image {
	return C.GenImageGradientRadial(width, height, density, inner, outer)
}

fn C.GenImageChecked(width int, height int, checksX int, checksY int, col1 Color, col2 Color) Image
@[inline]
pub fn gen_image_checked(width int, height int, checksX int, checksY int, col1 Color, col2 Color) Image {
	return C.GenImageChecked(width, height, checksX, checksY, col1, col2)
}

fn C.GenImageWhiteNoise(width int, height int, factor f32) Image
@[inline]
pub fn gen_image_white_noise(width int, height int, factor f32) Image {
	return C.GenImageWhiteNoise(width, height, factor)
}

/*fn C.GenImagePerlinNoise(width int, height int, offsetX int, offsetY int, scale f32) Image
[inline]
pub fn gen_image_perlin_noise(width int, height int, offsetX int, offsetY int, scale f32) Image {
	return C.GenImagePerlinNoise(width, height, offsetX, offsetY, scale)
}*/

fn C.GenImageCellular(width int, height int, tileSize int) Image
@[inline]
pub fn gen_image_cellular(width int, height int, tileSize int) Image {
	return C.GenImageCellular(width, height, tileSize)
}

fn C.ImageCopy(image Image) Image
@[inline]
pub fn image_copy(image Image) Image {
	return C.ImageCopy(image)
}

fn C.ImageFromImage(image Image, rec Rectangle) Image
@[inline]
pub fn image_from_image(image Image, rec Rectangle) Image {
	return C.ImageFromImage(image, rec)
}

fn C.ImageText(text &i8, fontSize int, color Color) Image
@[inline]
pub fn image_text(text &i8, fontSize int, color Color) Image {
	return C.ImageText(text, fontSize, color)
}

fn C.ImageTextEx(font Font, text &i8, fontSize f32, spacing f32, tint Color) Image
@[inline]
pub fn image_text_ex(font Font, text &i8, fontSize f32, spacing f32, tint Color) Image {
	return C.ImageTextEx(font, text, fontSize, spacing, tint)
}

fn C.ImageFormat(image &Image, newFormat int)
@[inline]
pub fn image_format(image &Image, newFormat int) {
	C.ImageFormat(image, newFormat)
}

fn C.ImageToPOT(image &Image, fill Color)
@[inline]
pub fn image_to_pot(image &Image, fill Color) {
	C.ImageToPOT(image, fill)
}

fn C.ImageCrop(image &Image, crop Rectangle)
@[inline]
pub fn image_crop(image &Image, crop Rectangle) {
	C.ImageCrop(image, crop)
}

fn C.ImageAlphaCrop(image &Image, threshold f32)
@[inline]
pub fn image_alpha_crop(image &Image, threshold f32) {
	C.ImageAlphaCrop(image, threshold)
}

fn C.ImageAlphaClear(image &Image, color Color, threshold f32)
@[inline]
pub fn image_alpha_clear(image &Image, color Color, threshold f32) {
	C.ImageAlphaClear(image, color, threshold)
}

fn C.ImageAlphaMask(image &Image, alphaMask Image)
@[inline]
pub fn image_alpha_mask(image &Image, alphaMask Image) {
	C.ImageAlphaMask(image, alphaMask)
}

fn C.ImageAlphaPremultiply(image &Image)
@[inline]
pub fn image_alpha_premultiply(image &Image) {
	C.ImageAlphaPremultiply(image)
}

fn C.ImageResize(image &Image, newWidth int, newHeight int)
@[inline]
pub fn image_resize(image &Image, newWidth int, newHeight int) {
	C.ImageResize(image, newWidth, newHeight)
}

fn C.ImageResizeNN(image &Image, newWidth int, newHeight int)
@[inline]
pub fn image_resize_nn(image &Image, newWidth int, newHeight int) {
	C.ImageResizeNN(image, newWidth, newHeight)
}

fn C.ImageResizeCanvas(image &Image, newWidth int, newHeight int, offsetX int, offsetY int, fill Color)
@[inline]
pub fn image_resize_canvas(image &Image, newWidth int, newHeight int, offsetX int, offsetY int, fill Color) {
	C.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill)
}

fn C.ImageMipmaps(image &Image)
@[inline]
pub fn image_mipmaps(image &Image) {
	C.ImageMipmaps(image)
}

fn C.ImageDither(image &Image, rBpp int, gBpp int, bBpp int, aBpp int)
@[inline]
pub fn image_dither(image &Image, rBpp int, gBpp int, bBpp int, aBpp int) {
	C.ImageDither(image, rBpp, gBpp, bBpp, aBpp)
}

fn C.ImageFlipVertical(image &Image)
@[inline]
pub fn image_flip_vertical(image &Image) {
	C.ImageFlipVertical(image)
}

fn C.ImageFlipHorizontal(image &Image)
@[inline]
pub fn image_flip_horizontal(image &Image) {
	C.ImageFlipHorizontal(image)
}

fn C.ImageRotateCW(image &Image)
@[inline]
pub fn image_rotate_cw(image &Image) {
	C.ImageRotateCW(image)
}

fn C.ImageRotateCCW(image &Image)
@[inline]
pub fn image_rotate_ccw(image &Image) {
	C.ImageRotateCCW(image)
}

fn C.ImageColorTint(image &Image, color Color)
@[inline]
pub fn image_color_tint(image &Image, color Color) {
	C.ImageColorTint(image, color)
}

fn C.ImageColorInvert(image &Image)
@[inline]
pub fn image_color_invert(image &Image) {
	C.ImageColorInvert(image)
}

fn C.ImageColorGrayscale(image &Image)
@[inline]
pub fn image_color_grayscale(image &Image) {
	C.ImageColorGrayscale(image)
}

fn C.ImageColorContrast(image &Image, contrast f32)
@[inline]
pub fn image_color_contrast(image &Image, contrast f32) {
	C.ImageColorContrast(image, contrast)
}

fn C.ImageColorBrightness(image &Image, brightness int)
@[inline]
pub fn image_color_brightness(image &Image, brightness int) {
	C.ImageColorBrightness(image, brightness)
}

fn C.ImageColorReplace(image &Image, color Color, replace Color)
@[inline]
pub fn image_color_replace(image &Image, color Color, replace Color) {
	C.ImageColorReplace(image, color, replace)
}

fn C.LoadImageColors(image Image) &Color
@[inline]
pub fn load_image_colors(image Image) &Color {
	return C.LoadImageColors(image)
}

fn C.LoadImagePalette(image Image, maxPaletteSize int, colorCount &int) &Color
@[inline]
pub fn load_image_palette(image Image, maxPaletteSize int, colorCount &int) &Color {
	return C.LoadImagePalette(image, maxPaletteSize, colorCount)
}

fn C.UnloadImageColors(colors &Color)
@[inline]
pub fn unload_image_colors(colors &Color) {
	C.UnloadImageColors(colors)
}

fn C.UnloadImagePalette(colors &Color)
@[inline]
pub fn unload_image_palette(colors &Color) {
	C.UnloadImagePalette(colors)
}

fn C.GetImageAlphaBorder(image Image, threshold f32) Rectangle
@[inline]
pub fn get_image_alpha_border(image Image, threshold f32) Rectangle {
	return C.GetImageAlphaBorder(image, threshold)
}

fn C.GetImageColor(image Image, x int, y int) Color
@[inline]
pub fn get_image_color(image Image, x int, y int) Color {
	return C.GetImageColor(image, x, y)
}

fn C.ImageClearBackground(dst &Image, color Color)
@[inline]
pub fn image_clear_background(dst &Image, color Color) {
	C.ImageClearBackground(dst, color)
}

fn C.ImageDrawPixel(dst &Image, posX int, posY int, color Color)
@[inline]
pub fn image_draw_pixel(dst &Image, posX int, posY int, color Color) {
	C.ImageDrawPixel(dst, posX, posY, color)
}

fn C.ImageDrawPixelV(dst &Image, position Vector2, color Color)
@[inline]
pub fn image_draw_pixel_v(dst &Image, position Vector2, color Color) {
	C.ImageDrawPixelV(dst, position, color)
}

fn C.ImageDrawLine(dst &Image, startPosX int, startPosY int, endPosX int, endPosY int, color Color)
@[inline]
pub fn image_draw_line(dst &Image, startPosX int, startPosY int, endPosX int, endPosY int, color Color) {
	C.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color)
}

fn C.ImageDrawLineV(dst &Image, start Vector2, end Vector2, color Color)
@[inline]
pub fn image_draw_line_v(dst &Image, start Vector2, end Vector2, color Color) {
	C.ImageDrawLineV(dst, start, end, color)
}

fn C.ImageDrawCircle(dst &Image, centerX int, centerY int, radius int, color Color)
@[inline]
pub fn image_draw_circle(dst &Image, centerX int, centerY int, radius int, color Color) {
	C.ImageDrawCircle(dst, centerX, centerY, radius, color)
}

fn C.ImageDrawCircleV(dst &Image, center Vector2, radius int, color Color)
@[inline]
pub fn image_draw_circle_v(dst &Image, center Vector2, radius int, color Color) {
	C.ImageDrawCircleV(dst, center, radius, color)
}

/*fn C.ImageDrawCircleLines(dst &Image, centerX int, centerY int, radius int, color Color)
[inline]
pub fn image_draw_circle_lines(dst &Image, centerX int, centerY int, radius int, color Color) {
	C.ImageDrawCircleLines(dst, centerX, centerY, radius, color)
}*/

/*fn C.ImageDrawCircleLinesV(dst &Image, center Vector2, radius int, color Color)
[inline]
pub fn image_draw_circle_lines_v(dst &Image, center Vector2, radius int, color Color) {
	C.ImageDrawCircleLinesV(dst, center, radius, color)
}*/

fn C.ImageDrawRectangle(dst &Image, posX int, posY int, width int, height int, color Color)
@[inline]
pub fn image_draw_rectangle(dst &Image, posX int, posY int, width int, height int, color Color) {
	C.ImageDrawRectangle(dst, posX, posY, width, height, color)
}

fn C.ImageDrawRectangleV(dst &Image, position Vector2, size Vector2, color Color)
@[inline]
pub fn image_draw_rectangle_v(dst &Image, position Vector2, size Vector2, color Color) {
	C.ImageDrawRectangleV(dst, position, size, color)
}

fn C.ImageDrawRectangleRec(dst &Image, rec Rectangle, color Color)
@[inline]
pub fn image_draw_rectangle_rec(dst &Image, rec Rectangle, color Color) {
	C.ImageDrawRectangleRec(dst, rec, color)
}

fn C.ImageDrawRectangleLines(dst &Image, rec Rectangle, thick int, color Color)
@[inline]
pub fn image_draw_rectangle_lines(dst &Image, rec Rectangle, thick int, color Color) {
	C.ImageDrawRectangleLines(dst, rec, thick, color)
}

fn C.ImageDraw(dst &Image, src Image, srcRec Rectangle, dstRec Rectangle, tint Color)
@[inline]
pub fn image_draw(dst &Image, src Image, srcRec Rectangle, dstRec Rectangle, tint Color) {
	C.ImageDraw(dst, src, srcRec, dstRec, tint)
}

fn C.ImageDrawText(dst &Image, text &i8, posX int, posY int, fontSize int, color Color)
@[inline]
pub fn image_draw_text(dst &Image, text &i8, posX int, posY int, fontSize int, color Color) {
	C.ImageDrawText(dst, text, posX, posY, fontSize, color)
}

fn C.ImageDrawTextEx(dst &Image, font Font, text &i8, position Vector2, fontSize f32, spacing f32, tint Color)
@[inline]
pub fn image_draw_text_ex(dst &Image, font Font, text &i8, position Vector2, fontSize f32, spacing f32, tint Color) {
	C.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint)
}

fn C.LoadTexture(fileName &i8) Texture2D
@[inline]
pub fn load_texture(fileName &i8) Texture2D {
	return C.LoadTexture(fileName)
}

fn C.LoadTextureFromImage(image Image) Texture2D
@[inline]
pub fn load_texture_from_image(image Image) Texture2D {
	return C.LoadTextureFromImage(image)
}

fn C.LoadTextureCubemap(image Image, layout int) TextureCubemap
@[inline]
pub fn load_texture_cubemap(image Image, layout int) TextureCubemap {
	return C.LoadTextureCubemap(image, layout)
}

fn C.LoadRenderTexture(width int, height int) RenderTexture2D
@[inline]
pub fn load_render_texture(width int, height int) RenderTexture2D {
	return C.LoadRenderTexture(width, height)
}

fn C.UnloadTexture(texture Texture2D)
@[inline]
pub fn unload_texture(texture Texture2D) {
	C.UnloadTexture(texture)
}

fn C.UnloadRenderTexture(target RenderTexture2D)
@[inline]
pub fn unload_render_texture(target RenderTexture2D) {
	C.UnloadRenderTexture(target)
}

fn C.UpdateTexture(texture Texture2D, pixels voidptr)
@[inline]
pub fn update_texture(texture Texture2D, pixels voidptr) {
	C.UpdateTexture(texture, pixels)
}

fn C.UpdateTextureRec(texture Texture2D, rec Rectangle, pixels voidptr)
@[inline]
pub fn update_texture_rec(texture Texture2D, rec Rectangle, pixels voidptr) {
	C.UpdateTextureRec(texture, rec, pixels)
}

fn C.GenTextureMipmaps(texture &Texture2D)
@[inline]
pub fn gen_texture_mipmaps(texture &Texture2D) {
	C.GenTextureMipmaps(texture)
}

fn C.SetTextureFilter(texture Texture2D, filter int)
@[inline]
pub fn set_texture_filter(texture Texture2D, filter int) {
	C.SetTextureFilter(texture, filter)
}

fn C.SetTextureWrap(texture Texture2D, wrap int)
@[inline]
pub fn set_texture_wrap(texture Texture2D, wrap int) {
	C.SetTextureWrap(texture, wrap)
}

fn C.DrawTexture(texture Texture2D, posX int, posY int, tint Color)
@[inline]
pub fn draw_texture(texture Texture2D, posX int, posY int, tint Color) {
	C.DrawTexture(texture, posX, posY, tint)
}

fn C.DrawTextureV(texture Texture2D, position Vector2, tint Color)
@[inline]
pub fn draw_texture_v(texture Texture2D, position Vector2, tint Color) {
	C.DrawTextureV(texture, position, tint)
}

fn C.DrawTextureEx(texture Texture2D, position Vector2, rotation f32, scale f32, tint Color)
@[inline]
pub fn draw_texture_ex(texture Texture2D, position Vector2, rotation f32, scale f32, tint Color) {
	C.DrawTextureEx(texture, position, rotation, scale, tint)
}

fn C.DrawTextureRec(texture Texture2D, source Rectangle, position Vector2, tint Color)
@[inline]
pub fn draw_texture_rec(texture Texture2D, source Rectangle, position Vector2, tint Color) {
	C.DrawTextureRec(texture, source, position, tint)
}

fn C.DrawTextureQuad(texture Texture2D, tiling Vector2, offset Vector2, quad Rectangle, tint Color)
@[inline]
pub fn draw_texture_quad(texture Texture2D, tiling Vector2, offset Vector2, quad Rectangle, tint Color) {
	C.DrawTextureQuad(texture, tiling, offset, quad, tint)
}

fn C.DrawTextureTiled(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, scale f32, tint Color)
@[inline]
pub fn draw_texture_tiled(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, scale f32, tint Color) {
	C.DrawTextureTiled(texture, source, dest, origin, rotation, scale, tint)
}

fn C.DrawTexturePro(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, tint Color)
@[inline]
pub fn draw_texture_pro(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, tint Color) {
	C.DrawTexturePro(texture, source, dest, origin, rotation, tint)
}

fn C.DrawTextureNPatch(texture Texture2D, nPatchInfo NPatchInfo, dest Rectangle, origin Vector2, rotation f32, tint Color)
@[inline]
pub fn draw_texture_n_patch(texture Texture2D, nPatchInfo NPatchInfo, dest Rectangle, origin Vector2, rotation f32, tint Color) {
	C.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint)
}

fn C.DrawTexturePoly(texture Texture2D, center Vector2, points &Vector2, texcoords &Vector2, pointCount int, tint Color)
@[inline]
pub fn draw_texture_poly(texture Texture2D, center Vector2, points &Vector2, texcoords &Vector2, pointCount int, tint Color) {
	C.DrawTexturePoly(texture, center, points, texcoords, pointCount, tint)
}

fn C.Fade(color Color, alpha f32) Color
@[inline]
pub fn fade(color Color, alpha f32) Color {
	return C.Fade(color, alpha)
}

fn C.ColorToInt(color Color) int
@[inline]
pub fn color_to_int(color Color) int {
	return C.ColorToInt(color)
}

fn C.ColorNormalize(color Color) Vector4
@[inline]
pub fn color_normalize(color Color) Vector4 {
	return C.ColorNormalize(color)
}

fn C.ColorFromNormalized(normalized Vector4) Color
@[inline]
pub fn color_from_normalized(normalized Vector4) Color {
	return C.ColorFromNormalized(normalized)
}

fn C.ColorToHSV(color Color) Vector3
@[inline]
pub fn color_to_hsv(color Color) Vector3 {
	return C.ColorToHSV(color)
}

fn C.ColorFromHSV(hue f32, saturation f32, value f32) Color
@[inline]
pub fn color_from_hsv(hue f32, saturation f32, value f32) Color {
	return C.ColorFromHSV(hue, saturation, value)
}

fn C.ColorAlpha(color Color, alpha f32) Color
@[inline]
pub fn color_alpha(color Color, alpha f32) Color {
	return C.ColorAlpha(color, alpha)
}

fn C.ColorAlphaBlend(dst Color, src Color, tint Color) Color
@[inline]
pub fn color_alpha_blend(dst Color, src Color, tint Color) Color {
	return C.ColorAlphaBlend(dst, src, tint)
}

fn C.GetColor(hexValue u32) Color
@[inline]
pub fn get_color(hexValue u32) Color {
	return C.GetColor(hexValue)
}

fn C.GetPixelColor(srcPtr voidptr, format int) Color
@[inline]
pub fn get_pixel_color(srcPtr voidptr, format int) Color {
	return C.GetPixelColor(srcPtr, format)
}

fn C.SetPixelColor(dstPtr voidptr, color Color, format int)
@[inline]
pub fn set_pixel_color(dstPtr voidptr, color Color, format int) {
	C.SetPixelColor(dstPtr, color, format)
}

fn C.GetPixelDataSize(width int, height int, format int) int
@[inline]
pub fn get_pixel_data_size(width int, height int, format int) int {
	return C.GetPixelDataSize(width, height, format)
}

fn C.GetFontDefault() Font
@[inline]
pub fn get_font_default() Font {
	return C.GetFontDefault()
}

fn C.LoadFont(fileName &i8) Font
@[inline]
pub fn load_font(fileName &i8) Font {
	return C.LoadFont(fileName)
}

fn C.LoadFontEx(fileName &i8, fontSize int, fontChars &int, glyphCount int) Font
@[inline]
pub fn load_font_ex(fileName &i8, fontSize int, fontChars &int, glyphCount int) Font {
	return C.LoadFontEx(fileName, fontSize, fontChars, glyphCount)
}

fn C.LoadFontFromImage(image Image, key Color, firstChar int) Font
@[inline]
pub fn load_font_from_image(image Image, key Color, firstChar int) Font {
	return C.LoadFontFromImage(image, key, firstChar)
}

fn C.LoadFontFromMemory(fileType &i8, fileData &u8, dataSize int, fontSize int, fontChars &int, glyphCount int) Font
@[inline]
pub fn load_font_from_memory(fileType &i8, fileData &u8, dataSize int, fontSize int, fontChars &int, glyphCount int) Font {
	return C.LoadFontFromMemory(fileType, fileData, dataSize, fontSize, fontChars, glyphCount)
}

fn C.LoadFontData(fileData &u8, dataSize int, fontSize int, fontChars &int, glyphCount int, @type int) &GlyphInfo
@[inline]
pub fn load_font_data(fileData &u8, dataSize int, fontSize int, fontChars &int, glyphCount int, @type int) &GlyphInfo {
	return C.LoadFontData(fileData, dataSize, fontSize, fontChars, glyphCount, @type)
}

fn C.GenImageFontAtlas(chars &GlyphInfo, recs &&Rectangle, glyphCount int, fontSize int, padding int, packMethod int) Image
@[inline]
pub fn gen_image_font_atlas(chars &GlyphInfo, recs &&Rectangle, glyphCount int, fontSize int, padding int, packMethod int) Image {
	return C.GenImageFontAtlas(chars, recs, glyphCount, fontSize, padding, packMethod)
}

fn C.UnloadFontData(chars &GlyphInfo, glyphCount int)
@[inline]
pub fn unload_font_data(chars &GlyphInfo, glyphCount int) {
	C.UnloadFontData(chars, glyphCount)
}

fn C.UnloadFont(font Font)
@[inline]
pub fn unload_font(font Font) {
	C.UnloadFont(font)
}

fn C.ExportFontAsCode(font Font, fileName &i8) bool
@[inline]
pub fn export_font_as_code(font Font, fileName &i8) bool {
	return C.ExportFontAsCode(font, fileName)
}

fn C.DrawFPS(posX int, posY int)
@[inline]
pub fn draw_fps(posX int, posY int) {
	C.DrawFPS(posX, posY)
}

fn C.DrawText(text &i8, posX int, posY int, fontSize int, color Color)
@[inline]
pub fn draw_text(text &i8, posX int, posY int, fontSize int, color Color) {
	C.DrawText(text, posX, posY, fontSize, color)
}

fn C.DrawTextEx(font Font, text &i8, position Vector2, fontSize f32, spacing f32, tint Color)
@[inline]
pub fn draw_text_ex(font Font, text &i8, position Vector2, fontSize f32, spacing f32, tint Color) {
	C.DrawTextEx(font, text, position, fontSize, spacing, tint)
}

fn C.DrawTextPro(font Font, text &i8, position Vector2, origin Vector2, rotation f32, fontSize f32, spacing f32, tint Color)
@[inline]
pub fn draw_text_pro(font Font, text &i8, position Vector2, origin Vector2, rotation f32, fontSize f32, spacing f32, tint Color) {
	C.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint)
}

fn C.DrawTextCodepoint(font Font, codepoint int, position Vector2, fontSize f32, tint Color)
@[inline]
pub fn draw_text_codepoint(font Font, codepoint int, position Vector2, fontSize f32, tint Color) {
	C.DrawTextCodepoint(font, codepoint, position, fontSize, tint)
}

fn C.DrawTextCodepoints(font Font, codepoints &int, count int, position Vector2, fontSize f32, spacing f32, tint Color)
@[inline]
pub fn draw_text_codepoints(font Font, codepoints &int, count int, position Vector2, fontSize f32, spacing f32, tint Color) {
	C.DrawTextCodepoints(font, codepoints, count, position, fontSize, spacing, tint)
}

fn C.MeasureText(text &i8, fontSize int) int
@[inline]
pub fn measure_text(text &i8, fontSize int) int {
	return C.MeasureText(text, fontSize)
}

fn C.MeasureTextEx(font Font, text &i8, fontSize f32, spacing f32) Vector2
@[inline]
pub fn measure_text_ex(font Font, text &i8, fontSize f32, spacing f32) Vector2 {
	return C.MeasureTextEx(font, text, fontSize, spacing)
}

fn C.GetGlyphIndex(font Font, codepoint int) int
@[inline]
pub fn get_glyph_index(font Font, codepoint int) int {
	return C.GetGlyphIndex(font, codepoint)
}

fn C.GetGlyphInfo(font Font, codepoint int) GlyphInfo
@[inline]
pub fn get_glyph_info(font Font, codepoint int) GlyphInfo {
	return C.GetGlyphInfo(font, codepoint)
}

fn C.GetGlyphAtlasRec(font Font, codepoint int) Rectangle
@[inline]
pub fn get_glyph_atlas_rec(font Font, codepoint int) Rectangle {
	return C.GetGlyphAtlasRec(font, codepoint)
}

/*fn C.LoadUTF8(codepoints &int, length int) &char
[inline]
pub fn load_utf8(codepoints &int, length int) &char {
	return C.LoadUTF8(codepoints, length)
}*/

fn C.UnloadUTF8(text &char)

// todo

fn C.LoadCodepoints(text &i8, count &int) &int
@[inline]
pub fn load_codepoints(text &i8, count &int) &int {
	return C.LoadCodepoints(text, count)
}

fn C.UnloadCodepoints(codepoints &int)
@[inline]
pub fn unload_codepoints(codepoints &int) {
	C.UnloadCodepoints(codepoints)
}

fn C.GetCodepointCount(text &char) int
@[inline]
pub fn get_codepoint_count(text &char) int {
	return C.GetCodepointCount(text)
}

fn C.GetCodepoint(text &i8, codepointSize &int) int
@[inline]
pub fn get_codepoint(text &i8, codepointSize &int) int {
	return C.GetCodepoint(text, codepointSize)
}

fn C.GetCodepointNext(text &i8, codepointSize &int) int

// todo
fn C.GetCodepointPrevious(text &i8, codepointSize &int) int

// todo

fn C.CodepointToUTF8(codepoint int, utf8Size &int) &i8
@[inline]
pub fn codepoint_to_utf_8(codepoint int, utf8Size &int) &i8 {
	return C.CodepointToUTF8(codepoint, utf8Size)
}

fn C.TextCopy(dst &i8, src &i8) int
@[inline]
pub fn text_copy(dst &i8, src &i8) int {
	return C.TextCopy(dst, src)
}

fn C.TextIsEqual(text1 &i8, text2 &i8) bool
@[inline]
pub fn text_is_equal(text1 &i8, text2 &i8) bool {
	return C.TextIsEqual(text1, text2)
}

fn C.TextLength(text &i8) u32
@[inline]
pub fn text_length(text &i8) u32 {
	return C.TextLength(text)
}

fn C.TextSubtext(text &i8, position int, length int) &i8
@[inline]
pub fn text_subtext(text &i8, position int, length int) &i8 {
	return C.TextSubtext(text, position, length)
}

fn C.TextReplace(text &i8, replace &i8, by &i8) &i8
@[inline]
pub fn text_replace(text &i8, replace &i8, by &i8) &i8 {
	return C.TextReplace(text, replace, by)
}

fn C.TextInsert(text &i8, insert &i8, position int) &i8
@[inline]
pub fn text_insert(text &i8, insert &i8, position int) &i8 {
	return C.TextInsert(text, insert, position)
}

fn C.TextJoin(textList &&i8, count int, delimiter &i8) &i8
@[inline]
pub fn text_join(textList &&i8, count int, delimiter &i8) &i8 {
	return C.TextJoin(textList, count, delimiter)
}

fn C.TextSplit(text &i8, delimiter i8, count &int) &&i8
@[inline]
pub fn text_split(text &i8, delimiter i8, count &int) &&i8 {
	return C.TextSplit(text, delimiter, count)
}

fn C.TextAppend(text &i8, append &i8, position &int)
@[inline]
pub fn text_append(text &i8, append &i8, position &int) {
	C.TextAppend(text, append, position)
}

fn C.TextFindIndex(text &i8, find &i8) int
@[inline]
pub fn text_find_index(text &i8, find &i8) int {
	return C.TextFindIndex(text, find)
}

fn C.TextToUpper(text &i8) &i8
@[inline]
pub fn text_to_upper(text &i8) &i8 {
	return C.TextToUpper(text)
}

fn C.TextToLower(text &i8) &i8
@[inline]
pub fn text_to_lower(text &i8) &i8 {
	return C.TextToLower(text)
}

fn C.TextToPascal(text &i8) &i8
@[inline]
pub fn text_to_pascal(text &i8) &i8 {
	return C.TextToPascal(text)
}

fn C.TextToInteger(text &i8) int
@[inline]
pub fn text_to_integer(text &i8) int {
	return C.TextToInteger(text)
}

fn C.DrawLine3D(startPos Vector3, endPos Vector3, color Color)
@[inline]
pub fn draw_line_3d(startPos Vector3, endPos Vector3, color Color) {
	C.DrawLine3D(startPos, endPos, color)
}

fn C.DrawPoint3D(position Vector3, color Color)
@[inline]
pub fn draw_point_3d(position Vector3, color Color) {
	C.DrawPoint3D(position, color)
}

fn C.DrawCircle3D(center Vector3, radius f32, rotationAxis Vector3, rotationAngle f32, color Color)
@[inline]
pub fn draw_circle_3d(center Vector3, radius f32, rotationAxis Vector3, rotationAngle f32, color Color) {
	C.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color)
}

fn C.DrawTriangle3D(v1 Vector3, v2 Vector3, v3 Vector3, color Color)
@[inline]
pub fn draw_triangle_3d(v1 Vector3, v2 Vector3, v3 Vector3, color Color) {
	C.DrawTriangle3D(v1, v2, v3, color)
}

fn C.DrawTriangleStrip3D(points &Vector3, pointCount int, color Color)
@[inline]
pub fn draw_triangle_strip_3d(points &Vector3, pointCount int, color Color) {
	C.DrawTriangleStrip3D(points, pointCount, color)
}

fn C.DrawCube(position Vector3, width f32, height f32, length f32, color Color)
@[inline]
pub fn draw_cube(position Vector3, width f32, height f32, length f32, color Color) {
	C.DrawCube(position, width, height, length, color)
}

fn C.DrawCubeV(position Vector3, size Vector3, color Color)
@[inline]
pub fn draw_cube_v(position Vector3, size Vector3, color Color) {
	C.DrawCubeV(position, size, color)
}

fn C.DrawCubeWires(position Vector3, width f32, height f32, length f32, color Color)
@[inline]
pub fn draw_cube_wires(position Vector3, width f32, height f32, length f32, color Color) {
	C.DrawCubeWires(position, width, height, length, color)
}

fn C.DrawCubeWiresV(position Vector3, size Vector3, color Color)
@[inline]
pub fn draw_cube_wires_v(position Vector3, size Vector3, color Color) {
	C.DrawCubeWiresV(position, size, color)
}

fn C.DrawCubeTexture(texture Texture2D, position Vector3, width f32, height f32, length f32, color Color)
@[inline]
pub fn draw_cube_texture(texture Texture2D, position Vector3, width f32, height f32, length f32, color Color) {
	C.DrawCubeTexture(texture, position, width, height, length, color)
}

fn C.DrawCubeTextureRec(texture Texture2D, source Rectangle, position Vector3, width f32, height f32, length f32, color Color)
@[inline]
pub fn draw_cube_texture_rec(texture Texture2D, source Rectangle, position Vector3, width f32, height f32, length f32, color Color) {
	C.DrawCubeTextureRec(texture, source, position, width, height, length, color)
}

fn C.DrawSphere(centerPos Vector3, radius f32, color Color)
@[inline]
pub fn draw_sphere(centerPos Vector3, radius f32, color Color) {
	C.DrawSphere(centerPos, radius, color)
}

fn C.DrawSphereEx(centerPos Vector3, radius f32, rings int, slices int, color Color)
@[inline]
pub fn draw_sphere_ex(centerPos Vector3, radius f32, rings int, slices int, color Color) {
	C.DrawSphereEx(centerPos, radius, rings, slices, color)
}

fn C.DrawSphereWires(centerPos Vector3, radius f32, rings int, slices int, color Color)
@[inline]
pub fn draw_sphere_wires(centerPos Vector3, radius f32, rings int, slices int, color Color) {
	C.DrawSphereWires(centerPos, radius, rings, slices, color)
}

fn C.DrawCylinder(position Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color Color)
@[inline]
pub fn draw_cylinder(position Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color Color) {
	C.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color)
}

fn C.DrawCylinderEx(startPos Vector3, endPos Vector3, startRadius f32, endRadius f32, sides int, color Color)
@[inline]
pub fn draw_cylinder_ex(startPos Vector3, endPos Vector3, startRadius f32, endRadius f32, sides int, color Color) {
	C.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color)
}

fn C.DrawCylinderWires(position Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color Color)
@[inline]
pub fn draw_cylinder_wires(position Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color Color) {
	C.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color)
}

fn C.DrawCylinderWiresEx(startPos Vector3, endPos Vector3, startRadius f32, endRadius f32, sides int, color Color)
@[inline]
pub fn draw_cylinder_wires_ex(startPos Vector3, endPos Vector3, startRadius f32, endRadius f32, sides int, color Color) {
	C.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color)
}

fn C.DrawPlane(centerPos Vector3, size Vector2, color Color)
@[inline]
pub fn draw_plane(centerPos Vector3, size Vector2, color Color) {
	C.DrawPlane(centerPos, size, color)
}

fn C.DrawRay(ray Ray, color Color)
@[inline]
pub fn draw_ray(ray Ray, color Color) {
	C.DrawRay(ray, color)
}

fn C.DrawGrid(slices int, spacing f32)
@[inline]
pub fn draw_grid(slices int, spacing f32) {
	C.DrawGrid(slices, spacing)
}

fn C.LoadModel(fileName &i8) Model
@[inline]
pub fn load_model(fileName &i8) Model {
	return C.LoadModel(fileName)
}

fn C.LoadModelFromMesh(mesh Mesh) Model
@[inline]
pub fn load_model_from_mesh(mesh Mesh) Model {
	return C.LoadModelFromMesh(mesh)
}

fn C.UnloadModel(model Model)
@[inline]
pub fn unload_model(model Model) {
	C.UnloadModel(model)
}

fn C.UnloadModelKeepMeshes(model Model)
@[inline]
pub fn unload_model_keep_meshes(model Model) {
	C.UnloadModelKeepMeshes(model)
}

fn C.GetModelBoundingBox(model Model) BoundingBox
@[inline]
pub fn get_model_bounding_box(model Model) BoundingBox {
	return C.GetModelBoundingBox(model)
}

fn C.DrawModel(model Model, position Vector3, scale f32, tint Color)
@[inline]
pub fn draw_model(model Model, position Vector3, scale f32, tint Color) {
	C.DrawModel(model, position, scale, tint)
}

fn C.DrawModelEx(model Model, position Vector3, rotationAxis Vector3, rotationAngle f32, scale Vector3, tint Color)
@[inline]
pub fn draw_model_ex(model Model, position Vector3, rotationAxis Vector3, rotationAngle f32, scale Vector3, tint Color) {
	C.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint)
}

fn C.DrawModelWires(model Model, position Vector3, scale f32, tint Color)
@[inline]
pub fn draw_model_wires(model Model, position Vector3, scale f32, tint Color) {
	C.DrawModelWires(model, position, scale, tint)
}

fn C.DrawModelWiresEx(model Model, position Vector3, rotationAxis Vector3, rotationAngle f32, scale Vector3, tint Color)
@[inline]
pub fn draw_model_wires_ex(model Model, position Vector3, rotationAxis Vector3, rotationAngle f32, scale Vector3, tint Color) {
	C.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint)
}

fn C.DrawBoundingBox(box BoundingBox, color Color)
@[inline]
pub fn draw_bounding_box(box BoundingBox, color Color) {
	C.DrawBoundingBox(box, color)
}

fn C.DrawBillboard(camera Camera, texture Texture2D, position Vector3, size f32, tint Color)
@[inline]
pub fn draw_billboard(camera Camera, texture Texture2D, position Vector3, size f32, tint Color) {
	C.DrawBillboard(camera, texture, position, size, tint)
}

fn C.DrawBillboardRec(camera Camera, texture Texture2D, source Rectangle, position Vector3, size Vector2, tint Color)
@[inline]
pub fn draw_billboard_rec(camera Camera, texture Texture2D, source Rectangle, position Vector3, size Vector2, tint Color) {
	C.DrawBillboardRec(camera, texture, source, position, size, tint)
}

fn C.DrawBillboardPro(camera Camera, texture Texture2D, source Rectangle, position Vector3, up Vector3, size Vector2, origin Vector2, rotation f32, tint Color)
@[inline]
pub fn draw_billboard_pro(camera Camera, texture Texture2D, source Rectangle, position Vector3, up Vector3, size Vector2, origin Vector2, rotation f32, tint Color) {
	C.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation,
		tint)
}

fn C.UploadMesh(mesh &Mesh, dynamic bool)
@[inline]
pub fn upload_mesh(mesh &Mesh, dynamic bool) {
	C.UploadMesh(mesh, dynamic)
}

fn C.UpdateMeshBuffer(mesh Mesh, index int, data voidptr, dataSize int, offset int)
@[inline]
pub fn update_mesh_buffer(mesh Mesh, index int, data voidptr, dataSize int, offset int) {
	C.UpdateMeshBuffer(mesh, index, data, dataSize, offset)
}

fn C.UnloadMesh(mesh Mesh)
@[inline]
pub fn unload_mesh(mesh Mesh) {
	C.UnloadMesh(mesh)
}

fn C.DrawMesh(mesh Mesh, material Material, transform Matrix)
@[inline]
pub fn draw_mesh(mesh Mesh, material Material, transform Matrix) {
	C.DrawMesh(mesh, material, transform)
}

fn C.DrawMeshInstanced(mesh Mesh, material Material, transforms &Matrix, instances int)
@[inline]
pub fn draw_mesh_instanced(mesh Mesh, material Material, transforms &Matrix, instances int) {
	C.DrawMeshInstanced(mesh, material, transforms, instances)
}

fn C.ExportMesh(mesh Mesh, fileName &i8) bool
@[inline]
pub fn export_mesh(mesh Mesh, fileName &i8) bool {
	return C.ExportMesh(mesh, fileName)
}

fn C.GetMeshBoundingBox(mesh Mesh) BoundingBox
@[inline]
pub fn get_mesh_bounding_box(mesh Mesh) BoundingBox {
	return C.GetMeshBoundingBox(mesh)
}

fn C.GenMeshTangents(mesh &Mesh)
@[inline]
pub fn gen_mesh_tangents(mesh &Mesh) {
	C.GenMeshTangents(mesh)
}

fn C.GenMeshPoly(sides int, radius f32) Mesh
@[inline]
pub fn gen_mesh_poly(sides int, radius f32) Mesh {
	return C.GenMeshPoly(sides, radius)
}

fn C.GenMeshPlane(width f32, length f32, resX int, resZ int) Mesh
@[inline]
pub fn gen_mesh_plane(width f32, length f32, resX int, resZ int) Mesh {
	return C.GenMeshPlane(width, length, resX, resZ)
}

fn C.GenMeshCube(width f32, height f32, length f32) Mesh
@[inline]
pub fn gen_mesh_cube(width f32, height f32, length f32) Mesh {
	return C.GenMeshCube(width, height, length)
}

fn C.GenMeshSphere(radius f32, rings int, slices int) Mesh
@[inline]
pub fn gen_mesh_sphere(radius f32, rings int, slices int) Mesh {
	return C.GenMeshSphere(radius, rings, slices)
}

fn C.GenMeshHemiSphere(radius f32, rings int, slices int) Mesh
@[inline]
pub fn gen_mesh_hemi_sphere(radius f32, rings int, slices int) Mesh {
	return C.GenMeshHemiSphere(radius, rings, slices)
}

fn C.GenMeshCylinder(radius f32, height f32, slices int) Mesh
@[inline]
pub fn gen_mesh_cylinder(radius f32, height f32, slices int) Mesh {
	return C.GenMeshCylinder(radius, height, slices)
}

fn C.GenMeshCone(radius f32, height f32, slices int) Mesh
@[inline]
pub fn gen_mesh_cone(radius f32, height f32, slices int) Mesh {
	return C.GenMeshCone(radius, height, slices)
}

fn C.GenMeshTorus(radius f32, size f32, radSeg int, sides int) Mesh
@[inline]
pub fn gen_mesh_torus(radius f32, size f32, radSeg int, sides int) Mesh {
	return C.GenMeshTorus(radius, size, radSeg, sides)
}

fn C.GenMeshKnot(radius f32, size f32, radSeg int, sides int) Mesh
@[inline]
pub fn gen_mesh_knot(radius f32, size f32, radSeg int, sides int) Mesh {
	return C.GenMeshKnot(radius, size, radSeg, sides)
}

fn C.GenMeshHeightmap(heightmap Image, size Vector3) Mesh
@[inline]
pub fn gen_mesh_heightmap(heightmap Image, size Vector3) Mesh {
	return C.GenMeshHeightmap(heightmap, size)
}

fn C.GenMeshCubicmap(cubicmap Image, cubeSize Vector3) Mesh
@[inline]
pub fn gen_mesh_cubicmap(cubicmap Image, cubeSize Vector3) Mesh {
	return C.GenMeshCubicmap(cubicmap, cubeSize)
}

fn C.LoadMaterials(fileName &i8, materialCount &int) &Material
@[inline]
pub fn load_materials(fileName &i8, materialCount &int) &Material {
	return C.LoadMaterials(fileName, materialCount)
}

fn C.LoadMaterialDefault() Material
@[inline]
pub fn load_material_default() Material {
	return C.LoadMaterialDefault()
}

fn C.UnloadMaterial(material Material)
@[inline]
pub fn unload_material(material Material) {
	C.UnloadMaterial(material)
}

fn C.SetMaterialTexture(material &Material, mapType int, texture Texture2D)
@[inline]
pub fn set_material_texture(material &Material, mapType int, texture Texture2D) {
	C.SetMaterialTexture(material, mapType, texture)
}

fn C.SetModelMeshMaterial(model &Model, meshId int, materialId int)
@[inline]
pub fn set_model_mesh_material(model &Model, meshId int, materialId int) {
	C.SetModelMeshMaterial(model, meshId, materialId)
}

fn C.LoadModelAnimations(fileName &i8, animCount &u32) &ModelAnimation
@[inline]
pub fn load_model_animations(fileName &i8, animCount &u32) &ModelAnimation {
	return C.LoadModelAnimations(fileName, animCount)
}

fn C.UpdateModelAnimation(model Model, anim ModelAnimation, frame int)
@[inline]
pub fn update_model_animation(model Model, anim ModelAnimation, frame int) {
	C.UpdateModelAnimation(model, anim, frame)
}

fn C.UnloadModelAnimation(anim ModelAnimation)
@[inline]
pub fn unload_model_animation(anim ModelAnimation) {
	C.UnloadModelAnimation(anim)
}

fn C.UnloadModelAnimations(animations &ModelAnimation, count u32)
@[inline]
pub fn unload_model_animations(animations &ModelAnimation, count u32) {
	C.UnloadModelAnimations(animations, count)
}

fn C.IsModelAnimationValid(model Model, anim ModelAnimation) bool
@[inline]
pub fn is_model_animation_valid(model Model, anim ModelAnimation) bool {
	return C.IsModelAnimationValid(model, anim)
}

fn C.CheckCollisionSpheres(center1 Vector3, radius1 f32, center2 Vector3, radius2 f32) bool
@[inline]
pub fn check_collision_spheres(center1 Vector3, radius1 f32, center2 Vector3, radius2 f32) bool {
	return C.CheckCollisionSpheres(center1, radius1, center2, radius2)
}

fn C.CheckCollisionBoxes(box1 BoundingBox, box2 BoundingBox) bool
@[inline]
pub fn check_collision_boxes(box1 BoundingBox, box2 BoundingBox) bool {
	return C.CheckCollisionBoxes(box1, box2)
}

fn C.CheckCollisionBoxSphere(box BoundingBox, center Vector3, radius f32) bool
@[inline]
pub fn check_collision_box_sphere(box BoundingBox, center Vector3, radius f32) bool {
	return C.CheckCollisionBoxSphere(box, center, radius)
}

fn C.GetRayCollisionSphere(ray Ray, center Vector3, radius f32) RayCollision
@[inline]
pub fn get_ray_collision_sphere(ray Ray, center Vector3, radius f32) RayCollision {
	return C.GetRayCollisionSphere(ray, center, radius)
}

fn C.GetRayCollisionBox(ray Ray, box BoundingBox) RayCollision
@[inline]
pub fn get_ray_collision_box(ray Ray, box BoundingBox) RayCollision {
	return C.GetRayCollisionBox(ray, box)
}

fn C.GetRayCollisionMesh(ray Ray, mesh Mesh, transform Matrix) RayCollision
@[inline]
pub fn get_ray_collision_mesh(ray Ray, mesh Mesh, transform Matrix) RayCollision {
	return C.GetRayCollisionMesh(ray, mesh, transform)
}

fn C.GetRayCollisionTriangle(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3) RayCollision
@[inline]
pub fn get_ray_collision_triangle(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3) RayCollision {
	return C.GetRayCollisionTriangle(ray, p1, p2, p3)
}

fn C.GetRayCollisionQuad(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3, p4 Vector3) RayCollision
@[inline]
pub fn get_ray_collision_quad(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3, p4 Vector3) RayCollision {
	return C.GetRayCollisionQuad(ray, p1, p2, p3, p4)
}

fn C.InitAudioDevice()
@[inline]
pub fn init_audio_device() {
	C.InitAudioDevice()
}

fn C.CloseAudioDevice()
@[inline]
pub fn close_audio_device() {
	C.CloseAudioDevice()
}

fn C.IsAudioDeviceReady() bool
@[inline]
pub fn is_audio_device_ready() bool {
	return C.IsAudioDeviceReady()
}

fn C.SetMasterVolume(volume f32)
@[inline]
pub fn set_master_volume(volume f32) {
	C.SetMasterVolume(volume)
}

fn C.LoadWave(fileName &i8) Wave
@[inline]
pub fn load_wave(fileName &i8) Wave {
	return C.LoadWave(fileName)
}

fn C.LoadWaveFromMemory(fileType &i8, fileData &u8, dataSize int) Wave
@[inline]
pub fn load_wave_from_memory(fileType &i8, fileData &u8, dataSize int) Wave {
	return C.LoadWaveFromMemory(fileType, fileData, dataSize)
}

fn C.LoadSound(fileName &i8) Sound
@[inline]
pub fn load_sound(fileName &i8) Sound {
	return C.LoadSound(fileName)
}

fn C.LoadSoundFromWave(wave Wave) Sound
@[inline]
pub fn load_sound_from_wave(wave Wave) Sound {
	return C.LoadSoundFromWave(wave)
}

fn C.UpdateSound(sound Sound, data voidptr, sampleCount int)
@[inline]
pub fn update_sound(sound Sound, data voidptr, sampleCount int) {
	C.UpdateSound(sound, data, sampleCount)
}

fn C.UnloadWave(wave Wave)
@[inline]
pub fn unload_wave(wave Wave) {
	C.UnloadWave(wave)
}

fn C.UnloadSound(sound Sound)
@[inline]
pub fn unload_sound(sound Sound) {
	C.UnloadSound(sound)
}

fn C.ExportWave(wave Wave, fileName &i8) bool
@[inline]
pub fn export_wave(wave Wave, fileName &i8) bool {
	return C.ExportWave(wave, fileName)
}

fn C.ExportWaveAsCode(wave Wave, fileName &i8) bool
@[inline]
pub fn export_wave_as_code(wave Wave, fileName &i8) bool {
	return C.ExportWaveAsCode(wave, fileName)
}

fn C.PlaySound(sound Sound)
@[inline]
pub fn play_sound(sound Sound) {
	C.PlaySound(sound)
}

fn C.StopSound(sound Sound)
@[inline]
pub fn stop_sound(sound Sound) {
	C.StopSound(sound)
}

fn C.PauseSound(sound Sound)
@[inline]
pub fn pause_sound(sound Sound) {
	C.PauseSound(sound)
}

fn C.ResumeSound(sound Sound)
@[inline]
pub fn resume_sound(sound Sound) {
	C.ResumeSound(sound)
}

fn C.PlaySoundMulti(sound Sound)
@[inline]
pub fn play_sound_multi(sound Sound) {
	C.PlaySoundMulti(sound)
}

fn C.StopSoundMulti()
@[inline]
pub fn stop_sound_multi() {
	C.StopSoundMulti()
}

fn C.GetSoundsPlaying() int
@[inline]
pub fn get_sounds_playing() int {
	return C.GetSoundsPlaying()
}

fn C.IsSoundPlaying(sound Sound) bool
@[inline]
pub fn is_sound_playing(sound Sound) bool {
	return C.IsSoundPlaying(sound)
}

fn C.SetSoundVolume(sound Sound, volume f32)
@[inline]
pub fn set_sound_volume(sound Sound, volume f32) {
	C.SetSoundVolume(sound, volume)
}

fn C.SetSoundPitch(sound Sound, pitch f32)
@[inline]
pub fn set_sound_pitch(sound Sound, pitch f32) {
	C.SetSoundPitch(sound, pitch)
}

fn C.SetSoundPan(sound Sound, pan f32)
@[inline]
pub fn set_sound_pan(sound Sound, pan f32) {
	C.SetSoundPan(sound, pan)
}

fn C.WaveCopy(wave Wave) Wave
@[inline]
pub fn wave_copy(wave Wave) Wave {
	return C.WaveCopy(wave)
}

fn C.WaveCrop(wave &Wave, initSample int, finalSample int)
@[inline]
pub fn wave_crop(wave &Wave, initSample int, finalSample int) {
	C.WaveCrop(wave, initSample, finalSample)
}

fn C.WaveFormat(wave &Wave, sampleRate int, sampleSize int, channels int)
@[inline]
pub fn wave_format(wave &Wave, sampleRate int, sampleSize int, channels int) {
	C.WaveFormat(wave, sampleRate, sampleSize, channels)
}

fn C.LoadWaveSamples(wave Wave) &f32
@[inline]
pub fn load_wave_samples(wave Wave) &f32 {
	return C.LoadWaveSamples(wave)
}

fn C.UnloadWaveSamples(samples &f32)
@[inline]
pub fn unload_wave_samples(samples &f32) {
	C.UnloadWaveSamples(samples)
}

fn C.LoadMusicStream(fileName &i8) Music
@[inline]
pub fn load_music_stream(fileName &i8) Music {
	return C.LoadMusicStream(fileName)
}

fn C.LoadMusicStreamFromMemory(fileType &i8, data &u8, dataSize int) Music
@[inline]
pub fn load_music_stream_from_memory(fileType &i8, data &u8, dataSize int) Music {
	return C.LoadMusicStreamFromMemory(fileType, data, dataSize)
}

fn C.UnloadMusicStream(music Music)
@[inline]
pub fn unload_music_stream(music Music) {
	C.UnloadMusicStream(music)
}

fn C.PlayMusicStream(music Music)
@[inline]
pub fn play_music_stream(music Music) {
	C.PlayMusicStream(music)
}

fn C.IsMusicStreamPlaying(music Music) bool
@[inline]
pub fn is_music_stream_playing(music Music) bool {
	return C.IsMusicStreamPlaying(music)
}

fn C.UpdateMusicStream(music Music)
@[inline]
pub fn update_music_stream(music Music) {
	C.UpdateMusicStream(music)
}

fn C.StopMusicStream(music Music)
@[inline]
pub fn stop_music_stream(music Music) {
	C.StopMusicStream(music)
}

fn C.PauseMusicStream(music Music)
@[inline]
pub fn pause_music_stream(music Music) {
	C.PauseMusicStream(music)
}

fn C.ResumeMusicStream(music Music)
@[inline]
pub fn resume_music_stream(music Music) {
	C.ResumeMusicStream(music)
}

fn C.SeekMusicStream(music Music, position f32)
@[inline]
pub fn seek_music_stream(music Music, position f32) {
	C.SeekMusicStream(music, position)
}

fn C.SetMusicVolume(music Music, volume f32)
@[inline]
pub fn set_music_volume(music Music, volume f32) {
	C.SetMusicVolume(music, volume)
}

fn C.SetMusicPitch(music Music, pitch f32)
@[inline]
pub fn set_music_pitch(music Music, pitch f32) {
	C.SetMusicPitch(music, pitch)
}

fn C.SetMusicPan(music Music, pan f32)
@[inline]
pub fn set_music_pan(music Music, pan f32) {
	C.SetMusicPan(music, pan)
}

fn C.GetMusicTimeLength(music Music) f32
@[inline]
pub fn get_music_time_length(music Music) f32 {
	return C.GetMusicTimeLength(music)
}

fn C.GetMusicTimePlayed(music Music) f32
@[inline]
pub fn get_music_time_played(music Music) f32 {
	return C.GetMusicTimePlayed(music)
}

fn C.LoadAudioStream(sampleRate u32, sampleSize u32, channels u32) AudioStream
@[inline]
pub fn load_audio_stream(sampleRate u32, sampleSize u32, channels u32) AudioStream {
	return C.LoadAudioStream(sampleRate, sampleSize, channels)
}

fn C.UnloadAudioStream(stream AudioStream)
@[inline]
pub fn unload_audio_stream(stream AudioStream) {
	C.UnloadAudioStream(stream)
}

fn C.UpdateAudioStream(stream AudioStream, data voidptr, frameCount int)
@[inline]
pub fn update_audio_stream(stream AudioStream, data voidptr, frameCount int) {
	C.UpdateAudioStream(stream, data, frameCount)
}

fn C.IsAudioStreamProcessed(stream AudioStream) bool
@[inline]
pub fn is_audio_stream_processed(stream AudioStream) bool {
	return C.IsAudioStreamProcessed(stream)
}

fn C.PlayAudioStream(stream AudioStream)
@[inline]
pub fn play_audio_stream(stream AudioStream) {
	C.PlayAudioStream(stream)
}

fn C.PauseAudioStream(stream AudioStream)
@[inline]
pub fn pause_audio_stream(stream AudioStream) {
	C.PauseAudioStream(stream)
}

fn C.ResumeAudioStream(stream AudioStream)
@[inline]
pub fn resume_audio_stream(stream AudioStream) {
	C.ResumeAudioStream(stream)
}

fn C.IsAudioStreamPlaying(stream AudioStream) bool
@[inline]
pub fn is_audio_stream_playing(stream AudioStream) bool {
	return C.IsAudioStreamPlaying(stream)
}

fn C.StopAudioStream(stream AudioStream)
@[inline]
pub fn stop_audio_stream(stream AudioStream) {
	C.StopAudioStream(stream)
}

fn C.SetAudioStreamVolume(stream AudioStream, volume f32)
@[inline]
pub fn set_audio_stream_volume(stream AudioStream, volume f32) {
	C.SetAudioStreamVolume(stream, volume)
}

fn C.SetAudioStreamPitch(stream AudioStream, pitch f32)
@[inline]
pub fn set_audio_stream_pitch(stream AudioStream, pitch f32) {
	C.SetAudioStreamPitch(stream, pitch)
}

fn C.SetAudioStreamPan(stream AudioStream, pan f32)
@[inline]
pub fn set_audio_stream_pan(stream AudioStream, pan f32) {
	C.SetAudioStreamPan(stream, pan)
}

fn C.SetAudioStreamBufferSizeDefault(size int)
@[inline]
pub fn set_audio_stream_buffer_size_default(size int) {
	C.SetAudioStreamBufferSizeDefault(size)
}

fn C.SetAudioStreamCallback(stream AudioStream, callback voidptr)
@[inline]
pub fn set_audio_stream_callback(stream AudioStream, callback voidptr) {
	C.SetAudioStreamCallback(stream, callback)
}

fn C.AttachAudioStreamProcessor(stream AudioStream, processor voidptr)
@[inline]
pub fn attach_audio_stream_processor(stream AudioStream, processor voidptr) {
	C.AttachAudioStreamProcessor(stream, processor)
}

fn C.DetachAudioStreamProcessor(stream AudioStream, processor voidptr)
@[inline]
pub fn detach_audio_stream_processor(stream AudioStream, processor voidptr) {
	C.DetachAudioStreamProcessor(stream, processor)
}

// end functions
