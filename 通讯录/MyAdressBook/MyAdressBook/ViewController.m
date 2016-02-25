//
//  ViewController.m
//  MyAdressBook
//
//  Created by 白洋 on 16/2/23.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

/*
 
 kABAuthorizationStatusNotDetermined = 0,    // deprecated, use CNAuthorizationStatusNotDetermined
 kABAuthorizationStatusRestricted,           // deprecated, use CNAuthorizationStatusRestricted
 kABAuthorizationStatusDenied,               // deprecated, use CNAuthorizationStatusDenied
 kABAuthorizationStatusAuthorized
 */
- (IBAction)accessAdressBook:(UIButton *)sender {
    
    ABAddressBookRef abRef = ABAddressBookCreateWithOptions(nil, nil);
    ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
    
    switch (status) {
        case kABAuthorizationStatusNotDetermined:
        {
            ABAddressBookRequestAccessWithCompletion(abRef, ^(bool granted, CFErrorRef error) {
                if (granted) {
                    NSLog(@"Authorized...");
                    [self queryContacts:abRef];
                }else{
                    NSLog(@"Denied...");
                }
            });
        }
            break;
        case kABAuthorizationStatusRestricted:
            NSLog(@"Restricted....");
            break;
        case kABAuthorizationStatusDenied:
            NSLog(@"Denied...");
            break;
        case kABAuthorizationStatusAuthorized:
            NSLog(@"Authorized...");
            [self queryContacts:abRef];
            break;
        default:
            break;
    }
}
- (void)queryContacts:(ABAddressBookRef)ref{
    
    NSArray * personsInfo = (__bridge NSArray *)(ABAddressBookCopyArrayOfAllPeople(ref));
    
    for (int i=0; i<personsInfo.count; i++) {
        
        ABRecordRef record = (__bridge ABRecordRef)([personsInfo objectAtIndex:i]);
        NSString * name = (__bridge NSString*)ABRecordCopyValue(record, kABPersonLastNameProperty);
        NSLog(@"%@",name);
        
        ABMultiValueRef multiValueRef = ABRecordCopyValue(record, kABPersonPhoneProperty);
        
        for (int i=0; i<ABMultiValueGetCount(multiValueRef); i++) {
            //不知道？？？
            NSString * phoneLabel = (__bridge NSString *)(ABMultiValueCopyValueAtIndex(multiValueRef, i));
            NSString * phoneNumber = (__bridge NSString *)(ABMultiValueCopyValueAtIndex(multiValueRef, i));
            NSLog(@"label=%@ number=%@",phoneLabel,phoneNumber);
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
