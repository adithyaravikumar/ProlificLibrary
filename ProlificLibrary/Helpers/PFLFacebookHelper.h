//
//  PFLFacebookHelper.h
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 6/1/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

@interface PFLFacebookHelper : NSObject

//Use this method to initialize PFLFacebookHelper
+ (id)sharedManager;

//Method to share book details on Facebook
- (void)shareOnFacebookWithBookName:(NSString *)bookName author:(NSString *)author bookURL:(NSString *)bookURL;

@end
