//
//  NSDictionary+JAKJSONValidator.m
//  Pods
//
//  Created by Hefeng Wang on 17/3/11.
//
//

#import "NSDictionary+JAKJSONValidator.h"
#import <RPJSONValidator.h>
#import <RPValidatorPredicate.h>

@implementation NSDictionary (JAKJSONValidator)

- (id)_valueForKey:(NSString *)key withPredicate:(RPValidatorPredicate *)predicate
{
    if (![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    id value = [self valueForKey:key];
    if (value == nil) {
        return nil;
    }
    NSError *error;
    [RPJSONValidator validateValuesFrom:@{key:value}
                       withRequirements:@{key:predicate}
                                  error:&error];
    if (error) {
        [RPJSONValidator prettyStringGivenRPJSONValidatorError:error];
        return nil;
    }
    return value;
}

#pragma mark - ObjectValue

- (NSString *)stringKey:(NSString *)key
{
    return (NSString *)[self _valueForKey:key withPredicate:RPValidatorPredicate.isString.isNotNull];
};

- (NSNumber *)numberKey:(NSString *)key
{
    return (NSNumber *)[self _valueForKey:key withPredicate:RPValidatorPredicate.isNumber.isNotNull];
}

- (NSArray *)arrayKey:(NSString *)key
{
    return (NSArray *)[self _valueForKey:key withPredicate:RPValidatorPredicate.isArray.isNotNull];
}

- (NSDictionary *)dictionaryKey:(NSString *)key
{
    return (NSDictionary *)[self _valueForKey:key withPredicate:RPValidatorPredicate.isDictionary.isNotNull];
}

- (NSNumber *)booleanKey:(NSString *)key
{
    return (NSNumber *)[self _valueForKey:key withPredicate:RPValidatorPredicate.isBoolean.isNotNull];
}

- (NSNull *)nullKey:(NSString *)key
{
    return (NSNull *)[self _valueForKey:key withPredicate:RPValidatorPredicate.isNull];
}

#pragma mark - ScalarValue

- (NSInteger)integerKey:(NSString *)key
{
    return [self integerKey:key defaultValue:0];
}

- (NSInteger)integerKey:(NSString *)key defaultValue:(NSInteger)defaultValue
{
    id value = [self numberKey:key] ? : [self stringKey:key];
    return value != nil ? [value integerValue] : defaultValue;
}

- (double)doubleKey:(NSString *)key
{
    return [self doubleKey:key defaultValue:0];
}

- (double)doubleKey:(NSString *)key defaultValue:(double)defaultValue
{
    id value = [self numberKey:key] ? : [self stringKey:key];
    return value != nil ? [value doubleValue] : defaultValue;
}

- (float)floatKey:(NSString *)key
{
    return [self floatKey:key defaultValue:0];
}

- (float)floatKey:(NSString *)key defaultValue:(float)defaultValue
{
    id value = [self numberKey:key] ? : [self stringKey:key];
    return value != nil ? [value floatValue] : defaultValue;
}

- (int)intKey:(NSString *)key
{
    return [self intKey:key defaultValue:0];
}

- (int)intKey:(NSString *)key defaultValue:(int)defaultValue
{
    id value = [self numberKey:key] ? : [self stringKey:key];
    return value != nil ? [value intValue] : defaultValue;
}

- (long long)longLongKey:(NSString *)key
{
    return [self longLongKey:key defaultValue:0];
}
- (long long)longLongKey:(NSString *)key defaultValue:(long long)defaultValue
{
    id value = [self numberKey:key] ? : [self stringKey:key];
    return value != nil ? [value longLongValue] : defaultValue;
}

- (BOOL)boolKey:(NSString *)key
{
    return [self boolKey:key defaultValue:NO];
}

- (BOOL)boolKey:(NSString *)key defaultValue:(BOOL)defaultValue
{
    id value = [self booleanKey:key];
    return value != nil ? [value integerValue] : defaultValue;
}

@end
