//
//  ViewController.m
//  JSONValidatorDemo
//
//  Created by Hefeng Wang on 17/3/11.
//  Copyright © 2017年 WindChaser. All rights reserved.
//

#import "ViewController.h"

#import <NSDictionary+JAKJSONValidator.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *json = @{
                           @"phoneNumber" : @"123-555-6789",
                           @"name" : @"Johnny Ringo",
                           @"age" : @"BANANA",
                           @"weight" : @"130.3",
                           @"ssn" : [NSNull null],
                           @"children" : @[],
                           @"car" : @{
                                    @"brand": @"Cherry",
                                    @"type" : @"瑞虎5 摩卡棕",
                                   }
                           };
    NSLog(@"Name       : %@", [json stringKey:@"name"]);
    NSLog(@"age: %ld", [json integerKey:@"age"]);
    NSLog(@"weight: %lf", [json doubleKey:@"weight" defaultValue:70.0]);
    NSLog(@"PhoneNumber: %@", [json stringKey:@"phoneNumber"]);
    NSLog(@"car: %@", [json dictionaryKey:@"car"]);
    NSLog(@"wife: %@", [json stringKey:@"wife"] ?: @"Unknown");
    NSLog(@"children: %@", [json arrayKey:@"children"]);
}


@end
