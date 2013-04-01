//
//  MonthShowerMasterViewController.h
//  MonthSShower
//
//  Created by Nazar Demchuk on 3/23/13.
//  Copyright (c) 2013 Nazar Demchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthShowerMasterViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray *monthArray;

@end
