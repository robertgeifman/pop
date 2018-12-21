/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.

 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

typedef NS_ENUM(NSInteger, POPValueType) {
  kPOPValueUnknown = 0,
  kPOPValueTransform3D,
  kPOPValueAffineTransform,
  kPOPValueFloat,
  kPOPValuePoint,
  kPOPValueRect,
  kPOPValueSize,
  kPOPValueVector,
  kPOPValueColorHSB,
  kPOPValueColorMonochrome,
  kPOPValueColorRGB,
  kPOPValueRange,
  kPOPValueInteger,
  kPOPValueEdgeInsets,
  kPOPValueSCNVector3,
  kPOPValueSCNVector4,
  kPOPValueOffset,
};

typedef void (^POPAnimatablePropertyReadBlock)(id obj, CGFloat values[]);
typedef void (^POPAnimatablePropertyWriteBlock)(id obj, const CGFloat values[]);
