//
//  ViewController.m
//  Cube1
//
//  Created by enghou on 16/10/27.
//  Copyright © 2016年 xyxorigation. All rights reserved.
//

#import "ViewController.h"
typedef struct {
    GLKVector3 position;
    GLKVector2 texCoord;
}SceneVertex;

SceneVertex Cube[36]={
    {{0.5f, -0.5f, -0.5f}/*C*/,        {0.0f, 1.0f}},
    {{0.5f, 0.5f, -0.5f}/*h*/,         {1.0f, 1.0f}},
    {{0.5f, -0.5f, 0.5f}/*b*/,         {0.0f, 0.0f}},
    {{0.5f, -0.5f, 0.5f}/*b*/,         {0.0f, 0.0f}},
    {{0.5f, 0.5f, -0.5f}/*h*/,          {1.0f, 1.0f}},
    {{0.5f, 0.5f, 0.5f}/*f*/,         {1.0f, 0.0f}},//chbf
    
    {{0.5f, 0.5f, -0.5f}/*h*/,         {1.0f, 1.0f}},
    {{-0.5f, 0.5f, -0.5f}/*g*/,        {1.0f, 0.0f}},
    {{0.5f, 0.5f, 0.5f}/*f*/,          {0.0f, 1.0f}},
    {{0.5f, 0.5f, 0.5f}/*f*/,          {0.0f, 1.0f}},
    {{-0.5f, 0.5f, -0.5f}/*g*/,        {1.0f, 0.0f}},
    {{-0.5f, 0.5f, 0.5f}/*e*/,         {0.0f, 0.0f}},//hgfe
    
    {{-0.5f, 0.5f, -0.5f}/*g*/,        {1.0f, 0.0f}},
    {{-0.5f, -0.5f, -0.5f}/*d*/,      {0.0f, 0.0f}},
    {{-0.5f, 0.5f, 0.5f}/*e*/,         {1.0f, 1.0f}},
    {{-0.5f, 0.5f, 0.5f}/*e*/,         {1.0f, 1.0f}},
    {{-0.5f, -0.5f, -0.5f}/*D*/,       {0.0f, 0.0f}},
    {{-0.5f, -0.5f, 0.5f}/*a*/,        {0.0f, 1.0f}},//gdea
    
    {{-0.5f, -0.5f, -0.5f}/*d*/,       {1.0f, 1.0f}},
    {{0.5f, -0.5f, -0.5f}/*C*/,        {1.0f, 0.0f}},
    {{-0.5f, -0.5f, 0.5f}/*a*/,        {0.0f, 1.0f}},
    {{-0.5f, -0.5f, 0.5f}/*a*/,        {0.0f, 1.0f}},
    {{0.5f, -0.5f, -0.5f}/*c*/,        {1.0f, 0.0f}},
    {{0.5f, -0.5f, 0.5f}/*b*/,        {0.0f, 0.0f}},//dcab

    {{0.5f, 0.5f, 0.5f}/*f*/,          {1.0f, 1.0f}},
    {{-0.5f, 0.5f, 0.5f}/*e*/,         {1.0f, 0.0f}},
    {{0.5f, -0.5f, 0.5f}/*b*/,         {0.0f, 1.0f}},
    {{0.5f, -0.5f, 0.5f}/*b*/,         {0.0f, 1.0f}},
    {{-0.5f, 0.5f, 0.5f}/*e*/,         {1.0f, 0.0f}},
    {{-0.5f, -0.5f, 0.5f}/*a*/,        {0.0f, 0.0f}},//feba

    {{0.5f, -0.5f, -0.5f}/*c*/,        {0.0f, 0.0f}},
    {{-0.5f, -0.5f, -0.5f}/*D*/,       {0.0f, 1.0f}},
    {{0.5f, 0.5f, -0.5f}/*h*/,         {1.0f, 0.0f}},
    {{0.5f, 0.5f, -0.5f}/*h*/,         {1.0f, 0.0f}},
    {{-0.5f, -0.5f, -0.5f}/*D*/,       {0.0f, 1.0f}},
    {{-0.5f, 0.5f, -0.5f}/*g*/,        {1.0f, 1.0f}}//cdhg

};

typedef enum
{
    AGLK1 = 1,
    AGLK2 = 2,
    AGLK4 = 4,
    AGLK8 = 8,
    AGLK16 = 16,
    AGLK32 = 32,
    AGLK64 = 64,
    AGLK128 = 128,
    AGLK256 = 256,
    AGLK512 = 512,
    AGLK1024 = 1024,
}
AGLKPowerOf2;
static AGLKPowerOf2 AGLKCalculatePowerOf2ForDimension(GLuint dimension);
static NSData *AGLKDataWithResizedCGImageBytes(
                                               CGImageRef cgImage,
                                               size_t *widthPtr,
                                               size_t *heightPtr);


SceneVertex p[36]={
    
    {{-0.5f, 0.5f, -0.5f}/*b*/,         {0.0f, 1.0f}},
    {{0.5f, 0.5f, -0.5f}/*h*/,         {1.0f, 1.0f}},
    {{0.5f, -0.5f, -0.5f}/*C*/,        {1.0f, 0.0f}},
    {{-0.5f, 0.5f, -0.5f}/*b*/,         {0.0f, 1.0f}},
    {{0.5f, -0.5f, -0.5f}/*f*/,         {1.0f, 0.0f}},
    {{-0.5f, -0.5f, -0.5f}/*h*/,          {0.0f, 0.0f}},//后完善
    
    {{0.5f, -0.5f, 0.5f}/*C*/,        {0.0f, 0.0f}},
    {{0.5f, 0.5f, 0.5f}/*h*/,         {0.0f, 1.0f}},
    {{-0.5f, 0.5f, 0.5f}/*b*/,         {1.0f, 1.0f}},
    {{-0.5f, 0.5f, 0.5f}/*b*/,         {1.0f, 1.0f}},
    {{-0.5f, -0.5f, 0.5f}/*h*/,          {1.0f, 0.0f}},
    {{0.5f, -0.5f, 0.5f}/*f*/,         {0.0f, 0.0f}},//前完成
//
//    
    {{-0.5f, 0.5f, 0.5f}/*C*/,        {1.0f, 0.0f}},
    {{0.5f, 0.5f, 0.5f}/*h*/,         {0.0f, 0.0f}},
    {{0.5f, 0.5f, -0.5f}/*b*/,         {0.0f, 1.0f}},
    {{0.5f, 0.5f, -0.5f}/*b*/,         {0.0f, 1.0f}},
    {{-0.5f, 0.5f, -0.5f}/*h*/,          {1.0f, 1.0f}},
    {{-0.5f, 0.5f, 0.5f}/*f*/,         {1.0f, 0.0f}},//上对
//
//    
    {{-0.5f, -0.5f, 0.5f}/*C*/,        {0.0f, 0.0f}},
    {{-0.5f, -0.5f, -0.5f}/*h*/,          {0.0f, 1.0f}},
    {{0.5f, -0.5f, -0.5f}/*b*/,         {1.0f, 1.0f}},
    {{0.5f, -0.5f, 0.5f}/*h*/,         {1.0f, .0f}},
    {{-0.5f, -0.5f, 0.5f}/*f*/,         {0.0f, 0.0f}},
    {{0.5f, -0.5f, -0.5f}/*b*/,         {1.0f, 1.0f}},//下
//
    {{0.5f, -0.5f, 0.5f}/*C*/,        {1.0f, 0.0f}},
    {{0.5f, -0.5f, -0.5f}/*h*/,         {0.0f, 0.0f}},
    {{0.5f, 0.5f, -0.5f}/*b*/,         {0.0f, 1.0f}},
    {{0.5f, 0.5f, -0.5f}/*b*/,         {0.0f, 1.0f}},
    {{0.5f, 0.5f, 0.5f}/*h*/,          {1.0f, 1.0f}},
    {{0.5f, -0.5f, 0.5f}/*f*/,         {1.0f, 0.0f}},//右完善
//
//    
    {{-0.5f, -0.5f, 0.5f}/*C*/,          {0.0f, 0.0f}},
    {{-0.5f, 0.5f, 0.5f}/*h*/,          {0.0f, 1.0f}},
    {{-0.5f, 0.5f, -0.5f}/*b*/,         {1.0f, 1.0f}},
    {{-0.5f, 0.5f, -0.5f}/*b*/,         {1.0f, 1.0f}},
    {{-0.5f, -0.5f, -0.5f}/*h*/,         {0.0f, 0.0f}},
    {{-0.5f, -0.5f, 0.5f}/*f*/,         {0.0f, 0.0f}},//左
    
    
};

@interface ViewController ()
@property(nonatomic)GLint program;
@property(nonatomic,strong)GLKBaseEffect *baseEffect;
@end

@implementation ViewController
{
    GLuint tex[6];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    GLKView *view=(GLKView *)self.view;
    view.context=[[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:view.context];
    glClearColor(0, 0, 0, 1);
    [self loadShader];
    GLuint t = glGetUniformLocation(_program, "Texture");
    glUniform1i(t, 0);
    GLuint name;
    glGenBuffers(1, &name);
    glBindBuffer(GL_ARRAY_BUFFER, name);
    glBufferData(GL_ARRAY_BUFFER, sizeof(p), p, GL_STATIC_DRAW);
//后前上下右左
    glGenTextures(4, tex);
    glBindTexture(GL_TEXTURE_2D, tex[0]);
    UIImage *image=[UIImage imageNamed:@"neg_z.tga"];
    size_t width;
    size_t height;
    NSData *data= AGLKDataWithResizedCGImageBytes(image.CGImage, &width, &height);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (GLuint)width, (GLuint)height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data.bytes);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glBindTexture(GL_TEXTURE_2D, 0);//success
    
    glBindTexture(GL_TEXTURE_2D, tex[1]);
    UIImage *image1=[UIImage imageNamed:@"pos_z.tga"];
    size_t width1;
    size_t height1;
    NSData *data1= AGLKDataWithResizedCGImageBytes(image1.CGImage, &width1, &height1);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (GLuint)width1, (GLuint)height1, 0, GL_RGBA, GL_UNSIGNED_BYTE, data1.bytes);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glBindTexture(GL_TEXTURE_2D, 0);

    glBindTexture(GL_TEXTURE_2D, tex[2]);
    UIImage *image2=[UIImage imageNamed:@"pos_y.tga"];
    size_t width2;
    size_t height2;
    NSData *data2= AGLKDataWithResizedCGImageBytes(image2.CGImage, &width2, &height2);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (GLuint)width2, (GLuint)height2, 0, GL_RGBA, GL_UNSIGNED_BYTE, data2.bytes);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glBindTexture(GL_TEXTURE_2D, 0);

    glBindTexture(GL_TEXTURE_2D, tex[3]);
    UIImage *image3=[UIImage imageNamed:@"neg_y.tga"];
    size_t width3;
    size_t height3;
    NSData *data3= AGLKDataWithResizedCGImageBytes(image3.CGImage, &width3, &height3);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (GLuint)width3, (GLuint)height3, 0, GL_RGBA, GL_UNSIGNED_BYTE, data3.bytes);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glBindTexture(GL_TEXTURE_2D, 0);
    
    
    
    
    glBindTexture(GL_TEXTURE_2D, tex[4]);
    UIImage *image4=[UIImage imageNamed:@"pos_x.tga"];
    size_t width4;
    size_t height4;
    NSData *data4= AGLKDataWithResizedCGImageBytes(image4.CGImage, &width4, &height4);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (GLuint)width4, (GLuint)height4, 0, GL_RGBA, GL_UNSIGNED_BYTE, data4.bytes);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glBindTexture(GL_TEXTURE_2D, 0);
    
    
    glBindTexture(GL_TEXTURE_2D, tex[5]);
    UIImage *image5=[UIImage imageNamed:@"neg_x.tga"];
    size_t width5;
    size_t height5;
    NSData *data5= AGLKDataWithResizedCGImageBytes(image5.CGImage, &width5, &height5);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (GLuint)width5, (GLuint)height5, 0, GL_RGBA, GL_UNSIGNED_BYTE, data5.bytes);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glBindTexture(GL_TEXTURE_2D, 0);
    
//    self.preferredFramesPerSecond=10;
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(SceneVertex), NULL);
    
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(SceneVertex), NULL+offsetof(SceneVertex, texCoord));
    glEnable(GL_DEPTH_TEST);
//    glEnable(GL_CULL_FACE);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    glClear(GL_COLOR_BUFFER_BIT);
    glUseProgram(_program);
    static float j=0;
    GLfloat aspect=(GLfloat)view.drawableWidth/(GLfloat)view.drawableHeight;
    GLint location=glGetUniformLocation(_program, "modelViewMatrix");

    GLKMatrix4 mat=GLKMatrix4MakeLookAt(0, 0, -0.5, 0, 0, 0, 0, 1, 0);
    mat=GLKMatrix4Scale(mat, 50, 50*aspect, 50);
    mat=GLKMatrix4Rotate(mat, GLKMathDegreesToRadians(j++), 0, 1, 0);
    glUniformMatrix4fv(location, 1, 0, mat.m);
    
    GLint location1=glGetUniformLocation(_program, "projectionViewMatrix");
    GLKMatrix4 mat1=GLKMatrix4Identity;
    mat1=GLKMatrix4MakeFrustum(-1, 1, -1, 1, 0.5, 100);
    glUniformMatrix4fv(location1, 1, 0, mat1.m);
    
    glBindTexture(GL_TEXTURE_2D, tex[0]);
    glDrawArrays(GL_TRIANGLES, 0, 6);//neg-z
    
    glBindTexture(GL_TEXTURE_2D, tex[1]);
    glDrawArrays(GL_TRIANGLES, 6, 6);//pos-z
//
    glBindTexture(GL_TEXTURE_2D, tex[2]);
    glDrawArrays(GL_TRIANGLES, 12, 6);
//
    glBindTexture(GL_TEXTURE_2D, tex[3]);
    glDrawArrays(GL_TRIANGLES, 18, 6);
//
//
    glBindTexture(GL_TEXTURE_2D, tex[4]);
    glDrawArrays(GL_TRIANGLES, 24, 6);
//
    glBindTexture(GL_TEXTURE_2D, tex[5]);
    glDrawArrays(GL_TRIANGLES, 30, 6);
}
-(BOOL)loadShader{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _program = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shader" ofType:@"vsh"];
    if (![self compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shader" ofType:@"fsh"];
    if (![self compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname]) {
        NSLog(@"Failed to compile fragment shader");
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_program, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_program, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_program, GLKVertexAttribPosition, "position");
    glBindAttribLocation(_program, GLKVertexAttribTexCoord0, "texCoord");
    
    // Link program.
    if (![self linkProgram:_program]) {
        NSLog(@"Failed to link program: %d", _program);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_program) {
            glDeleteProgram(_program);
            _program = 0;
        }
        
        return NO;
    }
    
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_program, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_program, fragShader);
        glDeleteShader(fragShader);
    }
    
    return YES;
}

- (BOOL)compileShader:(GLuint *)shader type:(GLenum)type file:(NSString *)file
{
    GLint status;
    const GLchar *source;
    
    source = (GLchar *)[[NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil] UTF8String];
    if (!source) {
        NSLog(@"Failed to load vertex shader");
        return NO;
    }
    
    *shader = glCreateShader(type);
    glShaderSource(*shader, 1, &source, NULL);
    glCompileShader(*shader);
    
#if defined(DEBUG)
    GLint logLength;
    glGetShaderiv(*shader, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *)malloc(logLength);
        glGetShaderInfoLog(*shader, logLength, &logLength, log);
        NSLog(@"Shader compile log:\n%s", log);
        free(log);
    }
#endif
    
    glGetShaderiv(*shader, GL_COMPILE_STATUS, &status);
    if (status == 0) {
        glDeleteShader(*shader);
        return NO;
    }
    
    return YES;
}

- (BOOL)linkProgram:(GLuint)prog
{
    GLint status;
    glLinkProgram(prog);
    
#if defined(DEBUG)
    GLint logLength;
    glGetProgramiv(prog, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *)malloc(logLength);
        glGetProgramInfoLog(prog, logLength, &logLength, log);
        NSLog(@"Program link log:\n%s", log);
        free(log);
    }
#endif
    
    glGetProgramiv(prog, GL_LINK_STATUS, &status);
    if (status == 0) {
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

static NSData *AGLKDataWithResizedCGImageBytes(
                                               CGImageRef cgImage,
                                               size_t *widthPtr,
                                               size_t *heightPtr)
{
    NSCParameterAssert(NULL != cgImage);
    NSCParameterAssert(NULL != widthPtr);
    NSCParameterAssert(NULL != heightPtr);
    
    GLuint originalWidth = (GLuint)CGImageGetWidth(cgImage);
    GLuint originalHeight = (GLuint)CGImageGetWidth(cgImage);
    
    NSCAssert(0 < originalWidth, @"Invalid image width");
    NSCAssert(0 < originalHeight, @"Invalid image width");
    
    // Calculate the width and height of the new texture buffer
    // The new texture buffer will have power of 2 dimensions.
    GLuint width = AGLKCalculatePowerOf2ForDimension(
                                                     originalWidth);
    GLuint height = AGLKCalculatePowerOf2ForDimension(
                                                      originalHeight);
    
    // Allocate sufficient storage for RGBA pixel color data with
    // the power of 2 sizes specified
    NSMutableData    *imageData = [NSMutableData dataWithLength:
                                   height * width * 4];  // 4 bytes per RGBA pixel
    
    NSCAssert(nil != imageData,
              @"Unable to allocate image storage");
    
    // Create a Core Graphics context that draws into the
    // allocated bytes
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef cgContext = CGBitmapContextCreate(
                                                   [imageData mutableBytes], width, height, 8,
                                                   4 * width, colorSpace,
                                                   kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    
    // Flip the Core Graphics Y-axis for future drawing
    CGContextTranslateCTM (cgContext, 0, height);
    CGContextScaleCTM (cgContext, 1.0, -1.0);
    
    // Draw the loaded image into the Core Graphics context
    // resizing as necessary
    CGContextDrawImage(cgContext, CGRectMake(0, 0, width, height),
                       cgImage);
    
    CGContextRelease(cgContext);
    
    *widthPtr = width;
    *heightPtr = height;
    
    return imageData;
}
static AGLKPowerOf2 AGLKCalculatePowerOf2ForDimension(
                                                      GLuint dimension)
{
    AGLKPowerOf2  result = AGLK1;
    
    if(dimension > (GLuint)AGLK512)
    {
        result = AGLK1024;
    }
    else if(dimension > (GLuint)AGLK256)
    {
        result = AGLK512;
    }
    else if(dimension > (GLuint)AGLK128)
    {
        result = AGLK256;
    }
    else if(dimension > (GLuint)AGLK64)
    {
        result = AGLK128;
    }
    else if(dimension > (GLuint)AGLK32)
    {
        result = AGLK64;
    }
    else if(dimension > (GLuint)AGLK16)
    {
        result = AGLK32;
    }
    else if(dimension > (GLuint)AGLK8)
    {
        result = AGLK16;
    }
    else if(dimension > (GLuint)AGLK4)
    {
        result = AGLK8;
    }
    else if(dimension > (GLuint)AGLK2)
    {
        result = AGLK4;
    }
    else if(dimension > (GLuint)AGLK1)
    {
        result = AGLK2;
    }
    
    return result;
}
