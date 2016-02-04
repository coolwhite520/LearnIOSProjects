//
//  ViewController.m
//  Telephone_SMS_EMAIL
//
//  Created by 白洋 on 16/2/4.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
@property (weak, nonatomic) IBOutlet UITextField *smsText;
@property (weak, nonatomic) IBOutlet UITextField *smsTextBody;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *emailTextbody;

@end

@implementation ViewController

#pragma mark - "短信消息delegate"
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
//    MessageComposeResultCancelled,
//    MessageComposeResultSent,
//    MessageComposeResultFailed
    
    switch (result) {
        case MessageComposeResultCancelled:
            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"Message MessageComposeResultCancelled.....");
            break;
        case MessageComposeResultSent:
            NSLog(@"Message MessageComposeResultSent.....");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Message MessageComposeResultFailed.....");
            break;
        default:
            break;
    }
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0){
    
//    MFMailComposeResultCancelled,
//    MFMailComposeResultSaved,
//    MFMailComposeResultSent,
//    MFMailComposeResultFailed
    
    
    switch (result) {
        case MFMailComposeResultCancelled:
            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"Message MFMailComposeResultCancelled.....");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Message MFMailComposeResultSaved.....");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Message MFMailComposeResultSent.....");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Message MFMailComposeResultFailed.....");
            break;
        default:
            break;
    }
    
}

- (IBAction)clickPhone:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",_phoneText.text]]];
}
- (IBAction)clickSMS:(id)sender {
    
    
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController * smsController = [[MFMessageComposeViewController alloc]init];
        smsController.messageComposeDelegate = self;
        smsController.recipients = [NSArray arrayWithObjects:_smsText.text, nil];
        smsController.body = _smsTextBody.text;
        [self presentViewController:smsController animated:YES completion:nil];
    }
    
}
- (IBAction)clickEmail:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController * mailController = [[ MFMailComposeViewController alloc]init];
        mailController.mailComposeDelegate = self;
        [mailController setToRecipients:@[@"81929154@qq.com"]];
        [mailController setMessageBody:@"你知道我是谁吗？" isHTML:NO];
        [mailController setTitle:@"hahaha?"];
        [self presentViewController:mailController animated:YES completion:nil];
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
