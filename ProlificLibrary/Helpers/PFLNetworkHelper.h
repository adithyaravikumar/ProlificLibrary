//
//  PFLNetworkHelper.h
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/28/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

@interface PFLNetworkHelper : NSObject

+ (id)sharedManager;

- (void)addDataAtURL:(NSString *)url withDetails:(NSMutableDictionary *)details withCompletionBlock:(void (^)(BOOL completed))completionBlock;

- (void)updateDataAtURL:(NSString *)url withDetails:(NSMutableDictionary *)details withCompletionBlock:(void (^)(BOOL completed))completionBlock;

- (void)removeDataAtURL:(NSString *)url withCompletionBlock:(void (^)(BOOL completed))completionBlock;

- (void)dataWithURLString:(NSString *)url andAttribute:(NSString *)attribute withCompletionBlock:(void (^)(NSMutableDictionary *details))completionBlock;

@end
