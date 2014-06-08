// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Todo.m instead.

#import "_Todo.h"

const struct TodoAttributes TodoAttributes = {
	.deadline = @"deadline",
	.duration = @"duration",
	.title = @"title",
	.updateDate = @"updateDate",
};

const struct TodoRelationships TodoRelationships = {
};

const struct TodoFetchedProperties TodoFetchedProperties = {
};

@implementation TodoID
@end

@implementation _Todo

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Entity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Entity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:moc_];
}

- (TodoID*)objectID {
	return (TodoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"durationValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"duration"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic deadline;






@dynamic duration;



- (int64_t)durationValue {
	NSNumber *result = [self duration];
	return [result longLongValue];
}

- (void)setDurationValue:(int64_t)value_ {
	[self setDuration:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveDurationValue {
	NSNumber *result = [self primitiveDuration];
	return [result longLongValue];
}

- (void)setPrimitiveDurationValue:(int64_t)value_ {
	[self setPrimitiveDuration:[NSNumber numberWithLongLong:value_]];
}





@dynamic title;






@dynamic updateDate;











@end
