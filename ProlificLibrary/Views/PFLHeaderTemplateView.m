//
//  PFLHeaderTemplateView.m
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/29/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import "PFLHeaderTemplateView.h"
#import "PFLAssetNames.h"

@interface PFLHeaderTemplateView ()
@property (nonatomic, strong, readwrite)UIButton *leftButton;
@property (nonatomic, strong, readwrite)UIButton *rightButton;
@property (nonatomic, strong)UIImageView *logoImage;
@end

@implementation PFLHeaderTemplateView

#pragma mark - Default Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        [self addSubview:self.logoImage];
    }
    return self;
}

#pragma mark - Setup SubViews

- (void)setupSubViews
{
    // Initialization code
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    [self setBackgroundColor:[UIColor colorWithHexValue:0xff7a7a alpha:1.0f]];
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,
                                                                 height*0.55,
                                                                 height*0.55)];
    [self.leftButton setCenter:CGPointMake(30, self.center.y)];
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,
                                                                  height*0.55,
                                                                  height*0.55)];
    [self.rightButton setCenter:CGPointMake(width - 30, self.center.y)];
    self.logoImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,
                                                                   height*0.85,
                                                                   height*0.85)];
    [self.logoImage setImage:[UIImage imageNamed:LogoIcon]];
    [self.logoImage setCenter:self.center];
}

#pragma mark - Button Handlers

- (void)setLeftButtonWithImage:(UIImage *)image
{
    [self.leftButton setBackgroundImage:image
                               forState:UIControlStateNormal];
}

- (void)setRightButtonWithImage:(UIImage *)image
{
    [self.rightButton setBackgroundImage:image
                                forState:UIControlStateNormal];
}

@end
