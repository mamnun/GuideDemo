//
//  Guide.m
//  
//
//  Created by Mamnun Bhuiyan on 28/01/2014.
//  Copyright (c) 2014. All rights reserved.
//

#import "Guide.h"

#import "Program.h"

@implementation Guide

@synthesize resultCount;
@synthesize results;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.resultCount forKey:@"resultCount"];
    [encoder encodeObject:self.results forKey:@"results"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.resultCount = [decoder decodeObjectForKey:@"resultCount"];
        self.results = [decoder decodeObjectForKey:@"results"];
    }
    return self;
}

+ (Guide *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Guide *instance = [[Guide alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key {

    if ([key isEqualToString:@"results"]) {

        if ([value isKindOfClass:[NSArray class]]) {

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                Program *populatedMember = [Program instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.results = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    if ([key isEqualToString:@"count"]) {
        [self setValue:value forKey:@"resultCount"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation {

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.resultCount) {
        [dictionary setObject:self.resultCount forKey:@"resultCount"];
    }

    if (self.results) {
        [dictionary setObject:self.results forKey:@"results"];
    }

    return dictionary;

}

@end
