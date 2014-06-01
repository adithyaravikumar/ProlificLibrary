// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Book.m instead.

#import "_Book.h"

const struct BookAttributes BookAttributes = {
	.author = @"author",
	.bookUrl = @"bookUrl",
	.category = @"category",
	.checkedOut = @"checkedOut",
	.lastCheckedOutBy = @"lastCheckedOutBy",
	.lastCheckedOutDate = @"lastCheckedOutDate",
	.publisher = @"publisher",
	.title = @"title",
};

const struct BookRelationships BookRelationships = {
};

const struct BookFetchedProperties BookFetchedProperties = {
};

@implementation BookID
@end

@implementation _Book

@dynamic author;
@dynamic bookUrl;
@dynamic category;
@dynamic checkedOut;
@dynamic lastCheckedOutBy;
@dynamic lastCheckedOutDate;
@dynamic publisher;
@dynamic title;

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (BookID*)objectID {
	return (BookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"checkedOutValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"checkedOut"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

- (BOOL)checkedOutValue {
	NSNumber *result = [self checkedOut];
	return [result boolValue];
}

- (void)setCheckedOutValue:(BOOL)value_ {
	[self setCheckedOut:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCheckedOutValue {
	NSNumber *result = [self primitiveCheckedOut];
	return [result boolValue];
}

- (void)setPrimitiveCheckedOutValue:(BOOL)value_ {
	[self setPrimitiveCheckedOut:[NSNumber numberWithBool:value_]];
}

@end
