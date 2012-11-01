//
//  WSUDViewController.m
//  DataSaveMethods
//
//  Created by Justin Yim on 10/24/12.
//  Copyright (c) 2012 WhisperStudio. All rights reserved.
//

#import "WSUDViewController.h"

@interface WSUDViewController ()

@end

@implementation WSUDViewController

#pragma mark - Life circle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    if (_textField.text == nil || _textField.text.length == 0) {
        UIAlertView * aAlertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"No Text!" delegate:nil cancelButtonTitle:@"I see" otherButtonTitles:nil, nil];
        [aAlertView show];
        [aAlertView release];
        return;
    }
    NSUserDefaults * aUserDefaults = [NSUserDefaults standardUserDefaults];
    [aUserDefaults setObject:_textField.text forKey:@"Text"];
    
    // 这里是为了把设置及时写入文件，防止由于崩溃等情况App内存信息丢失
    [aUserDefaults synchronize];
}

- (void)loadData {
    NSUserDefaults * aUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString * aStr = [aUserDefaults objectForKey:@"Text"];
    if (aStr != nil && aStr.length > 0) {
        _textField.text = aStr;
    }
}

@end
