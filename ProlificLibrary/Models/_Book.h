// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Book.h instead.

#import <CoreData/CoreData.h>

extern const struct BookAttributes {
	__unsafe_unretained NSString *author;
	__unsafe_unretained NSString *bookUrl;
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *checkedOut;
	__unsafe_unretained NSString *lastCheckedOutBy;
	__unsafe_unretained NSString *lastCheckedOutDate;
	__unsafe_unretained NSString *publisher;
	__unsafe_unretained NSString *title;
} BookAttributes;

extern const struct BookRelationships {
} BookRelationships;

extern const struct BookFetchedProperties {
} BookFetchedProperties;

@interface BookID : NSManagedObjectID {}
@end

@interface _Book : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BookID*)objectID;

@property (nonatomic, strong) NSString* author;

//- (BOOL)validateAuthor:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* bookUrl;

//- (BOOL)validateBookUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* checkedOut;

@property BOOL checkedOutValue;
- (BOOL)checkedOutValue;
- (void)setCheckedOutValue:(BOOL)value_;

//- (BOOL)validateCheckedOut:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastCheckedOutBy;

//- (BOOL)validateLastCheckedOutBy:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastCheckedOutDate;

//- (BOOL)validateLastCheckedOutDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* publisher;

//- (BOOL)validatePublisher:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@end

@interface _Book (CoreDataGeneratedAccessors)

@end

@interface _Book (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAuthor;
- (void)setPrimitiveAuthor:(NSString*)value;



- (NSString*)primitiveBookUrl;
- (void)setPrimitiveBookUrl:(NSString*)value;



- (NSString*)primitiveCategory;
- (void)setPrimitiveCategory:(NSString*)value;



- (NSNumber*)primitiveCheckedOut;
- (void)setPrimitiveCheckedOut:(NSNumber*)value;



- (BOOL)primitiveCheckedOutValue;
- (void)setPrimitiveCheckedOutValue:(BOOL)value_;



- (NSString*)primitiveLastCheckedOutBy;
- (void)setPrimitiveLastCheckedOutBy:(NSString*)value;



- (NSString*)primitiveLastCheckedOutDate;
- (void)setPrimitiveLastCheckedOutDate:(NSString*)value;



- (NSString*)primitivePublisher;
- (void)setPrimitivePublisher:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
