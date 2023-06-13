#version 330 core
layout (location = 0) in vec2  a_Position;
layout (location = 1) in uvec2 a_Dim;
layout (location = 2) in vec3  a_MainColor;
layout (location = 3) in vec3  a_BackgroundColor;
layout (location = 4) in float a_Layer;
layout (location = 5) in int   a_StyleData;

out DATA {
    
    vec3  d_MainColor;
    vec3  d_BackgroundColor;
    uvec2 d_Dim;
    int   d_StyleData;
    mat4  d_Camera;

} data_out;

uniform mat4 u_CameraView;


void main() {

    gl_Position                = vec4(a_Position, a_Layer, 1.0f);
    data_out.d_MainColor       = a_MainColor;
    data_out.d_BackgroundColor = a_BackgroundColor;
    data_out.d_Dim             = a_Dim;
    data_out.d_StyleData       = a_StyleData;
    data_out.d_Camera          = u_CameraView;

} // main()
