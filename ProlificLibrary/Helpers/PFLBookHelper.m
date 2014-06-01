//
//  PFLBookHelper.m
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/29/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import "PFLBookHelper.h"
#import "PFLNetworkHelper.h"
#import "PFLBookConstants.h"
#import "Book.h"

//STATIC STRINGS SPECIFIC TO THIS CLASS
static NSString *hostURL = @"http://ios-interview.herokuapp.com";
static NSString *allBooksURL = @"http://ios-interview.herokuapp.com/books";
static NSString *clearBooksURL = @"http://ios-interview.herokuapp.com/clean";
static NSString *bookServerDateFormat = @"yyyy-MM-dd HH:mm:ss zzz";
static NSString *localeIdentifier = @"en-GB";
static NSString *books = @"books";

@interface PFLBookHelper ()

//PRIVATE PROPERTY
@property (nonatomic, strong)PFLNetworkHelper *networkHelper;

@end

@implementation PFLBookHelper

#pragma mark - Constructor

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.networkHelper = [PFLNetworkHelper sharedManager];
    }
    
    return self;
}

#pragma mark - Book Specific Methods

- (void)populateBooksWithCompletionBlock:(void (^)(BOOL completed))completionBlock
{
    [self.networkHelper dataWithURLString:allBooksURL andAttribute:books withCompletionBlock:^(NSMutableDictionary *details) {
        if(details)
        {
            for (NSMutableDictionary *bookInfo in details) {
                Book *book = [Book create];
                
                book.author = [bookInfo valueForKey:BookAuthor];
                book.bookUrl = [NSString stringWithFormat:@"%@%@", hostURL, [bookInfo valueForKey:BookURL]];
                book.category = [bookInfo valueForKey:BookCategories];
                book.lastCheckedOutBy = [bookInfo valueForKey:BookLastCheckedOutBy];
                book.publisher = [bookInfo valueForKey:BookPublisher];
                book.title = [bookInfo valueForKey:BookName];
                [book save];
            }
            completionBlock(YES);
        }
        completionBlock(NO);
    }];
}

- (void)clearAllBooksWithCompletionBlock:(void (^)(BOOL done))completionBlock
{
    [self.networkHelper removeDataAtURL:clearBooksURL withCompletionBlock:^(BOOL completed) {
        if (completed) {
            [Book deleteAll];
            completionBlock(YES);
        }
        completionBlock(NO);
    }];
}

- (void)addBookWithData:(NSMutableDictionary *)data withCompletionBlock:(void (^)(BOOL done))completionBlock
{
    [self.networkHelper addDataAtURL:allBooksURL withDetails:data withCompletionBlock:^(BOOL completed) {
        if (completed) {
            Book *book = [Book create];
            book.author = [data valueForKey:BookAuthor];
            book.bookUrl = [NSString stringWithFormat:@"%@%@", hostURL, [data valueForKey:BookURL]];
            book.category = [data valueForKey:BookCategories];
            book.lastCheckedOutBy = [data valueForKey:BookLastCheckedOutBy];
            book.lastCheckedOutDate = [data valueForKey:BookLastCheckedOutDate];
            book.publisher = [data valueForKey:BookPublisher];
            book.title = [data valueForKey:BookName];
            [book save];
            completionBlock(YES);
        }
        completionBlock(NO);
    }];
}

- (void)checkoutBook:(NSString *)bookName atURL:(NSString *)url withUserName:(NSString *)userName withCompletionBlock:(void (^)(BOOL done))completionBlock
{
    NSMutableDictionary *checkoutDetails = [[NSMutableDictionary alloc] init];
    
    //SETUP DATE FORMATTING
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:bookServerDateFormat];
    NSLocale *enLocale = [[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier];
    dateFormatter.locale = enLocale;
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    
    //ADD THE CHECKOUT DETAILS
    [checkoutDetails setObject:userName forKey:BookLastCheckedOutBy];
    [checkoutDetails setObject:dateString forKey:BookLastCheckedOutDate];
    
    //UPDATE THE DATABASE
    [self.networkHelper updateDataAtURL:url withDetails:checkoutDetails withCompletionBlock:^(BOOL completed) {
        if (completed) {
            Book *book = [Book find:@"title == %@ AND bookUrl == %@", bookName, url];
            book.lastCheckedOutBy = userName;
            book.lastCheckedOutDate = dateString;
            [book save];
            completionBlock(YES);
        }
        completionBlock(NO);
    }];
}

@end
