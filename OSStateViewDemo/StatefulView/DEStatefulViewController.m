//
//  DEStatefulViewController.m
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import "DEStatefulViewController.h"

@interface DEStatefulViewController ()

@end

@implementation DEStatefulViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PCStatefulVCContentState *contentState = [PCStatefulVCContentState new];
    contentState.didEnterState = ^(PCState * _Nonnull previosState) {
        [self.loadingView removeFromSuperview];
        [self.emptyView removeFromSuperview];
        [self.errorView removeFromSuperview];
    };
    
    PCStatefulVCLoadingState *loadingState = [PCStatefulVCLoadingState new];
    loadingState.didEnterState = ^(PCState * _Nonnull previosState) {
        [self.emptyView removeFromSuperview];
        [self.errorView removeFromSuperview];
        
        [self.view addSubview:self.loadingView];
    };
    
    PCStatefulVCErrorState *errorState = [PCStatefulVCErrorState new];
    errorState.didEnterState = ^(PCState * _Nonnull previosState) {
        [self.emptyView removeFromSuperview];
        [self.loadingView removeFromSuperview];
        
        [self.view addSubview:self.errorView];
    };
    
    PCStatefulVCEmptyState *emptyState = [PCStatefulVCEmptyState new];
    emptyState.didEnterState = ^(PCState * _Nonnull previosState) {
        [self.errorView removeFromSuperview];
        [self.loadingView removeFromSuperview];
        
        [self.view addSubview:self.emptyView];
    };
    
    self.stateMachine = [[DEViewStateMachine alloc] initWithStates:@[contentState, loadingState, errorState, emptyState]];
}

- (BOOL)hasContent {
    return NO;
}

- (void)handleErrorWhenContentAvailable {
}

#pragma mark - 转换状态
- (void)setupInitialViewState {
    BOOL isLoading = [self.stateMachine.currentState isKindOfClass:[PCStatefulVCLoadingState class]];
    NSError *error = nil;
    if ([self.stateMachine.currentState isKindOfClass:[PCStatefulVCErrorState class]]) {
        error = [NSError errorWithDomain:@"com.StatefulViewController.ErrorDomain" code:-1 userInfo:nil];
    }
    [self transitionViewStatesWithIsLoading:isLoading error:error];
}

- (void)startLoading {
    [self transitionViewStatesWithIsLoading:YES error:nil];
}

- (void)endLoadingWithError:(NSError * _Nullable)error {
    [self transitionViewStatesWithIsLoading:NO error:error];
}

- (void)transitionViewStatesWithIsLoading:(BOOL)isLoading error:(NSError *)error {
    // Update view for content
    if ([self hasContent]) {
        if (error) {
            [self handleErrorWhenContentAvailable];
        }
        [self.stateMachine enterState:PCStatefulVCContentState.class];
        
        return;
    }
    
    // Update view for placeholder
    Class newState = PCStatefulVCEmptyState.class;
    if (isLoading) {
        newState = PCStatefulVCLoadingState.class;
    } else if (error) {
        newState = PCStatefulVCErrorState.class;
    }
    
    [self.stateMachine enterState:newState];
}

@end
