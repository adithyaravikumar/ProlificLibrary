//
//  PFLLibraryHomeViewController.m
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/29/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import "PFLLibraryHomeViewController.h"
#import "PFLBookDetailsViewController.h"
#import "PFLAddBookViewController.h"
#import "PFLBookHelper.h"
#import "PFLHeaderTemplateView.h"
#import "PFLBookDisplayCell.h"
#import "PFLAssetNames.h"
#import "Book.h"

static NSString *kCellIdentifier = @"BookCell";

@interface PFLLibraryHomeViewController ()
@property (nonatomic, strong)UIImageView *reloadDisplayImageView;
@property (nonatomic, strong)PFLBookHelper *bookHelper;
@property (nonatomic, strong)PFLHeaderTemplateView *headerTemplateView;
@end

@implementation PFLLibraryHomeViewController

#pragma mark - Default Methods

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        // Custom initialization
        self.bookHelper = [[PFLBookHelper alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithHexValue:0xe5e5e5 alpha:1.0f]];
    
    if([Book all] == nil || [Book all].count == 0)
    {
        [self populateBookDatabase];
    }
    
    [self setupCollectionView];
    
    self.headerTemplateView = [[PFLHeaderTemplateView alloc] initWithFrame:
                               CGRectMake(0, 0, self.view.frame.size.width,
                                          self.view.frame.size.height *0.12)];
    [self.view addSubview:self.headerTemplateView];
    [self.headerTemplateView.rightButton addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventTouchUpInside];
    [self setupHeaderViewIcons];
    [self layoutCollectionView];
    [self setupReloadDisplayImageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Reloading Image Setup And Layout

- (void)setupReloadDisplayImageView
{
    self.reloadDisplayImageView = [[UIImageView alloc] init];
    [self.reloadDisplayImageView setImage:[UIImage imageNamed:ReloadDisplayImageIcon]];
    [self.view addSubview:self.reloadDisplayImageView];
    [self layoutReloadDisplayImageView];
    [self.reloadDisplayImageView setHidden:YES];
}

- (void)layoutReloadDisplayImageView
{
    [self.reloadDisplayImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Center X Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.reloadDisplayImageView
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    //Center Y Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.reloadDisplayImageView
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1.0
                              constant:0.0]];
    
    //Width Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.reloadDisplayImageView
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.5
                              constant:0.0]];
    
    //Height Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.reloadDisplayImageView
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.5
                              constant:0.0]];
}

#pragma mark - Header View Setup And Layout

- (void)setupHeaderViewIcons
{
    [self.headerTemplateView setLeftButtonWithImage:[UIImage imageNamed:AddButtonIcon]];
    [self.headerTemplateView.leftButton addTarget:self action:@selector(navigateToAddScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.headerTemplateView setRightButtonWithImage:[UIImage imageNamed:RefreshButtonIcon]];
}

#pragma mark - CollectionView setup and layout

- (void)setupCollectionView
{
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[PFLBookDisplayCell class]
            forCellWithReuseIdentifier:kCellIdentifier];
}

- (void)layoutCollectionView
{
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Left Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.collectionView
                              attribute:NSLayoutAttributeLeft
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeLeft
                              multiplier:1.0
                              constant:0.0]];
    
    //Top Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.collectionView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.headerTemplateView
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    
    //Width Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.collectionView
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0.0]];
    
    //Bottom Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.collectionView
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
}

#pragma mark - Networking Methods

- (void)populateBookDatabase
{
    PFLLibraryHomeViewController *__weak weakSelf = self;
    [self.bookHelper populateBooksWithCompletionBlock:^(BOOL completed) {
        if(completed)
        {
            [weakSelf.collectionView reloadData];
        }
    }];
}

#pragma mark - Button Handlers

- (void)navigateToAddScreen
{
    PFLAddBookViewController *addBookViewController = [[PFLAddBookViewController alloc] init];
    [self.navigationController pushViewController:addBookViewController animated:YES];
}

- (void)reloadData
{
    [Book deleteAll];
    [self populateBookDatabase];
}

#pragma mark - Delegate Methods specific to UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.reloadDisplayImageView.hidden = [Book all].count == 0 ? NO : YES;
    return [Book all].count;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PFLBookDisplayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor whiteColor]];
    [cell setupItemsWithBookData:[Book all][indexPath.item]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width*0.9, collectionView.frame.size.height*0.3);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PFLBookDetailsViewController *bookDetailsviewController = [[PFLBookDetailsViewController alloc] initWithBookData:[Book all][indexPath.item]];
    [self.navigationController pushViewController:bookDetailsviewController animated:YES];
}

@end
