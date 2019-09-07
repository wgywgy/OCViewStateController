//
//  DEBasicPlaceholderView.h
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DEBasicPlaceholderView : UIView
@property(nonatomic, strong, readonly) UIView *centerView;
- (void)setupView;
@end

NS_ASSUME_NONNULL_END
