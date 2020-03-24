//
//  GTTEntryController.m
//  Journal-C
//
//  Created by Chris Gottfredson on 3/23/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import "GTTEntryController.h"
#import "GTTEntry.h"

static NSString * const EntriesKey = @"entries";

@implementation GTTEntryController

//MARK: Shared Instance

+ (GTTEntryController *) shared {
    static GTTEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [GTTEntryController new];
        [shared loadFromPersistentStorage];
    });
    return shared;
}

//MARK: Initializer

- (instancetype)init
{
    
    self = [super init];
    if (self) {
        _entries = [[NSMutableArray alloc] init];
    }
    return self;
}

//MARK: Helper Functions

- (void)addEntry:(NSString *)title bodyText:(NSString *)bodyText
{
    GTTEntry *entry = [[GTTEntry alloc]initWithTitle:title bodyText:bodyText];
    [_entries addObject:entry];
    [self saveToPersistentStorage];
}

- (void) removeEntry:(GTTEntry *)entry
{
    [_entries removeObject:entry];
    [self saveToPersistentStorage];
}

// MARK: Persistence

- (void) saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (GTTEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryCopy];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void) loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        GTTEntry *entry = [[GTTEntry alloc] initWithDictionary:dictionary];
        [self addEntry:entry.title bodyText:entry.bodyText];
    }
}

@end
