//
//  PFLBookDisplayCell.h
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/29/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

@class Book;

@interface PFLBookDisplayCell : UICollectionViewCell
@property (nonatomic, strong, readonly)UILabel *bookTitle;
@property (nonatomic, strong, readonly)UILabel *bookAuthor;
@property (nonatomic, strong, readonly)UILabel *bookPublisher;
@property (nonatomic, strong, readonly)UILabel *bookCategories;
@property (nonatomic, strong, readonly)UILabel *detailsLabel;
@property (readonly)BOOL initialized;

- (void)setupItemsWithBookData:(Book *)book;

@end
