//
//  GTTEntry.h
//  Journal-C
//
//  Created by Chris Gottfredson on 3/23/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTTEntry : NSObject

- (instancetype)initWithTitle: (NSString *)title bodyText: (NSString *)bodyText;
- (instancetype)initWithDictionary: (NSDictionary *)dictionary;
- (NSDictionary *)dictionaryCopy;

@property (nonatomic) NSDate *timestamp;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *bodyText;

@end

NS_ASSUME_NONNULL_END
