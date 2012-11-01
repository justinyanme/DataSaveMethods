//
//  WSPlistViewController.m
//  DataSaveMethods
//
//  Created by Justin Yim on 10/24/12.
//  Copyright (c) 2012 WhisperStudio. All rights reserved.
//

#import "WSPlistViewController.h"

@interface WSPlistViewController ()

@end

@implementation WSPlistViewController

#pragma mark - Life circle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       _path = [[NSTemporaryDirectory() stringByAppendingString:@"save.plist"] retain];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self initView];
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textField release];
    _textField = nil;
    
    [_path release];
    _path = nil;
    
    [super dealloc];
}

#pragma mark - Init

- (void)initView {
    // Init View
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 44)];
    _textField.placeholder = @"No data saved yet.";
    _textField.center = CGPointMake(self.view.center.x, _textField.center.y);
    _textField.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:_textField];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveData)] autorelease];
}

- (void)initData {
    // Init Data
    [self loadData];
}

#pragma mark - Data

- (void)saveData {
    NSFileManager * aFileManager = [NSFileManager defaultManager];
    if (![aFileManager fileExistsAtPath:_path]){
        // 文件不存在，创建之
        NSMutableDictionary * aDefaultDict = [[NSMutableDictionary alloc] init];
        [aDefaultDict setObject:@"test" forKey:@"TestText"];
        
        if (![aDefaultDict writeToFile:_path atomically:YES]) {
            NSLog(@"OMG!!!");
        }
        
        [aDefaultDict release];
    }

    // 写入数据
    NSMutableDictionary * aDataDict = [NSMutableDictionary dictionaryWithContentsOfFile:_path];
    [aDataDict setObject:_textField.text forKey:@"TestText"];
    if (![aDataDict writeToFile:_path atomically:YES]) {
        NSLog(@"OMG!!!");
    }
}

- (void)loadData {
    NSMutableDictionary * aDataDict = [NSMutableDictionary dictionaryWithContentsOfFile:_path];
    NSString * aStr = [aDataDict objectForKey:@"TestText"];
    if (aStr != nil && aStr.length > 0) {
        _textField.text = aStr;
    }
}

@end
