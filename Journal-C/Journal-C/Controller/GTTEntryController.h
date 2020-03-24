//
//  GTTEntryController.h
//  Journal-C
//
//  Created by Chris Gottfredson on 3/23/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTTEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTTEntryController : NSObject

//MARK: Shared Instance and Source of Truth

+ (GTTEntryController *)shared;
@property (nonatomic, strong)NSMutableArray *entries;

// MARK: Helper Functions

- (void)addEntry:(NSString *)title bodyText:(NSString *)bodyText;
- (void)removeEntry:(GTTEntry *)entry;

//MARK: Persistence

- (void)saveToPersistentStorage;
- (void)loadFromPersistentStorage;



@end

NS_ASSUME_NONNULL_END
