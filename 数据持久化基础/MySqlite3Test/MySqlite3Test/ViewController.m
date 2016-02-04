//
//  ViewController.m
//  MySqlite3Test
//
//  Created by 白洋 on 16/2/3.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *fields;

@end

@implementation ViewController

- (NSString *)dataFilePath{
    
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docPath = [paths objectAtIndex:0];
    return [docPath stringByAppendingPathComponent:@"userinfo.sqlite"];
}

- (void)showUserInfo{
    
    sqlite3 * database ;
    const char * cPath = [[self dataFilePath] UTF8String];
    int ret = sqlite3_open(cPath, &database);
    if (ret != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database....");
    }
    NSString * createSQL = @"CREATE TABLE IF NOT EXISTS FIELDS"
                            "(ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT);";
    char * errmsg = NULL;
    if(sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &errmsg) != SQLITE_OK){
        sqlite3_close(database);
        NSAssert(0, @"erro creating table:%s",errmsg);
    }
    
    NSString * selectSQL = @"SELECT ROW , FIELD_DATA FROM FIELDS ORDER BY ROW";
    sqlite3_stmt * stms;
    if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &stms, NULL) == SQLITE_OK) {
        while (sqlite3_step(stms) == SQLITE_ROW) {
            int row = sqlite3_column_int(stms, 0);
            char * rowData = (char*)sqlite3_column_text(stms, 1);
            NSString * fieldvalue = [[NSString alloc]initWithUTF8String:rowData];
            UITextField * field = _fields[row];
            field.text = fieldvalue;
        }
        sqlite3_finalize(stms);
    }
    sqlite3_close(database);
    
}
- (IBAction)getInfo:(UIButton *)sender {
    
    
   }



- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self showUserInfo];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:[UIApplication sharedApplication]];

}

- (void)applicationWillResignActive:(NSNotification *) notification{
    
    sqlite3 * database;
    if (sqlite3_open([[self dataFilePath]UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"dabase open failed...");
    }
    
    for (int i=0; i<4; i++) {
        UITextField * textField = _fields[i];
        char * insert = "insert or replace into fields (row,field_data)"
                        "values(?,?);";
        char * erroMsg = NULL;
        sqlite3_stmt * stmt;
        if (sqlite3_prepare_v2(database, insert, -1, &stmt, NULL) == SQLITE_OK) {
            sqlite3_bind_int(stmt, 1, i);
            sqlite3_bind_text(stmt, 2, [textField.text UTF8String], -1, NULL);
        }
        if (sqlite3_step(stmt) != SQLITE_DONE) {
            NSAssert(0, @"error update table:%s",erroMsg);
        }
        sqlite3_finalize(stmt);
    }
    sqlite3_close(database);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
