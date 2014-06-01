//
//  PFLHeaderTemplateView.h
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/29/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

@interface PFLHeaderTemplateView : UIView
@property (nonatomic, strong, readonly)UIButton *leftButton;
@property (nonatomic, strong, readonly)UIButton *rightButton;

- (void)setLeftButtonWithImage:(UIImage *)image;
- (void)setRightButtonWithImage:(UIImage *)image;

@end