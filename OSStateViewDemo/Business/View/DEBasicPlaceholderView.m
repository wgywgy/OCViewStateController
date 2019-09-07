//
//  DEBasicPlaceholderView.m
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import "DEBasicPlaceholderView.h"

@interface DEBasicPlaceholderView()
@property(nonatomic, strong) UIView *centerView;
@end

@implementation DEBasicPlaceholderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    
    self.centerView = [[UIView alloc] init];
    self.centerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_centerView];
    
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-(>=20)-[centerView]-(>=20)-|"
                                                                    options:NSLayoutFormatAlignAllCenterX
                                                                    metrics:nil
                                                                      views:@{@"centerView": self.centerView}];

    NSLayoutConstraint *hConstraint = [NSLayoutConstraint constraintWithItem:self.centerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:self.centerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    [self addConstraints:vConstraints];
    [self addConstraint:hConstraint];
    [self addConstraint:centerConstraint];
}

@end
