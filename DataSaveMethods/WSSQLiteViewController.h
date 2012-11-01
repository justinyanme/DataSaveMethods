//
//  WSSQLiteViewController.h
//  DataSaveMethods
//
//  Created by Justin Yim on 10/29/12.
//  Copyright (c) 2012 WhisperStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface WSSQLiteViewController : UIViewController {
    UITextField * _textField;
    sqlite3 * _db;
}

@end
