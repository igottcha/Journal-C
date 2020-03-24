//
//  GTTEntry.m
//  Journal-C
//
//  Created by Chris Gottfredson on 3/23/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import "GTTEntry.h"

@implementation GTTEntry

static NSString * const TitleKey = @"title";
static NSString * const BodyTextKey = @"bodyText";
//static NSString * const TimeStampKey = @"timestamp";

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

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
        NSString *title = dictionary[TitleKey];
        NSString *bodyText = dictionary[BodyTextKey];
//        NSDate *timeStamp = dictionary[TimeStampKey];
    return [self initWithTitle:title bodyText:bodyText];
}

- (NSDictionary *)dictionaryCopy
{
    return @{TitleKey: self.title,
             BodyTextKey: self.bodyText};
}

@end
