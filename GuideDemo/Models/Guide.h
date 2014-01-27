//
//  Guide.h
//  
//
//  Created by Mamnun Bhuiyan on 28/01/2014.
//  Copyright (c) 2014. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Guide : NSObject <NSCoding> {
    NSNumber *resultCount;
    NSArray *results;
}

@property (nonatomic, strong) NSNumber *resultCount;
@property (nonatomic, strong) NSArray *results;

+ (Guide *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
