//
//  PFLAddBookViewController.m
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/30/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import "PFLAddBookViewController.h"
#import "PFLHeaderTemplateView.h"
#import "PFLBookHelper.h"
#import "PFLBookConstants.h"
#import "PFLAssetNames.h"
#import "PFLFontNames.h"
#import "Book.h"

//STATIC STRINGS SPECIFIC TO THIS CLASS
static NSString *addBookPlaceholder = @"Add a book!";
static NSString *bookTitlePlaceholder = @"Book Title";
static NSString *authorPlaceholder = @"Author";
static NSString *publisherPlaceholder = @"Publisher";
static NSString *categoriesPlaceholder = @"Categories";
static NSString *submitButtonPlaceholder = @"Add Book!";

@interface PFLAddBookViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)PFLBookHelper *bookHelper;
@property (nonatomic, strong)PFLHeaderTemplateView *headerTemplateView;
@property (nonatomic, strong)UILabel *addBookTitle;
@property (nonatomic, strong)UITextField *titleTextField;
@property (nonatomic, strong)UITextField *authorTextField;
@property (nonatomic, strong)UITextField *publisherTextField;
@property (nonatomic, strong)UITextField *categoriesTextField;
@property (nonatomic, strong)UIButton *submitButton;
@end

@implementation PFLAddBookViewController

#pragma mark - Default Methods

- (id)init
{
    self = [super init];
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
    
    self.headerTemplateView = [[PFLHeaderTemplateView alloc] initWithFrame:
                               CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height *0.12)];
    [self.view addSubview:self.headerTemplateView];
    [self setupHeaderViewIcons];
    
    [self.headerTemplateView.leftButton addTarget:self action:@selector(navigateToHome) forControlEvents:UIControlEventTouchUpInside];
    
    [self setupFormComponents];
    [self layoutFormComponents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Form Components Setup and layout

- (void)setupFormComponents
{
    self.addBookTitle = [[UILabel alloc] init];
    [self.addBookTitle setText:addBookPlaceholder];
    [self.addBookTitle setFont:[UIFont fontWithName:AvenirLight size:20.0f]];
    [self.addBookTitle setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.addBookTitle];
    
    self.titleTextField = [[UITextField alloc] init];
    [self.titleTextField setDelegate:self];
    [self.titleTextField setPlaceholder:bookTitlePlaceholder];
    [self.titleTextField setBackgroundColor:[UIColor whiteColor]];
    [self.titleTextField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.titleTextField];
    
    self.authorTextField = [[UITextField alloc] init];
    [self.authorTextField setDelegate:self];
    [self.authorTextField setPlaceholder:authorPlaceholder];
    [self.authorTextField setBackgroundColor:[UIColor whiteColor]];
    [self.authorTextField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.authorTextField];
    
    self.publisherTextField = [[UITextField alloc] init];
    [self.publisherTextField setDelegate:self];
    [self.publisherTextField setPlaceholder:publisherPlaceholder];
    [self.publisherTextField setBackgroundColor:[UIColor whiteColor]];
    [self.publisherTextField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.publisherTextField];
    
    self.categoriesTextField = [[UITextField alloc] init];
    [self.categoriesTextField setDelegate:self];
    [self.categoriesTextField setPlaceholder:categoriesPlaceholder];
    [self.categoriesTextField setBackgroundColor:[UIColor whiteColor]];
    [self.categoriesTextField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.categoriesTextField];
    
    self.submitButton = [[UIButton alloc] init];
    [self.submitButton setBackgroundColor:[UIColor colorWithHexValue:0xd45048 alpha:1.0f]];
    [self.submitButton.titleLabel setFont:[UIFont fontWithName:HelveticaNueueLight size:18.0f]];
    [self.submitButton setTitle:submitButtonPlaceholder forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submitButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.submitButton addTarget:self action:@selector(submitData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.submitButton];
}

- (void)layoutFormComponents
{
    [self layoutTitle];
    [self layoutBookTitleTextField];
    [self layoutAuthorTextField];
    [self layoutPublisherTextField];
    [self layoutCategoriesTextField];
    [self layoutSubmitButton];
}

- (void)layoutTitle
{
    [self.addBookTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self.view addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.addBookTitle
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.view
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //Top Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.addBookTitle
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.headerTemplateView
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:10.0]];
    
    //Width Constraint
    [self.view addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.addBookTitle
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.view
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.8
                         constant:0.0]];
    
    //Height Constraint
    [self.view addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.addBookTitle
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.view
                         attribute:NSLayoutAttributeWidth
                         multiplier:0.1
                         constant:0.0]];
}

- (void)layoutBookTitleTextField
{
    [self.titleTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.titleTextField
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    //Top Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.titleTextField
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.addBookTitle
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:8.0]];
    
    //Width Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.titleTextField
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.addBookTitle
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0.0]];
    
    //Height Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.titleTextField
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.1
                              constant:0.0]];
}

- (void)layoutAuthorTextField
{
    [self.authorTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.authorTextField
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    //Top Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.authorTextField
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.titleTextField
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:8.0]];
    
    //Width Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.authorTextField
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.addBookTitle
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0.0]];
    
    //Height Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.authorTextField
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.1
                              constant:0.0]];
}

- (void)layoutPublisherTextField
{
    [self.publisherTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.publisherTextField
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    //Top Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.publisherTextField
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.authorTextField
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:8.0]];
    
    //Width Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.publisherTextField
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.addBookTitle
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0.0]];
    
    //Height Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.publisherTextField
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.1
                              constant:0.0]];
}

- (void)layoutCategoriesTextField
{
    [self.categoriesTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.categoriesTextField
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    //Top Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.categoriesTextField
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.publisherTextField
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:8.0]];
    
    //Width Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.categoriesTextField
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.addBookTitle
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0.0]];
    
    //Height Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.categoriesTextField
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.1
                              constant:0.0]];
}

- (void)layoutSubmitButton
{
    [self.submitButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //CenterX Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.submitButton
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    //Top Edge Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.submitButton
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.categoriesTextField
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:15.0]];
    
    //Width Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.submitButton
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.addBookTitle
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.6
                              constant:0.0]];
    
    //Height Constraint
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.submitButton
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.1
                              constant:0.0]];
}

#pragma mark - Header View Setup And Layout

- (void)setupHeaderViewIcons
{
    [self.headerTemplateView setLeftButtonWithImage:[UIImage imageNamed:BackButtonIcon]];
}

#pragma mark - Button Handlers

- (void)submitData
{
    BOOL invalidValue = [self invalidFields];
    
    if(invalidValue)
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Missing Data"
                              message: @"All fields are mandatory!"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] init];
        
        [dataDictionary setObject:self.titleTextField.text forKey:BookName];
        [dataDictionary setObject:self.authorTextField.text forKey:BookAuthor];
        [dataDictionary setObject:self.publisherTextField.text forKey:BookPublisher];
        [dataDictionary setObject:self.categoriesTextField.text forKey:BookCategories];
        [dataDictionary setObject:@"" forKey:BookLastCheckedOutBy];
        [dataDictionary setObject:@"" forKey:BookLastCheckedOutDate];
        
        PFLAddBookViewController *__weak weakSelf = self;
        
        UIActivityIndicatorView *__block spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        spinner.center = CGPointMake(self.view.center.x, self.view.frame.size.height - 100);
        spinner.hidesWhenStopped = YES;
        [self.view addSubview:spinner];
        [spinner startAnimating];
        
        [self.bookHelper addBookWithData:dataDictionary withCompletionBlock:^(BOOL done)
        {
            [spinner stopAnimating];
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        }];
    }
}

- (void)navigateToHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Validation methods

-(BOOL)invalidFields
{
    return  [PFLAddBookViewController stringIsNilOrEmpty:self.titleTextField.text] ||
            [PFLAddBookViewController stringIsNilOrEmpty:self.authorTextField.text] ||
            [PFLAddBookViewController stringIsNilOrEmpty:self.publisherTextField.text] ||
            [PFLAddBookViewController stringIsNilOrEmpty:self.categoriesTextField.text];
}

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

@end
