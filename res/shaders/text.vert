#version 330 core
layout (location = 0) in vec2  a_Position;
layout (location = 1) in vec2  a_ST;
layout (location = 2) in vec3  a_Color;
layout (location = 3) in float a_Layer;

out vec2 v_ST;
out vec3 v_Color;

uniform mat4 u_CameraView;


void main() {

    gl_Position = u_CameraView * vec4(a_Position, a_Layer, 1.0f);
    v_ST        = a_ST;
    v_Color     = a_Color;

} // main()
