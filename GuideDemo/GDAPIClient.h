//
//  GDAPIClient.h
//  GuideDemo
//
//  Created by Mamnun Bhuiyan on 28/01/2014.
//  Copyright (c) 2014 Mamnun. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface GDAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;
- (NSURLSessionDataTask *)loadProgramsWithBlock:(void (^)(NSArray *programs, NSError *error))block;
- (NSURLSessionDataTask *)reloadProgramsWithBlock:(void (^)(NSArray *programs, NSError *error))block;

@property(nonatomic, strong) NSMutableArray *programs;
@end
