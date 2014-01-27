//
//  Program.h
//  
//
//  Created by Mamnun Bhuiyan on 28/01/2014.
//  Copyright (c) 2014. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Program : NSObject <NSCoding> {
    NSString *channel;
    NSString *endTime;
    NSString *name;
    NSString *rating;
    NSString *startTime;
}

@property (nonatomic, strong) NSString *channel;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *startTime;

+ (Program *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
