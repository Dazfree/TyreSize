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
@synthesize monthArray;

- (void)awakeFromNib
{
    [super awakeFromNib];
     
}

- (void)dealloc
{
   // [_objects release];
    [monthArray release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    self.monthArray = [NSArray arrayWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
    [super viewDidLoad];
}

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

    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"] autorelease];
    }
   
    cell.tag = indexPath.row; // Important for identifying the cell easily later
    cell.textLabel.text = [self.monthArray objectAtIndex:indexPath.row];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


-(NSUInteger)seasonNumberFromMonthNumber:(NSUInteger)monthNumber
{
	if (12 == monthNumber)
	{
		return 0;
	}
	else
	{
		return (monthNumber / 3);
	}
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"M"];
    
//#error тут ты выделяешь память для currentMonth, а потом присваиваешь указателю другое значение. тут можно было сделать просто NSString *currentMonth = [dateFormatter stringFromDate:[NSDate date]]. до введения ARC это было бы мемори ликом
//    NSString *currentMonth = [[NSString alloc]init];
//    currentMonth = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString *currentMonth = [dateFormatter stringFromDate:[NSDate date]];
    NSInteger a = [currentMonth integerValue];
    
//#error пока здесь не было авторелиза это был лик
    NSArray *seasons = [[[NSArray alloc] initWithObjects: @"Winter", @"Spring", @"Summer", @"Autumn", nil] autorelease];
    
//#error в obj-c есть оператор ",", но он используется крайне редко, и делает совсем не то что ты хотел тут получить. в твоем случае нужно использовать логическое или "||", и тогда условие будет выглядеть так if (a == 1 || a == 2 || a == 12)
//#error причина креша состоит вот в чем: текущий месяц март, поэтому на этом шаге а == 3. твое условие вычисляет а == 1 и получает false (3 != 1). дальше оно берет и просто вычислет 2, что в C дает true, потом 12 тоже дает true. в итоге каким бы ни было а, программ все равно всегда заходит в первый if. дальше оно смотрит section == 0. делегатские вызовы не всегда работают последовательно. т.е. табличка может сначала попросить хеде для section == 3, потом для section == 1 и т.д. в общем порядок не определен. ошибка в том что ты везде проверяешь section == 0. и получается, например, параметром в метод приходит section == 3, оно заходит в этот if и сравнивает section и 0, конечено же выходит false, поэтому не срабатывает return @"Winter". так как больше ни в какие else if оно не заходит, то выходит что метод ничего не возвращает, и из-за этого креш
//   
    NSUInteger currentSeasonNumber = [self seasonNumberFromMonthNumber: a];
	return [seasons objectAtIndex:(section + currentSeasonNumber) & 3];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
     //   NSDate *object = _objects[indexPath.row];
    //    [[segue destinationViewController] setDetailItem:object];
   // }
}

@end
