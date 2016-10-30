//
//  Shader.fsh
//  Game
//
//  Created by enghou on 16/10/21.
//  Copyright © 2016年 xyxorigation. All rights reserved.
//
//varying lowp vec2 outTexCoord;
varying lowp vec2 outTexCoord;
varying lowp vec4 colorVarying;
uniform sampler2D Texture;
void main()
{
    gl_FragColor = colorVarying*texture2D(Texture,outTexCoord);
}
