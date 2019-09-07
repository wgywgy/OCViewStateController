//
//  DEViewStateMachine.m
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import "DEViewStateMachine.h"

@implementation DEViewStateMachine

- (instancetype)initWithViewStates {
    // Create the states
    PCStatefulVCContentState *contentState = [PCStatefulVCContentState new];
    PCStatefulVCLoadingState *loadingState = [PCStatefulVCLoadingState new];
    PCStatefulVCErrorState *errorState = [PCStatefulVCErrorState new];
    PCStatefulVCEmptyState *emptyState = [PCStatefulVCEmptyState new];
    
    // Initialize the state machine
    self = [super initWithStates:@[contentState, loadingState, errorState, emptyState]];
    if (self) {
    }
    return self;
}

@end
