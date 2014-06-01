//
//  PFLBookDisplayCell.m
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/29/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import "PFLBookDisplayCell.h"
#import "PFLAssetNames.h"
#import "PFLFontNames.h"
#import "Book.h"

//STATIC STRINGS SPECIFIC TO THIS CLASS
static NSString *buttonPlaceholderText = @"View Details";

@interface PFLBookDisplayCell()
@property (nonatomic, strong, readwrite)UILabel *bookTitle;
@property (nonatomic, strong, readwrite)UILabel *bookAuthor;
@property (nonatomic, strong, readwrite)UILabel *bookPublisher;
@property (nonatomic, strong, readwrite)UILabel *bookCategories;
@property (nonatomic, strong, readwrite)UILabel *detailsLabel;
@property (nonatomic, strong)UIImageView *bookImageView;
@end

@implementation PFLBookDisplayCell

#pragma mark - Default Methods

-(instancetype) initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setupSubViews];
        [self layoutItems];
    }
    return self;
}

#pragma mark - Setup and Layout methods

- (void)setupSubViews {
    self.bookImageView = [[UIImageView alloc] init];
    [self.bookImageView setImage:[UIImage imageNamed:BookPlaceholderIcon]];
    [self.contentView addSubview:self.bookImageView];
    
    self.bookTitle = [[UILabel alloc] init];
    [self.bookTitle setFont:[UIFont fontWithName:AvenirLight size:12.0f]];
    [self.bookTitle setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.bookTitle];
    
    self.bookAuthor = [[UILabel alloc] init];
    [self.bookAuthor setFont:[UIFont fontWithName:HelveticaNueueLight size:10.0f]];
    [self.bookAuthor setTextColor:[UIColor darkGrayColor]];
    [self.bookAuthor setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.bookAuthor];
    
    self.bookPublisher = [[UILabel alloc] init];
    [self.bookPublisher setFont:[UIFont fontWithName:HelveticaNueueLight size:10.0f]];
    [self.bookPublisher setTextColor:[UIColor darkGrayColor]];
    [self.bookPublisher setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.bookPublisher];
    
    self.bookCategories = [[UILabel alloc] init];
    [self.bookCategories setFont:[UIFont fontWithName:HelveticaNueueLight size:10.0f]];
    [self.bookCategories setTextColor:[UIColor darkGrayColor]];
    [self.bookCategories setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.bookCategories];
    
    self.detailsLabel = [[UILabel alloc] init];
    [self.detailsLabel setBackgroundColor:[UIColor colorWithHexValue:0xd45048 alpha:1.0f]];
    [self.detailsLabel setFont:[UIFont fontWithName:HelveticaNueueLight size:12.0f]];
    [self.detailsLabel setText:buttonPlaceholderText];
    [self.detailsLabel setTextColor:[UIColor whiteColor]];
    [self.detailsLabel setTextAlignment:NSTextAlignmentCenter];
    [self.contentView addSubview:self.detailsLabel];
}

- (void)setupItemsWithBookData:(Book *)book
{
    [self.bookTitle setText:book.title];
    [self.bookAuthor setText:book.author];
    [self.bookPublisher setText:[NSString stringWithFormat:@"Published by %@", book.publisher]];
    [self.bookCategories setText:[NSString stringWithFormat:@"Categories: %@", book.category]];
    [self.detailsLabel setBackgroundColor:[UIColor colorWithHexValue:0xd45048 alpha:1.0f]];
}

- (void)layoutItems
{
    [self layoutBookImageView];
    [self layoutBookTitle];
    [self layoutBookAuthor];
    [self layoutBookPublisher];
    [self layoutBookCategories];
    [self layoutDetailsButton];
}

- (void)layoutBookImageView
{
    [self.bookImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Left Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookImageView
                         attribute:NSLayoutAttributeLeft
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeLeft
                         multiplier:1.0
                         constant:10.0]];
    
    //CenterY Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookImageView
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeCenterY
                         multiplier:1.0
                         constant:0.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookImageView
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.5
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookImageView
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.5
                         constant:0.0]];
}

- (void)layoutBookTitle
{
    [self.bookTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Left Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookTitle
                         attribute:NSLayoutAttributeLeft
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeLeft
                         multiplier:1.0
                         constant:10.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookTitle
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeTop
                         multiplier:1.0
                         constant:10.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookTitle
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.9
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookTitle
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.15
                         constant:0.0]];
}

- (void)layoutBookAuthor
{
    [self.bookAuthor setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Left Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookAuthor
                         attribute:NSLayoutAttributeLeft
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.bookImageView
                         attribute:NSLayoutAttributeRight
                         multiplier:1.0
                         constant:10.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookAuthor
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.bookTitle
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:5.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookAuthor
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.9
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookAuthor
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.1
                         constant:0.0]];
}

- (void)layoutBookPublisher
{
    [self.bookPublisher setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Left Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookPublisher
                         attribute:NSLayoutAttributeLeft
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.bookImageView
                         attribute:NSLayoutAttributeRight
                         multiplier:1.0
                         constant:10.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookPublisher
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.bookAuthor
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:5.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookPublisher
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.9
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookPublisher
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.1
                         constant:0.0]];
}

- (void)layoutBookCategories
{
    [self.bookCategories setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Left Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookCategories
                         attribute:NSLayoutAttributeLeft
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.bookImageView
                         attribute:NSLayoutAttributeRight
                         multiplier:1.0
                         constant:10.0]];
    
    //Top Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookCategories
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.bookPublisher
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:5.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookCategories
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.9
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bookCategories
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.1
                         constant:0.0]];
}

- (void)layoutDetailsButton
{
    [self.detailsLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Left Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.detailsLabel
                         attribute:NSLayoutAttributeRight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeRight
                         multiplier:1.0
                         constant:-10.0]];
    
    //Bottom Edge Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.detailsLabel
                         attribute:NSLayoutAttributeBottom
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:-10.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.detailsLabel
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.4
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.detailsLabel
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.contentView
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.2
                         constant:0.0]];
}

@end
