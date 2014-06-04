//
//  PFLBookDetailsViewController.m
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/30/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import "PFLBookDetailsViewController.h"
#import "PFLBookDetailsView.h"
#import "PFLHeaderTemplateView.h"
#import "PFLFacebookHelper.h"
#import "PFLBookHelper.h"
#import "PFLAssetNames.h"
#import "Book.h"

@interface PFLBookDetailsViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)PFLBookHelper *bookHelper;
@property (nonatomic, strong)PFLHeaderTemplateView *headerTemplateView;
@property (nonatomic, strong)Book *book;
@property (nonatomic, strong)PFLBookDetailsView *bookDetailsView;
@property (nonatomic, strong)PFLFacebookHelper *facebookHelper;
@end

@implementation PFLBookDetailsViewController

#pragma mark - Default Methods

- (instancetype)initWithBookData:(Book *)book
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.bookHelper = [[PFLBookHelper alloc] init];
        self.book = book;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithHexValue:0xe5e5e5 alpha:1.0f]];
    self.headerTemplateView = [[PFLHeaderTemplateView alloc] initWithFrame:
                               CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height *0.12)];
    [self.view addSubview:self.headerTemplateView];
    [self setupHeaderViewIcons];
    [self.headerTemplateView.leftButton addTarget:self action:@selector(navigateToHome) forControlEvents:UIControlEventTouchUpInside];
    [self.headerTemplateView.rightButton addTarget:self action:@selector(shareBookDetailsOnFacebook) forControlEvents:UIControlEventTouchUpInside];
    
    self.bookDetailsView = [[PFLBookDetailsView alloc] initWithBookDetails:self.book];
    [self.view addSubview:self.bookDetailsView];
    [self layoutDetailView];
    [self.bookDetailsView layoutItems];
    
    [self.bookDetailsView.userName setDelegate:self];
    [self.bookDetailsView.checkoutButton addTarget:self action:@selector(checkoutBook) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Header View Setup And Layout

- (void)setupHeaderViewIcons
{
    [self.headerTemplateView setLeftButtonWithImage:[UIImage imageNamed:BackButtonIcon]];
    [self.headerTemplateView setRightButtonWithImage:[UIImage imageNamed:ShareButtonIcon]];
}

#pragma mark - Detail ViewSetup and Layout

- (void)layoutDetailView
{
    [self.bookDetailsView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Left Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.bookDetailsView
                              attribute:NSLayoutAttributeLeft
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeLeft
                              multiplier:1.0
                              constant:0.0]];
    
    //Top Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.bookDetailsView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.headerTemplateView
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    
    //Width Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.bookDetailsView
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0.0]];
    
    //Bottom Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.bookDetailsView
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
}

#pragma mark - Button Handlers

- (void)navigateToHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)shareBookDetailsOnFacebook
{
    BOOL invalidInfo = [PFLBookDetailsViewController stringIsNilOrEmpty:self.book.title] || [PFLBookDetailsViewController stringIsNilOrEmpty:self.book.author] || [PFLBookDetailsViewController stringIsNilOrEmpty:self.book.bookUrl];
    
    if(invalidInfo)
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Missing Data"
                              message: @"Some of the book details are available!"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        self.facebookHelper = [PFLFacebookHelper sharedManager];
        [self.facebookHelper shareOnFacebookWithBookName:self.book.title
                                                  author:self.book.author
                                                 bookURL:self.book.bookUrl];
    }
}

- (void)checkoutBook
{
    NSString *userName = self.bookDetailsView.userName.text;
    if(userName == nil ||
       userName.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Missing Data"
                              message: @"Please Enter Your Name!"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        UIActivityIndicatorView *__block spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        spinner.center = CGPointMake(self.view.center.x, self.view.frame.size.height - 100);
        spinner.hidesWhenStopped = YES;
        [self.view addSubview:spinner];
        [spinner startAnimating];
        [self.bookHelper checkoutBook:self.book.title
                                atURL:self.book.bookUrl
                         withUserName:userName withCompletionBlock:^(BOOL done) {
                             UIAlertView *alert = [[UIAlertView alloc]
                                                   initWithTitle: @"Checkout Successful"
                                                   message: @"Your book was checked out!"
                                                   delegate: self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
                             [alert show];
                             [spinner stopAnimating];
                         }];
    }
}

#pragma mark - Validation methods

+(BOOL)stringIsNilOrEmpty:(NSString *)aString {
    if (!aString)
        return YES;
    return [aString isEqualToString:@""];
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}


#pragma mark - AlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
