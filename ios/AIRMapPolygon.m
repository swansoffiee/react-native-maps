//
// Created by Leland Richardson on 12/27/15.
// Copyright (c) 2015 Facebook. All rights reserved.
//

#import "AIRMapPolygon.h"
#import "UIView+React.h"


@implementation AIRMapPolygon {

}

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    [self applyPropsToRenderer];
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    [self applyPropsToRenderer];
}

- (void)setStrokeWidth:(CGFloat)strokeWidth {
    _strokeWidth = strokeWidth;
    [self applyPropsToRenderer];
}

- (void)setLineJoin:(CGLineJoin)lineJoin {
    _lineJoin = lineJoin;
    [self applyPropsToRenderer];
}

- (void)setLineCap:(CGLineCap)lineCap {
    _lineCap = lineCap;
    [self applyPropsToRenderer];
}

- (void)setMiterLimit:(CGFloat)miterLimit {
    _miterLimit = miterLimit;
    [self applyPropsToRenderer];
}

- (void)setCoordinates:(NSArray<AIRMapCoordinate *> *)coordinates {
    _coordinates = coordinates;
    CLLocationCoordinate2D coords[coordinates.count];
    for(int i = 0; i < coordinates.count; i++)
    {
        coords[i] = coordinates[i].coordinate;
    }
    self.polygon = [MKPolygon polygonWithCoordinates:coords count:coordinates.count];
    self.renderer = [[MKPolygonRenderer alloc] initWithPolygon:self.polygon];
    [self applyPropsToRenderer];
}

- (void) applyPropsToRenderer
{
    if (!_renderer) return;
    _renderer.fillColor = _fillColor;
    _renderer.strokeColor = _strokeColor;
    _renderer.lineWidth = _strokeWidth;
    _renderer.lineCap = _lineCap;
    _renderer.lineJoin = _lineJoin;
    _renderer.miterLimit = _miterLimit;
}


#pragma mark MKOverlay implementation

- (CLLocationCoordinate2D) coordinate
{
    return self.polygon.coordinate;
}

- (MKMapRect) boundingMapRect
{
    return self.polygon.boundingMapRect;
}

- (BOOL)intersectsMapRect:(MKMapRect)mapRect
{
    BOOL answer = [self.polygon intersectsMapRect:mapRect];
    return answer;
}

- (BOOL)canReplaceMapContent
{
    return NO;
}





















































@end