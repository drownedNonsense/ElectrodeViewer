#version 330 core

in vec2 v_ST;
in vec3 v_Color;

uniform sampler2D u_Font;


void main() {

    gl_FragColor = vec4(v_Color, 1.0f) * texture2D(u_Font, v_ST);
    if (gl_FragColor.a <= 0.2f)
        discard;

} // main()
