//
//  Program.m
//  
//
//  Created by Mamnun Bhuiyan on 28/01/2014.
//  Copyright (c) 2014. All rights reserved.
//

#import "Program.h"

@implementation Program

@synthesize channel;
@synthesize endTime;
@synthesize name;
@synthesize rating;
@synthesize startTime;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.channel forKey:@"channel"];
    [encoder encodeObject:self.endTime forKey:@"endTime"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.rating forKey:@"rating"];
    [encoder encodeObject:self.startTime forKey:@"startTime"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.channel = [decoder decodeObjectForKey:@"channel"];
        self.endTime = [decoder decodeObjectForKey:@"endTime"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.rating = [decoder decodeObjectForKey:@"rating"];
        self.startTime = [decoder decodeObjectForKey:@"startTime"];
    }
    return self;
}

+ (Program *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Program *instance = [[Program alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    if ([key isEqualToString:@"end_time"]) {
        [self setValue:value forKey:@"endTime"];
    } else if ([key isEqualToString:@"start_time"]) {
        [self setValue:value forKey:@"startTime"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation {

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.channel) {
        [dictionary setObject:self.channel forKey:@"channel"];
    }

    if (self.endTime) {
        [dictionary setObject:self.endTime forKey:@"endTime"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.rating) {
        [dictionary setObject:self.rating forKey:@"rating"];
    }

    if (self.startTime) {
        [dictionary setObject:self.startTime forKey:@"startTime"];
    }

    return dictionary;

}

@end
