#version 330 core
layout (lines) in;
layout (triangle_strip, max_vertices = 4) out;

out vec3 v_Color;

in DATA {
    
    vec3 d_Color;
    mat4 d_Camera;
    
} data_in[];

const int LINE_WIDTH = 1;


void main() {

    vec2 direction  = normalize(gl_in[1].gl_Position.xy - gl_in[0].gl_Position.xy);
    vec4 sideVector = vec4(vec2(direction.y, -direction.x) * LINE_WIDTH, 0.f, 0.f);

    gl_Position = data_in[0].d_Camera * (gl_in[0].gl_Position + sideVector);
    v_Color     = data_in[0].d_Color;
    EmitVertex();

    gl_Position = data_in[0].d_Camera * (gl_in[0].gl_Position - sideVector);
    v_Color     = data_in[0].d_Color;
    EmitVertex();

    gl_Position = data_in[1].d_Camera * (gl_in[1].gl_Position + sideVector);
    v_Color     = data_in[0].d_Color;
    EmitVertex();
    
    gl_Position = data_in[1].d_Camera * (gl_in[1].gl_Position - sideVector);
    v_Color     = data_in[0].d_Color;
    EmitVertex();

    EndPrimitive();

} // main()
