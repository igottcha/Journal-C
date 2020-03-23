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

@property (nonatomic, copy, readonly) NSDate *timestamp;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *bodyText;

- (instancetype)initWithTitle: (NSString *)title bodyText: (NSString *)bodyText;

@end

NS_ASSUME_NONNULL_END
