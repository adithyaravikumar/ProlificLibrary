//
//  PFLBookHelper.h
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/29/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

@class Book;

@interface PFLBookHelper : NSObject

- (void)populateBooksWithCompletionBlock:(void (^)(BOOL completed))completionBlock;

- (void)clearAllBooksWithCompletionBlock:(void (^)(BOOL done))completionBlock;

- (void)addBookWithData:(NSMutableDictionary *)data withCompletionBlock:(void (^)(BOOL done))completionBlock;

- (void)checkoutBook:(NSString *)bookName atURL:(NSString *)url withUserName:(NSString *)userName withCompletionBlock:(void (^)(BOOL done))completionBlock;

@end
