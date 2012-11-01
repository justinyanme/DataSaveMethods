//
//  WSNSCodingViewController.m
//  DataSaveMethods
//
//  Created by Justin Yim on 10/26/12.
//  Copyright (c) 2012 WhisperStudio. All rights reserved.
//

#import "WSNSCodingViewController.h"

#define DATA_FILE @"NSCodingData.plist"
#define DATA_KEY  @"data"

@interface WSNSCodingViewController ()

@end

@implementation WSNSCodingViewController

#pragma mark - Life circle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _path = [[NSTemporaryDirectory() stringByAppendingString:DATA_FILE] retain];
        self.title = @"NSCoding";
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
    if (aData != nil) {
        [aData release];
        aData = nil;
    }
    if (_path != nil) {
        [_path release];
        _path = nil;
    }
    
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
    NSLog(@"init data");
    [self loadData];
}

#pragma mark - Data

- (void)saveData {
    if (aData == nil) {
        aData = [[WSNSCodingData alloc] init];
    }
    
    aData.data = _textField.text;
    
    NSLog(@"save data...%@", aData.data);
    NSMutableData   * data = [[NSMutableData alloc] init];
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:aData forKey:DATA_KEY];
    [archiver finishEncoding];
    [data writeToFile:_path atomically:YES];
    [archiver release];
    [data release];
    
    NSLog(@"save data: %@", aData.data);
}

- (void)loadData {    
    NSLog(@"load file: %@", _path);
    NSData * codedData = [[NSData alloc] initWithContentsOfFile:_path];
    if (codedData == nil) return;
    
    NSKeyedUnarchiver * unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
    aData = [[unarchiver decodeObjectForKey:DATA_KEY] retain];
    [unarchiver finishDecoding];
    [unarchiver release];
    
    [codedData release];
    
    if (aData.data != nil) {
        _textField.text = aData.data;
    }
}


@end
