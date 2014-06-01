//
//  PFLBookDetailsView.m
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/30/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import "PFLBookDetailsView.h"
#import "PFLAssetNames.h"
#import "PFLFontNames.h"
#import "Book.h"

@interface PFLBookDetailsView()
@property (nonatomic, strong)UIImageView *bookImage;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *author;
@property (nonatomic, strong)UILabel *publisher;
@property (nonatomic, strong)UILabel *categories;
@property (nonatomic, strong)UILabel *status;
@property (nonatomic, strong)UITextField *userName;
@property (nonatomic, strong, readwrite)UIButton *checkoutButton;
@end

@implementation PFLBookDetailsView

#pragma mark - Default Methods

- (instancetype)initWithBookDetails:(Book *)book
{
    self = [super init];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor colorWithHexValue:0xe5e5e5 alpha:1.0f]];
        
        [self setupSubViewsWithBookData:book];
    }
    return self;
}

#pragma mark - Setup and Layout Methods

- (void)setupSubViewsWithBookData:(Book *)book
{
    self.bookImage = [[UIImageView alloc] init];
    [self.bookImage setImage:[UIImage imageNamed:BookPlaceholderIcon]];
    [self addSubview:self.bookImage];
    
    self.title = [[UILabel alloc] init];
    [self.title setText:book.title];
    [self.title setFont:[UIFont fontWithName:AvenirLight size:13.0f]];
    [self.title setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.title];
    
    self.author = [[UILabel alloc] init];
    [self.author setText:book.author];
    [self.author setTextColor:[UIColor darkGrayColor]];
    [self.author setFont:[UIFont fontWithName:HelveticaNueueLight size:11.0f]];
    [self.author setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.author];
    
    self.publisher = [[UILabel alloc] init];
    [self.publisher setText:[NSString stringWithFormat:@"Published by %@", book.publisher]];
    [self.publisher setTextColor:[UIColor darkGrayColor]];
    [self.publisher setFont:[UIFont fontWithName:HelveticaNueueLight size:11.0f]];
    [self.publisher setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.publisher];
    
    self.categories = [[UILabel alloc] init];
    [self.categories setText:[NSString stringWithFormat:@"Categories: %@", book.category]];
    [self.categories setTextColor:[UIColor darkGrayColor]];
    [self.categories setFont:[UIFont fontWithName:HelveticaNueueLight size:11.0f]];
    [self.categories setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.categories];
    
    self.status = [[UILabel alloc] init];
    [self.status setFont:[UIFont fontWithName:HelveticaNueueLight size:14.0f]];
    [self.status setTextColor:[UIColor darkGrayColor]];
    [self.status setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.status];
    
    self.userName = [[UITextField alloc] init];
    [self.userName setPlaceholder:@"Name"];
    [self.userName setBackgroundColor:[UIColor whiteColor]];
    [self.userName setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.userName];
    
    self.checkoutButton = [[UIButton alloc] init];
    [self.checkoutButton setBackgroundColor:[UIColor colorWithHexValue:0xd45048 alpha:1.0f]];
    [self.checkoutButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:22.0f]];
    [self.checkoutButton setTitle:@"Checkout!" forState:UIControlStateNormal];
    [self.checkoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.checkoutButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.checkoutButton];
    
    if (book.lastCheckedOutBy == nil || book.lastCheckedOutBy.length <= 0) {
        [self.status setText:@"This book is available for checkout!"];
    }
    else
    {
        [self.status setText:[NSString stringWithFormat:@"Last checked out by %@", book.lastCheckedOutBy]];
        [self.userName setAlpha:0.6f];
        [self.checkoutButton setAlpha:0.6f];
        [self.checkoutButton setEnabled:NO];
        [self.userName setEnabled:NO];
    }
}

- (void)layoutItems
{
    [self layoutBookImage];
    [self layoutTitleLabel];
    [self layoutAuthorLabel];
    [self layoutPublisherLabel];
    [self layoutCategoriesLabel];
    [self layoutStatusLabel];
    [self layoutUserNameTextField];
    [self layoutCheckoutButton];
}

- (void)layoutBookImage
{
    [self.bookImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookImage
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookImage
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeTop
                         multiplier:1.0
                         constant:20.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookImage
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.16
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookImage
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.16
                         constant:0.0]];
}

- (void)layoutTitleLabel
{
    [self.title setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.title
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.title
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.bookImage
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:0.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.title
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.title
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.05
                         constant:0.0]];
}

- (void)layoutAuthorLabel
{
    [self.author setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.author
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.author
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.title
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:0.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.author
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.author
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.05
                         constant:0.0]];
}

- (void)layoutPublisherLabel
{
    [self.publisher setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.publisher
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.publisher
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.author
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:0.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.publisher
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.publisher
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.05
                         constant:0.0]];
}

- (void)layoutCategoriesLabel
{
    [self.categories setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.categories
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.categories
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.publisher
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:0.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.categories
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.categories
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.05
                         constant:0.0]];
}

- (void)layoutStatusLabel
{
    [self.status setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.status
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.status
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.categories
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:0.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.status
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.status
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.05
                         constant:0.0]];
}

- (void)layoutUserNameTextField
{
    [self.userName setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.userName
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.userName
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.status
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:2.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.userName
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.5
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.userName
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.05
                         constant:0.0]];
}

- (void)layoutCheckoutButton
{
    [self.checkoutButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.checkoutButton
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.checkoutButton
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.userName
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:10.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.checkoutButton
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.5
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.checkoutButton
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.1
                         constant:0.0]];
}

@end
