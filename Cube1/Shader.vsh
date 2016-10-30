attribute vec3 position;
attribute vec2 texCoord;
varying lowp vec4 colorVarying;
varying lowp vec2 outTexCoord;
uniform lowp  mat4 modelViewMatrix;
uniform lowp mat4 projectionViewMatrix;
void main()
{
    colorVarying = vec4(1.0,1,1,1);
    gl_Position = projectionViewMatrix *modelViewMatrix * vec4(position,1);
    outTexCoord=texCoord;
}
