//
//  PCStatefulVCState.m
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import "PCStatefulVCState.h"

@implementation PCStatefulVCContentState

- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass == PCStatefulVCLoadingState.class;
}

- (void)didEnterWithPreviousState:(PCState *)previousState {
    [super didEnterWithPreviousState:previousState];
    NSLog(@"Content State");
}

@end

@implementation PCStatefulVCLoadingState

- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass != PCStatefulVCLoadingState.class;
}

- (void)didEnterWithPreviousState:(PCState *)previousState {
    [super didEnterWithPreviousState:previousState];
    NSLog(@"Loading State");
}

@end

@implementation PCStatefulVCErrorState

- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass == PCStatefulVCLoadingState.class;
}

- (void)didEnterWithPreviousState:(PCState *)previousState {
    [super didEnterWithPreviousState:previousState];
    NSLog(@"Error State");
}

@end

@implementation PCStatefulVCEmptyState

- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass == PCStatefulVCLoadingState.class;
}

- (void)didEnterWithPreviousState:(PCState *)previousState {
    [super didEnterWithPreviousState:previousState];
    NSLog(@"Empty State");
}

@end
