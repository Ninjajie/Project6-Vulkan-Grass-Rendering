
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 1, binding = 0) uniform ModelBufferObject {
    mat4 model;
};

// TODO: Declare vertex shader inputs and outputs
layout (location = 0) in vec4 v0;
layout (location = 1) in vec4 v1;
layout (location = 2) in vec4 v2;
layout (location = 3) in vec4 up;

layout (location = 0) out vec4 tesc_v1;
layout (location = 1) out vec4 tesc_v2;
layout (location = 2) out vec4 tesc_up;
layout (location = 3) out vec4 tesc_forward;

out gl_PerVertex {
    vec4 gl_Position;
};

void main() {
	// TODO: Write gl_Position and any other shader outputs
	tesc_v1 = model * vec4(v1.xyz, 1.0);
	tesc_v1.w = v1.w;

	tesc_v2 = model * vec4(v2.xyz, 1.0);
	tesc_v2.w = v2.w;

	tesc_up = vec4(normalize(up.xyz), 0.0);

	float dir = v0.w;
	vec3 faceTo = vec3(sin(dir), 0.0, cos(dir));
	faceTo = -normalize(faceTo);
	tesc_forward = vec4(faceTo,0.0);

	gl_Position = model * vec4(v0.xyz, 1.0);
}
