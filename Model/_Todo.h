// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Todo.h instead.

#import <CoreData/CoreData.h>


extern const struct TodoAttributes {
	__unsafe_unretained NSString *deadline;
	__unsafe_unretained NSString *duration;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *updateDate;
} TodoAttributes;

extern const struct TodoRelationships {
} TodoRelationships;

extern const struct TodoFetchedProperties {
} TodoFetchedProperties;







@interface TodoID : NSManagedObjectID {}
@end

@interface _Todo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TodoID*)objectID;





@property (nonatomic, strong) NSDate* deadline;



//- (BOOL)validateDeadline:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* duration;



@property int64_t durationValue;
- (int64_t)durationValue;
- (void)setDurationValue:(int64_t)value_;

//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updateDate;



//- (BOOL)validateUpdateDate:(id*)value_ error:(NSError**)error_;






@end

@interface _Todo (CoreDataGeneratedAccessors)

@end

@interface _Todo (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDeadline;
- (void)setPrimitiveDeadline:(NSDate*)value;




- (NSNumber*)primitiveDuration;
- (void)setPrimitiveDuration:(NSNumber*)value;

- (int64_t)primitiveDurationValue;
- (void)setPrimitiveDurationValue:(int64_t)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSDate*)primitiveUpdateDate;
- (void)setPrimitiveUpdateDate:(NSDate*)value;




@end
