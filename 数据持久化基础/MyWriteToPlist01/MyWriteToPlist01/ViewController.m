//
//  ViewController.m
//  MyWriteToPlist01
//
//  Created by 白洋 on 16/2/1.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *lineFields;

@end

@implementation ViewController

- (NSString*)dataFilePath{
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docDir = [paths objectAtIndex:0];
    NSString * strPath =  [docDir stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"dataPath = %@",strPath);
    return strPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * strDataPath = [self dataFilePath];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:strDataPath]) {
        
        NSArray * array = [[NSArray alloc]initWithContentsOfFile:strDataPath];
        for (int i=0;i<4;i++) {
            UITextField * theField = self.lineFields[i];
            theField.text = array[i];
        }
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)applicationWillResignActive:(NSNotification*)notification{
    
    NSString * path = [self dataFilePath];
    NSArray * array = [self.lineFields valueForKey:@"text"];
    NSLog(@"%@",array);
    [array writeToFile:path atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
