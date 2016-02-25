//
//  StereoOverlayRenderer.m
//  MAMapKit_Debug
//
//  Created by yi chen on 1/12/16.
//  Copyright © 2016 Autonavi. All rights reserved.
//


#import "CubeOverlayRenderer.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

template <typename T>
struct Vector3 {
    Vector3() {}
    Vector3(T x, T y, T z) : x(x), y(y), z(z) {}
    T x;
    T y;
    T z;
};

typedef Vector3<float> Vertex;

@interface CubeOverlayRenderer()

@end

const GLuint bottomPointCount = 4;  //底面点数
const GLuint totalVertexCount = 8;  //总顶点数
const GLuint indexCount       = 36; //索引数

@implementation CubeOverlayRenderer
{
    MAMapPoint _bottomMapPts[bottomPointCount];

    Vertex       _cubePoints[totalVertexCount];
    GLushort   _cubeIndices[indexCount];
    NSUInteger _cubePointCount;
}

#pragma mark - Interface

- (CubeOverlay *)cubeOverlay
{
    return (CubeOverlay *)self.overlay;
}

#pragma mark - Override

/* 计算经纬度坐标对应的OpenGL坐标，每次地图坐标系有变化均会调用这个方法。 */
- (void)referenceDidChange
{
    [super referenceDidChange];
    
    /* 创建vertex。 */
    CGPoint * bottomGlPts = [self glPointsForMapPoints:_bottomMapPts count:bottomPointCount];
    
    _cubePointCount = totalVertexCount;
    
    //根据z=0平面的尺寸计算cube的高度
    CGFloat sideLenOnGL = [self lengthBetweenPointA:bottomGlPts[0] andPointB:bottomGlPts[1]];
    
    for (int i = 0; i< bottomPointCount; i++)
    {
        _cubePoints[i*2] = Vertex(bottomGlPts[i].x, bottomGlPts[i].y, 0);
        _cubePoints[i*2 + 1] = Vertex(bottomGlPts[i].x, bottomGlPts[i].y, sideLenOnGL);
    }
    
    free(bottomGlPts);
    
    /* 创建index。 */
    const GLuint indexCountOnSideFace = 24;
    //4个侧面
    for (int i = 0, j = 0; i < _cubePointCount && j < indexCountOnSideFace; i = i + 2)
    {
        _cubeIndices[j++] = i;
        _cubeIndices[j++] = i+1;
        _cubeIndices[j++] = (i+2)%_cubePointCount;
        
        _cubeIndices[j++] = i+1;
        _cubeIndices[j++] = (i+3)%_cubePointCount;
        _cubeIndices[j++] = (i+2)%_cubePointCount;
    }
    
    //顶面和底面
    for (int i = 0, j = indexCountOnSideFace; i < 2 && j < indexCount; i++)
    {
        _cubeIndices[j++] = i;
        _cubeIndices[j++] = i + 2;
        _cubeIndices[j++] = i + 4;
        
        _cubeIndices[j++] = i;
        _cubeIndices[j++] = i + 4;
        _cubeIndices[j++] = i + 6;
    }
    
}

/* OpenGL绘制。 */
- (void)glRender
{
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_ALWAYS);
    
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    glDisable(GL_TEXTURE_2D);
    glEnableClientState(GL_VERTEX_ARRAY);
    
    glVertexPointer(3, GL_FLOAT, 0, _cubePoints);

    const GLuint faceCount = 6;
    const GLuint indexCountPerFace = 6;
    
    GLfloat r,b,g;
    for(int i = 0; i<faceCount; i++)
    {
        r = 0.5 + 0.5 * (i&1);
        g = 0.5 + 0.5 * (i&2);
        b = 0.5 + 0.5 * (i&4);

        glColor4f(r, g, b, 0.5);
        glDrawElements(GL_TRIANGLES, indexCountPerFace, GL_UNSIGNED_SHORT, &_cubeIndices[i*indexCountPerFace]);
    }
    
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisable(GL_BLEND);
    glDisable(GL_DEPTH_TEST);

}

#pragma mark - Helper

- (CGFloat)lengthBetweenPointA:(CGPoint)a andPointB:(CGPoint)b
{
    CGFloat deltaX = a.x - b.x;
    CGFloat deltaY = a.y - b.y;
    return sqrt(deltaX*deltaX + deltaY*deltaY);
}


#pragma mark - Init

- (void)constructBottomOnMap
{
    CubeOverlay * cubeOverlay = self.cubeOverlay;
    MAMapPoint center = MAMapPointForCoordinate(cubeOverlay.coordinate);
    double halfLengthOfSide = cubeOverlay.lengthOfSide * MAMapPointsPerMeterAtLatitude(cubeOverlay.coordinate.latitude) * 0.5;
    
    _bottomMapPts[0] = MAMapPointMake(center.x - halfLengthOfSide, center.y - halfLengthOfSide);
    _bottomMapPts[1] = MAMapPointMake(center.x + halfLengthOfSide, center.y - halfLengthOfSide);
    _bottomMapPts[2] = MAMapPointMake(center.x + halfLengthOfSide, center.y + halfLengthOfSide);
    _bottomMapPts[3] = MAMapPointMake(center.x - halfLengthOfSide, center.y + halfLengthOfSide);

}

- (instancetype)initWithCubeOverlay:(CubeOverlay *)cubeOverlay
{
    self = [super initWithOverlay:cubeOverlay];
    if (self)
    {
        [self constructBottomOnMap];
    }
    
    return self;
}

- (instancetype)initWithOverlay:(id<MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[CubeOverlay class]])
    {
        return nil;
    }
    
    return [self initWithCubeOverlay:overlay];
}

@end
