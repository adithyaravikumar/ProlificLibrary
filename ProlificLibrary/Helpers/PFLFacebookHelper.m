//
//  PFLFacebookHelper.m
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 6/1/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "PFLFacebookHelper.h"

//STATIC VALUES
static PFLFacebookHelper *kSharedInstance = nil;

@interface PFLFacebookHelper()
@end

@implementation PFLFacebookHelper

#pragma mark - Method for creating singleton

+ (id)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kSharedInstance = [[self alloc] initFacebookHelper];
    });
    return kSharedInstance;
}

#pragma mark - Other Constructors

- (instancetype)initFacebookHelper
{
    self = [super init];
    return self;
}

- (void)shareOnFacebookWithBookName:(NSString *)bookName author:(NSString *)author bookURL:(NSString *)bookURL
{
    [FBSettings setLoggingBehavior:
     [NSSet setWithObject:FBLoggingBehaviorFBRequests]];
    
    NSURL *urlToShare = [NSURL URLWithString:bookURL];
    
    FBLinkShareParams *params = [[FBLinkShareParams alloc] initWithLink:urlToShare
                                                                   name:@"Check This Out!"
                                                                caption:[NSString stringWithFormat:@"%@ by %@",
                                                                         bookName, author]
                                                            description:[NSString stringWithFormat:@"Check out %@ by %@. It's awesome!",
                                                                         bookName, author]
                                                                picture:nil];
    [FBDialogs presentShareDialogWithParams:params
                                clientState:nil
                                    handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                        if (error) {
                                            NSLog(@"Error: %@", error.description);
                                        } else {
                                            NSLog(@"Success!");
                                        }
                                    }];
}

@end
