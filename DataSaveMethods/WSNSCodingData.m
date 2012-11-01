//
//  WSNSCodingData.m
//  DataSaveMethods
//
//  Created by Justin Yim on 10/26/12.
//  Copyright (c) 2012 WhisperStudio. All rights reserved.
//

#import "WSNSCodingData.h"

#define kDATA_KEY @"dataKey"

@implementation WSNSCodingData

@synthesize data;

#pragma mark - Life Circle

- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
//        if (data == nil) {
//            data = [[NSString alloc] initWithString:@""];            
//        }
    }
    return self;
}

- (void)dealloc {
    [data release];
    data = nil;
    
    [super dealloc];
}

#pragma mark - Encode & Decode

- (void)encodeWithCoder:(NSCoder *)enoder {
    [enoder encodeObject:data forKey:kDATA_KEY];
}

- (id)initWithCoder:(NSCoder *)decoder {
    data = [[decoder decodeObjectForKey:kDATA_KEY] copy];
    return [self init];
}

@end
