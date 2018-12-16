/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <QuartzCore/QuartzCore.h>

#import <pop/POPDefines.h>

@interface Transform3D: NSObject
+ (CGFloat)scaleX:(CATransform3D)transform;

+ (CATransform3D)setScaleX:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)scaleY:(CATransform3D)transform;

+ (CATransform3D)setScaleY:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)scaleZ:(CATransform3D)transform;

+ (CATransform3D)setScaleZ:(CATransform3D)transform value:(CGFloat)value;

+ (CGPoint)scaleXY:(CATransform3D)transform;

+ (CATransform3D)setScaleXY:(CATransform3D)transform value:(CGPoint)value;

+ (CGFloat)translationX:(CATransform3D)transform;

+ (CATransform3D)setTranslationX:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)translationY:(CATransform3D)transform;

+ (CATransform3D)setTranslationY:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)translationZ:(CATransform3D)transform;

+ (CATransform3D)setTranslationZ:(CATransform3D)transform value:(CGFloat)value;

+ (CGVector)translationXY:(CATransform3D)transform;

+ (CATransform3D)setTranslationXY:(CATransform3D)transform value:(CGVector)value;

+ (CGFloat)rotationX:(CATransform3D)transform;

+ (CATransform3D)setRotationX:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)rotationY:(CATransform3D)transform;

+ (CATransform3D)setRotationY:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)rotationZ:(CATransform3D)transform;

+ (CATransform3D)setRotationZ:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)rotation:(CATransform3D)transform;

+ (CATransform3D)setRotation:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)skewXY:(CATransform3D)transform;

+ (CATransform3D)setSkewXY:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)skewYZ:(CATransform3D)transform;

+ (CATransform3D)setSkewYZ:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)skewXZ:(CATransform3D)transform;

+ (CATransform3D)setSkewXZ:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)quaternionX:(CATransform3D)transform;

+ (CATransform3D)setQuaternionX:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)quaternionY:(CATransform3D)transform;

+ (CATransform3D)setQuaternionY:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)quaternionZ:(CATransform3D)transform;

+ (CATransform3D)setQuaternionZ:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)quaternionW:(CATransform3D)transform;

+ (CATransform3D)setQuaternionW:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)perspectiveX:(CATransform3D)transform;

+ (CATransform3D)setPerspectiveX:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)perspectiveY:(CATransform3D)transform;

+ (CATransform3D)setPerspectiveY:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)perspectiveZ:(CATransform3D)transform;

+ (CATransform3D)setPerspectiveZ:(CATransform3D)transform value:(CGFloat)value;

+ (CGFloat)perspectiveW:(CATransform3D)transform;

+ (CATransform3D)setPerspectiveW:(CATransform3D)transform value:(CGFloat)value;
@end
