//
//  DEErrorView.m
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import "DEErrorView.h"
@interface DEErrorView()
@property(nonatomic, strong) UILabel *textLabel;
@property(nonatomic, strong) UILabel *detailTextLabel;

@end

@implementation DEErrorView

- (void)setupView {
    [super setupView];
    
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.text = @"Something went wrong.";
    
    self.textLabel.numberOfLines = 0;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.centerView addSubview:self.textLabel];
    
    self.detailTextLabel = [[UILabel alloc] init];
    self.detailTextLabel.text = @"Tap to reload";
    
    self.detailTextLabel.numberOfLines = 0;
    self.detailTextLabel.textColor = [UIColor grayColor];
    self.detailTextLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.centerView addSubview:self.detailTextLabel];
    
    NSDictionary *views = @{@"label": self.textLabel, @"detailLabel": self.detailTextLabel};
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[label]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    NSArray *hConstraintsDetail = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[detailLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[label]-[detailLabel]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];
    
    [self.centerView addConstraints:hConstraints];
    [self.centerView addConstraints:hConstraintsDetail];
    [self.centerView addConstraints:vConstraints];
    
    self.tapGes = [[UITapGestureRecognizer alloc] init];
    [self addGestureRecognizer:self.tapGes];
}

@end
