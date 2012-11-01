//
//  WSMainViewController.h
//  DataSaveMethods
//
//  Created by Justin Yim on 10/23/12.
//  Copyright (c) 2012 WhisperStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSUDViewController.h"
#import "WSPlistViewController.h"
#import "WSRawFileAPIsViewController.h"
#import "WSNSCodingViewController.h"
#import "WSSQLiteViewController.h"

@interface WSMainViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray * _dataAry;
    UITableView * _tableView;
}

@end
