//
//  DEViewStateMachine.h
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCStateMachine.h"
#import "PCStatefulVCState.h"

NS_ASSUME_NONNULL_BEGIN

@interface DEViewStateMachine : PCStateMachine

- (instancetype)initWithViewStates;

@end

NS_ASSUME_NONNULL_END
