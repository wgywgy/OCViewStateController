//
//  DEStatefulViewController.h
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DEViewStateMachine.h"

NS_ASSUME_NONNULL_BEGIN

@interface DEStatefulViewController : UIViewController

@property(nonatomic, strong) DEViewStateMachine *stateMachine;

@property(nonatomic, strong) UIView *loadingView;
@property(nonatomic, strong) UIView *errorView;
@property(nonatomic, strong) UIView *emptyView;

/**
 Control show or hide EmptyView

 @return hasContent
 */
- (BOOL)hasContent;


/**
 Has Content and Error at oneTime call back.
 */
- (void)handleErrorWhenContentAvailable;

- (void)setupInitialViewState;
- (void)startLoading;
- (void)endLoadingWithError:(NSError * _Nullable)error;

@end

NS_ASSUME_NONNULL_END
