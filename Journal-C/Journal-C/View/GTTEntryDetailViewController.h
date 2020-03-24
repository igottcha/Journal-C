//
//  GTTEntryDetailViewController.h
//  Journal-C
//
//  Created by Chris Gottfredson on 3/23/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTTEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTTEntryDetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)clearButtonTapped:(UIButton *)sender;

@property (strong, nonatomic) GTTEntry *entry;

- (void) updateWith:(GTTEntry *)entry;

@end

NS_ASSUME_NONNULL_END
