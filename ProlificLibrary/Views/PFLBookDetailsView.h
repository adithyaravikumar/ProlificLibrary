//
//  PFLBookDetailsView.h
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/30/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

@class Book;
@interface PFLBookDetailsView : UIView
@property (nonatomic, strong, readonly)UITextField *userName;
@property (nonatomic, strong, readonly)UIButton *checkoutButton;

- (instancetype)initWithBookDetails:(Book *)book;
- (void)layoutItems;

@end
