#version 330 core
layout (location = 0) in vec2  a_Position;
layout (location = 1) in vec3  a_Color;
layout (location = 2) in float a_Layer;

out DATA {
    
    vec3 d_Color;
    mat4 d_Camera;

} data_out;

uniform mat4 u_CameraView;


void main() {

    gl_Position       = vec4(a_Position, a_Layer, 1.0f);
    data_out.d_Color  = a_Color;
    data_out.d_Camera = u_CameraView;

} // main()
