//
//  PFLAppDelegate.h
//  ProlificLibrary
//
//  Created by Adithya Ravikumar on 5/28/14.
//  Copyright (c) 2014 ProlificLibrary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
