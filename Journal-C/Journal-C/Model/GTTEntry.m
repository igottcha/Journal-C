//
//  GTTEntry.m
//  Journal-C
//
//  Created by Chris Gottfredson on 3/23/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import "GTTEntry.h"

@implementation GTTEntry

- (instancetype)initWithTitle: (NSString *)title bodyText: (NSString *)bodyText
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _bodyText = [bodyText copy];
        _timestamp = [NSDate new];
    }
    return self;
}

@end
