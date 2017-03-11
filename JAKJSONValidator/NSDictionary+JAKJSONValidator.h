//
//  NSDictionary+JAKJSONValidator.h
//  Pods
//
//  Created by Hefeng Wang on 17/3/11.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JAKJSONValidator)

- (NSString *)stringKey:(NSString *)key;
- (NSNumber *)numberKey:(NSString *)key;
- (NSArray *)arrayKey:(NSString *)key;
- (NSDictionary *)dictionaryKey:(NSString *)key;
- (NSNumber *)booleanKey:(NSString *)key;
- (NSNull *)nullKey:(NSString *)key;

- (NSInteger)integerKey:(NSString *)key;
- (NSInteger)integerKey:(NSString *)key defaultValue:(NSInteger)defaultValue;
- (double)doubleKey:(NSString *)key;
- (double)doubleKey:(NSString *)key defaultValue:(double)defaultValue;
- (float)floatKey:(NSString *)key;
- (float)floatKey:(NSString *)key defaultValue:(float)defaultValue;
- (int)intKey:(NSString *)key;
- (int)intKey:(NSString *)key defaultValue:(int)defaultValue;
- (long long)longLongKey:(NSString *)key;
- (long long)longLongKey:(NSString *)key defaultValue:(long long)defaultValue;
- (BOOL)boolKey:(NSString *)key;
- (BOOL)boolKey:(NSString *)key defaultValue:(BOOL)defaultValue;

@end
