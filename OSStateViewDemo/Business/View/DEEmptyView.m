//
//  DEEmptyView.m
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import "DEEmptyView.h"
@interface DEEmptyView()
@property(nonatomic, strong) UILabel *label;
@end
@implementation DEEmptyView

- (void)setupView {
    [super setupView];
    self.label = [[UILabel alloc] init];
    self.label.text = @"No Content.";
    
    self.label.numberOfLines = 0;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.translatesAutoresizingMaskIntoConstraints = false;
    [self.centerView addSubview:self.label];
    
    NSDictionary *views = @{@"label": self.label};
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[label]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[label]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];
    
    [self.centerView addConstraints:hConstraints];
    [self.centerView addConstraints:vConstraints];
}

@end
