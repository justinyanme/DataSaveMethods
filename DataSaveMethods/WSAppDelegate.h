//
//  WSAppDelegate.h
//  DataSaveMethods
//
//  Created by Justin Yim on 10/23/12.
//  Copyright (c) 2012 WhisperStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSMainViewController.h"

@interface WSAppDelegate : UIResponder <UIApplicationDelegate> {
    WSMainViewController * _mainController;
}

@property (strong, nonatomic) UIWindow *window;

@end
