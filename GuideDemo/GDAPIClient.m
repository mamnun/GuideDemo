//
//  GDAPIClient.m
//  GuideDemo
//
//  Created by Mamnun Bhuiyan on 28/01/2014.
//  Copyright (c) 2014 Mamnun. All rights reserved.
//

#import "GDAPIClient.h"
#import "Guide.h"
#import "Program.h"

#define PAGESIZE 0
#define PROGRAM_KEY @"programs"

static NSString * const GDAPIBaseURLString = @"http://www.whatsbeef.net/wabz";

@interface GDAPIClient ()

@property(nonatomic, strong) NSCache *programCache;
@property(nonatomic, assign) NSInteger pageCount;
@end

@implementation GDAPIClient

+ (instancetype)sharedClient {
    static GDAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[GDAPIClient alloc] initWithBaseURL:[NSURL URLWithString:GDAPIBaseURLString]];
        _sharedClient.programCache = [[NSCache alloc] init];
        [_sharedClient.programCache setObject:[[NSMutableArray alloc] init] forKey:PROGRAM_KEY];
        _sharedClient.pageCount = 0;
        
    });
    
    return _sharedClient;
}

- (NSURLSessionDataTask *)loadProgramsWithBlock:(void (^)(NSArray *programs, NSError *error))block{
    NSDictionary *parameters = @{ @"start": @(PAGESIZE * _pageCount) };
    return [self GET:@"guide.php" parameters:parameters success:^(NSURLSessionDataTask *__unused task, id JSON) {
        _pageCount++;
        Guide *guideResult = [Guide instanceFromDictionary:JSON];
        [self.programs addObjectsFromArray:guideResult.results];
        if (block != nil) {
            block(guideResult.results, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block != nil) {
            block(nil, error);
        }
    }];
}

- (NSURLSessionDataTask *)reloadProgramsWithBlock:(void (^)(NSArray *programs, NSError *error))block{
    _pageCount = 0;
    return [self loadProgramsWithBlock:block];
}


- (NSMutableArray*)programs{
    return [_programCache objectForKey:PROGRAM_KEY];
}

@end
