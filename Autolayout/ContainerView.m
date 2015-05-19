//
//  ContainerView.m
//  Autolayout
//
//  Created by Joel Marquez on 5/19/15.
//  Copyright (c) 2015 Etermax. All rights reserved.
//

#import "ContainerView.h"

#define INSET 20

@interface ContainerView()

@property (nonatomic, strong) UIView *childView;
@property (nonatomic, strong) UILabel *titleLbl;

@end

@implementation ContainerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = [self randomColor];
    
    self.childView                 = [UIView new];
    self.childView.backgroundColor = [self randomColor];
    [self addSubview:self.childView];
    [self.childView updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(INSET, INSET, 4 * INSET, INSET));
    }];
    
    self.titleLbl               = [UILabel new];
    self.titleLbl.textColor     = [self randomColor];
    self.titleLbl.text          = @"Hi!";
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLbl];
    [self.titleLbl updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(- INSET);
    }];
}

- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
