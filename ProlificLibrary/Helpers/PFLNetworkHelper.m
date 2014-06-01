//
//  PFLNetworkHelper.m
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/28/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "PFLNetworkHelper.h"

//STATIC VALUES
static PFLNetworkHelper *kSharedInstance = nil;

@interface PFLNetworkHelper ()
@property (nonatomic, strong)AFHTTPRequestOperationManager *requestOperationManager;
@end

@implementation PFLNetworkHelper

#pragma mark - Method for creating singleton

+ (id)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kSharedInstance = [[self alloc] initNetworkHelper];
    });
    return kSharedInstance;
}

#pragma mark - Other Constructors

- (instancetype)initNetworkHelper
{
    self = [super init];
    if (self) {
        self.requestOperationManager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

#pragma mark - Networking methods

- (void)addDataAtURL:(NSString *)url withDetails:(NSMutableDictionary *)details withCompletionBlock:(void (^)(BOOL completed))completionBlock
{
    [self.requestOperationManager POST:url parameters:details success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        completionBlock(YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completionBlock(NO);
    }];
}

- (void)updateDataAtURL:(NSString *)url withDetails:(NSMutableDictionary *)details withCompletionBlock:(void (^)(BOOL completed))completionBlock
{
    [self.requestOperationManager PUT:url parameters:details success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        completionBlock(YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completionBlock(NO);
    }];
}

- (void)removeDataAtURL:(NSString *)url withCompletionBlock:(void (^)(BOOL completed))completionBlock
{
    [self.requestOperationManager DELETE:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        completionBlock(YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completionBlock(NO);
    }];
}

- (void)dataWithURLString:(NSString *)url andAttribute:(NSString *)attribute withCompletionBlock:(void (^)(NSMutableDictionary *details))completionBlock
{
    [self.requestOperationManager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSMutableDictionary *details = [responseObject valueForKey:attribute];
        completionBlock(details);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completionBlock(nil);
    }];
}

@end
