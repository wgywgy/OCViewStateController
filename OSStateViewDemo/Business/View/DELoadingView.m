//
//  DELoadingView.m
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import "DELoadingView.h"
@interface DELoadingView()
@property(nonatomic, strong) UILabel *label;
@end

@implementation DELoadingView

- (void)setupView {
    [super setupView];
    self.label = [[UILabel alloc] init];
    self.label.text = @"Loading...";
    
    self.label.translatesAutoresizingMaskIntoConstraints = false;
    [self.centerView addSubview:self.label];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [indicatorView startAnimating];
    [self.centerView addSubview:indicatorView];
    
    NSDictionary *views = @{@"label": self.label, @"activity": indicatorView};
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[activity]-[label]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    NSArray *vConstraintsLabel = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[label]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];
    NSArray *vConstraintsActivity = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[activity]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];

    [self.centerView addConstraints:hConstraints];
    [self.centerView addConstraints:vConstraintsLabel];
    [self.centerView addConstraints:vConstraintsActivity];
}

@end
