//
//  RootViewController.m
//  TableView
//
//  Created by appledev094 on 3/25/16.
//  Copyright © 2016 PwC Inc. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (assign, nonatomic) BOOL isEdit;

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
     self.navigationItem.rightBarButtonItem = rightItem;
    
    _dataArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4",  @"5",  @"6",  @"7",  @"8",  @"9",  @"10",  @"11", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)edit {
    if (_isEdit) {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
        self.navigationItem.rightBarButtonItem = rightItem;
        [self.tableView setEditing:false animated:true];
        _isEdit = false;
    } else {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
        self.navigationItem.rightBarButtonItem = rightItem;
        [self.tableView setEditing:true animated:true];
        _isEdit = true;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
// if return yes,it realizes that the cell could be edited
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [_dataArray insertObject:@"新增" atIndex:indexPath.row + 1];
        NSIndexPath *insertPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:0];
        [tableView insertRowsAtIndexPaths:@[insertPath] withRowAnimation:UITableViewRowAnimationFade];
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
//    id object = [_dataArray objectAtIndex:fromIndexPath.row];
//    [_dataArray removeObjectAtIndex:fromIndexPath.row];
    [_dataArray exchangeObjectAtIndex:toIndexPath.row withObjectAtIndex:fromIndexPath.row];
//    [_dataArray insertObject:object atIndex:toIndexPath.row];
    
    NSLog(@"%@", _dataArray);
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
