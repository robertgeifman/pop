/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Foundation/Foundation.h>

@protocol POPAnimatorDelegate;

/**
 @abstract The animator class renders animations.
 */
@interface POPAnimator : NSObject

/**
 @abstract The shared animator instance.
 @discussion Consumers should generally use the shared instance in lieu of creating new instances.
 */
+ (instancetype)sharedAnimator;

#if !TARGET_OS_IPHONE
/**
 @abstract Allows to select display to bind. Returns nil if failed to create the display link.
 */
- (instancetype)initWithDisplayID:(CGDirectDisplayID)displayID;
#endif

/**
 @abstract The optional animator delegate.
 */
@property (weak, nonatomic) id<POPAnimatorDelegate> delegate;

/**
 @abstract Retrieves the nominal refresh period of a display link. Returns zero if unavailable.
 */
@property (readonly, nonatomic) CFTimeInterval refreshPeriod;

@end

/**
 @abstract The animator delegate.
 */
@protocol POPAnimatorDelegate <NSObject>

/**
 @abstract Called on each frame before animation application.
 */
- (void)animatorWillAnimate:(POPAnimator *)animator;

/**
 @abstract Called on each frame after animation application.
 */
- (void)animatorDidAnimate:(POPAnimator *)animator;

@end

////////////////////////////////////////////////////////////
@class POPAnimation, POPAnimator;

typedef void (^POPAnimationGroupCompletion)(BOOL didFinish);

////////////////////////////////////////////////////////////
// POPAnimationGroup
@interface POPAnimationGroup : NSObject
- (void)setAnimation:(POPAnimation *)anim forObject:(id)obj key:(NSString *)key;
- (void)addAnimation:(POPAnimation *)anim forObject:(id)obj key:(NSString *)key;
- (void)addCompletionBlock:(POPAnimationGroupCompletion)value;
@end

////////////////////////////////////////////////////////////
// POPAnimator (POPAnimationGroup)
@interface POPAnimator (POPAnimationGroup)
- (void)batchAddRemoveAnimations:(void (^)(POPAnimationGroup * group))block;
- (void)setAnimationsForObject:(id)obj withDictionary:(NSDictionary *)animationsDictionary;
- (void)addAnimationsForObject:(id)obj withDictionary:(NSDictionary *)animationsDictionary;
@end
