//
//  WSMainViewController.m
//  DataSaveMethods
//
//  Created by Justin Yim on 10/23/12.
//  Copyright (c) 2012 WhisperStudio. All rights reserved.
//

#import "WSMainViewController.h"

@interface WSMainViewController ()

@end

@implementation WSMainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:style];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        self.title = @"WSData Sample";
        
        [self initData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {

}

- (void)initData {
    _dataAry = [[NSMutableArray alloc] initWithObjects:@"NSUserDefault", @"Plist File", @"Raw File APIs", @"NSCoding", @"SQLite", @"CoreData", nil];
}

- (void)dealloc {
    [_tableView release];
    _tableView = nil;
    
    [_dataAry release];
    _dataAry = nil;
    
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (_dataAry != nil && _dataAry.count > 0) {
        NSLog(@"_dataAry.count: %d", _dataAry.count);
        return _dataAry.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"WSUDCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [_dataAry objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            // NSUserDefaults
        {
            WSUDViewController * aUDController = [[WSUDViewController alloc] init];
            [self.navigationController pushViewController:aUDController animated:YES];
            [aUDController release];
        }
            break;
            
        case 1:
            // Plist File
        {
            WSPlistViewController * aPlistViewController = [[WSPlistViewController alloc] init];
            [self.navigationController pushViewController:aPlistViewController animated:YES];
            [aPlistViewController release];
        }
            break;
            
        case 2:
            // Raw File APIs
        {
            WSRawFileAPIsViewController * aRawViewController = [[WSRawFileAPIsViewController alloc] init];
            [self.navigationController pushViewController:aRawViewController animated:YES];
            [aRawViewController release];
        }
            break;
            
        case 3:
            // NSCoding
        {
            WSNSCodingViewController * aNSCodingViewController = [[WSNSCodingViewController alloc] init];
            [self.navigationController pushViewController:aNSCodingViewController animated:YES];
            [aNSCodingViewController release];
        }
            break;
            
        case 4:
            // SQLite
        {
            WSSQLiteViewController * aSQLiteViewController = [[WSSQLiteViewController alloc] init];
            [self.navigationController pushViewController:aSQLiteViewController animated:YES];
            [WSSQLiteViewController release];
        }
            break;
            
        default:
            break;
    }
}

@end
