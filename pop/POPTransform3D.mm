/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import "POPTransform3D.h"

#include "TransformationMatrix.h"

using namespace WebCore;

#define DECOMPOSE_TRANSFORM(L) \
  TransformationMatrix _m(L); \
  TransformationMatrix::DecomposedType _d; \
  _m.decompose(_d);

#define RECOMPOSE_TRANSFORM(L) \
  _m.recompose(_d); \
  return _m.transform3d();

#define RECOMPOSE_ROT_TRANSFORM(L) \
  _m.recompose(_d, true); \
  return _m.transform3d();

NS_INLINE void ensureNonZeroValue(CGFloat &f) {
  if (f == 0) {
    f = 1e-6;
  }
}

NS_INLINE void ensureNonZeroValue(CGPoint &p) {
  if (p.x == 0 && p.y == 0) {
    p.x = 1e-6;
    p.y = 1e-6;
  }
}

@implementation Transform3D
+ (CGFloat)scaleX:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.scaleX;
}

+ (CATransform3D)setScaleX:(CATransform3D)l value:(CGFloat)f {
  ensureNonZeroValue(f);
  DECOMPOSE_TRANSFORM(l);
  _d.scaleX = f;
  RECOMPOSE_TRANSFORM(l);
}

+ (CGFloat)scaleY:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.scaleY;
}

+ (CATransform3D)setScaleY:(CATransform3D)l value:(CGFloat)f {
  ensureNonZeroValue(f);
  DECOMPOSE_TRANSFORM(l);
  _d.scaleY = f;
  RECOMPOSE_TRANSFORM(l);
}

+ (CGFloat)scaleZ:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.scaleZ;
}

+ (CATransform3D)setScaleZ:(CATransform3D)l value:(CGFloat)f {
  ensureNonZeroValue(f);
  DECOMPOSE_TRANSFORM(l);
  _d.scaleZ = f;
  RECOMPOSE_TRANSFORM(l);
}

+ (CGPoint)scaleXY:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return CGPointMake(_d.scaleX, _d.scaleY);
}

+ (CATransform3D)setScaleXY:(CATransform3D)l value:(CGPoint)p {
  ensureNonZeroValue(p);
  DECOMPOSE_TRANSFORM(l);
  _d.scaleX = p.x;
  _d.scaleY = p.y;
  RECOMPOSE_TRANSFORM(l);
}

+ (CGFloat)translationX:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.translateX;
}

+ (CATransform3D)setTranslationX:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.translateX = f;
  RECOMPOSE_TRANSFORM(l);
}

+ (CGFloat)translationY:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.translateY;
}

+ (CATransform3D)setTranslationY:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.translateY = f;
  RECOMPOSE_TRANSFORM(l);
}

+ (CGFloat)translationZ:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.translateZ;
}

+ (CATransform3D)setTranslationZ:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.translateZ = f;
  RECOMPOSE_TRANSFORM(l);
}

+ (CGVector)translationXY:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return CGVectorMake(_d.translateX, _d.translateY);
}

+ (CATransform3D)setTranslationXY:(CATransform3D)l value:(CGVector)p {
  DECOMPOSE_TRANSFORM(l);
  _d.translateX = p.dx;
  _d.translateY = p.dy;
  RECOMPOSE_TRANSFORM(l);
}

+ (CGFloat)rotationX:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.rotateX;
}

+ (CATransform3D)setRotationX:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.rotateX = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)rotationY:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.rotateY;
}

+ (CATransform3D)setRotationY:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.rotateY = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)rotationZ:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.rotateZ;
}

+ (CATransform3D)setRotationZ:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.rotateZ = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)rotation:(CATransform3D)l {
  return [Transform3D rotationZ:l];
}

+ (CATransform3D)setRotation:(CATransform3D)l value:(CGFloat)f {
  return [Transform3D setRotationZ:l value:f];
}

+ (CGFloat)skewXY:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.skewXY;
}

+ (CATransform3D)setSkewXY:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.skewXY = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)skewYZ:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.skewYZ;
}

+ (CATransform3D)setSkewYZ:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.skewYZ = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)skewXZ:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.skewXZ;
}

+ (CATransform3D)setSkewXZ:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.skewXZ = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)quaternionX:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.quaternionX;
}

+ (CATransform3D)setQuaternionX:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.quaternionX = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)quaternionY:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.quaternionY;
}

+ (CATransform3D)setQuaternionY:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.quaternionY = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)quaternionZ:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.quaternionZ;
}

+ (CATransform3D)setQuaternionZ:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.quaternionZ = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)quaternionW:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.quaternionW;
}

+ (CATransform3D)setQuaternionW:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.quaternionW = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)perspectiveX:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.perspectiveX;
}

+ (CATransform3D)setPerspectiveX:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.perspectiveX = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)perspectiveY:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.perspectiveY;
}

+ (CATransform3D)setPerspectiveY:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.perspectiveY = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)perspectiveZ:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.perspectiveZ;
}

+ (CATransform3D)setPerspectiveZ:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.perspectiveZ = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}

+ (CGFloat)perspectiveW:(CATransform3D)l {
  DECOMPOSE_TRANSFORM(l);
  return _d.perspectiveW;
}

+ (CATransform3D)setPerspectiveW:(CATransform3D)l value:(CGFloat)f {
  DECOMPOSE_TRANSFORM(l);
  _d.perspectiveW = f;
  RECOMPOSE_ROT_TRANSFORM(l);
}
@end
