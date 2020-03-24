//
//  GTTEntryDetailViewController.m
//  Journal-C
//
//  Created by Chris Gottfredson on 3/23/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import "GTTEntryDetailViewController.h"
#import "GTTEntryController.h"
#import "GTTEntry.h"

@interface GTTEntryDetailViewController ()

@end

@implementation GTTEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_entry)
    {
        [self updateWith:_entry];
    }
    _bodyTextView.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    self.title = _titleLabel.text;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [_bodyTextView resignFirstResponder];
    return YES;
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender
{
    if ([_titleLabel.text  isEqual: @""] && [_bodyTextView.text  isEqual: @""])
    {
        return;
    } else if (_entry)
    {
        _entry.title = _titleLabel.text;
        _entry.bodyText = _bodyTextView.text;
    } else
    {
    [GTTEntryController.shared addEntry:_titleLabel.text bodyText:_bodyTextView.text];
    }
    [[self navigationController]popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(UIButton *)sender
{
    _titleLabel.text = @"";
    _bodyTextView.text = @"";
}

- (void)updateWith:(GTTEntry *)entry
{
    _titleLabel.text = entry.title;
    _bodyTextView.text = entry.bodyText;
    self.title = _titleLabel.text;
}

@end
