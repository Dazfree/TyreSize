//
//  MonthShowerMasterViewController.m
//  MonthSShower
//
//  Created by Nazar Demchuk on 3/23/13.
//  Copyright (c) 2013 Nazar Demchuk. All rights reserved.
//

#import "MonthShowerMasterViewController.h"
#import "MonthShowerDetailViewController.h"

@interface MonthShowerMasterViewController () {
    //NSMutableArray *_objects;
}



@end

@implementation MonthShowerMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
     
}

- (void)dealloc
{
   // [_objects release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    
//    NSArray *myArray = [[NSArray alloc] initWithObjects:@"", @"Январь", @"Февраль", @"Март", @"Апрель", @"Май", @"Июнь", @"Июль", @"Август", @"Сентябрь", @"Октябрь", @"Ноябрь",@"Декабрь", nil];
//
//    
//    
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"M"];
//        
//        NSString *currentMonth = [[NSString alloc]init];
//        currentMonth = [dateFormatter stringFromDate:[NSDate date]];
//        NSInteger a = [currentMonth integerValue];
    
  
    
//    
//    NSLog(@"The current Month is %@", [myArray objectAtIndex: a]);
//    //NSLog(@"%d", [myArray count]);
//    
//    int x = 1;
//    NSInteger myMonth = a + 1;
//    
//    //NSLog(@"%@", myMonth);
//    
//    
//    while (x < [myArray count])
//    {
//        if ((myMonth) == 13)
//        {
//            myMonth = 1;
//        }
//        
//        NSLog(@"The next Month will be %@", [myArray objectAtIndex: myMonth]);
//        myMonth++;
//        x++;
//    }
    
    
    
    
//    [MonthShowerMasterViewController:MonthShowerMasterViewController animated:YES];

    
}
    


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)insertNewObject:(id)sender
//{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}







- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}












- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

  //  NSDate *object = _objects[indexPath.row];
  //  cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray *myArray = [[NSArray alloc] initWithObjects:@"", @"Январь", @"Февраль", @"Март", @"Апрель", @"Май", @"Июнь", @"Июль", @"Август", @"Сентябрь", @"Октябрь", @"Ноябрь",@"Декабрь", nil];
    
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"M"];
    
    NSString *currentMonth = [[NSString alloc]init];
    currentMonth = [dateFormatter stringFromDate:[NSDate date]];
    NSInteger a = [currentMonth integerValue];
    
    NSLog(@"The current Month is %@", [myArray objectAtIndex: a]);    
    
    
    if (a == 1, 2, 12)
    {
        if (section == 0)
            return @"Winter"; 
    }
    else if (a == 3, 4, 5)
    {
        if (section == 0)
            return @"Spring";
    }
    else if (a == 6, 7, 8)
    {
        if (section == 0)
            return @"Summer";
    }
    else if (a == 9, 10, 11)
    {
        if (section == 0)
            return @"Autumn";
    }
    
    
    
        
//    if(section == 0)
//        return @"Summer";
//    else if (section == 1)
//        return @"Autumn";
//    else if (section == 2)
//        return @"Winter";
//    else
//        return @"Spring";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
     //   NSDate *object = _objects[indexPath.row];
    //    [[segue destinationViewController] setDetailItem:object];
    }
}

@end
