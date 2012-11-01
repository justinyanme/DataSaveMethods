//
//  WSPlistViewController.m
//  DataSaveMethods
//
//  Created by Justin Yim on 10/24/12.
//  Copyright (c) 2012 WhisperStudio. All rights reserved.
//

#import "WSRawFileAPIsViewController.h"

@interface WSRawFileAPIsViewController ()

@end

@implementation WSRawFileAPIsViewController

#pragma mark - Life circle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _path = [[NSTemporaryDirectory() stringByAppendingString:@"saveAsC.txt"] retain];
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
    // File path
    const char * pFilePath = [_path cStringUsingEncoding:NSUTF8StringEncoding];
    
    // Create a new file
    FILE * pFile = fopen(pFilePath, "w+");
    
    if (pFile == NULL) {
        NSLog(@"Open File ERROR!");
        return;
    }

    const char * content = [_textField.text cStringUsingEncoding:NSUTF8StringEncoding];
    fwrite(content, sizeof(content), 1, pFile);
    fclose(pFile);
}

- (void)loadData {
    // File path
    const char * pFilePath = [_path cStringUsingEncoding:NSUTF8StringEncoding];
    
    // Create a new file
    FILE * pFile = fopen(pFilePath, "r+");
    
    if (pFile == NULL) {
        NSLog(@"Open File ERROR!");
        return;
    }

    int fileSize = ftell(pFile);
    NSLog(@"fileSize: %d", fileSize);
    
    char * content[20];

    fread(content, 20, 20, pFile);
    
    NSString * aStr = [NSString stringWithFormat:@"%s", &content];
    
    if (aStr != nil && ![aStr isEqualToString:@""]) {
        _textField.text = aStr;
    }
    
    fclose(pFile);
}

@end
