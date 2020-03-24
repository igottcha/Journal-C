//
//  GTTEntryListTableViewController.m
//  Journal-C
//
//  Created by Chris Gottfredson on 3/23/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import "GTTEntryListTableViewController.h"

@interface GTTEntryListTableViewController ()

@end

@implementation GTTEntryListTableViewController

//MARK: OUtlets
- (IBAction)newEntryBubttonTapped:(UIBarButtonItem *)sender {
}

//MARK: Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:true];
    [[self tableView]reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return GTTEntryController.shared.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    GTTEntry *entry = GTTEntryController.shared.entries[indexPath.row];
    cell.textLabel.text = entry.title;
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    GTTEntry *entry = GTTEntryController.shared.entries[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [GTTEntryController.shared removeEntry: entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"toViewEntry"])
    {
        GTTEntryDetailViewController *destination = [segue destinationViewController];
        NSInteger indexpath = [[[self tableView]indexPathForSelectedRow]row];
        destination.entry = GTTEntryController.shared.entries[indexpath];
    }
}

@end
