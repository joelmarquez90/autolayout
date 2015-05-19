//
//  ViewController.m
//  Autolayout
//
//  Created by Joel Marquez on 5/19/15.
//  Copyright (c) 2015 Etermax. All rights reserved.
//

#import "ViewController.h"

#import "ContainerView.h"

@interface ViewController ()

@property (nonatomic, strong) ContainerView *container1;
@property (nonatomic, strong) ContainerView *container2;
@property (nonatomic, strong) ContainerView *container3;
@property (nonatomic, strong) ContainerView *container4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
}

- (void)initViews
{
    self.container1 = [ContainerView new];
    [self.view addSubview:self.container1];
    [self.container1 updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view).dividedBy(2);
        make.height.equalTo(self.view).dividedBy(2);
    }];
    
    self.container2 = [ContainerView new];
    [self.view addSubview:self.container2];
    [self.container2 updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.container1);
        make.right.equalTo(self.view);
        make.width.equalTo(self.container1);
        make.height.equalTo(self.container1);
    }];
    
    self.container3 = [ContainerView new];
    [self.view addSubview:self.container3];
    [self.container3 updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.container1);
        make.width.equalTo(self.container1);
        make.height.equalTo(self.container1);
    }];
    
    self.container4 = [ContainerView new];
    [self.view addSubview:self.container4];
    [self.container4 updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.container3);
        make.right.equalTo(self.container2);
        make.width.equalTo(self.container1);
        make.height.equalTo(self.container1);
    }];
}

@end
