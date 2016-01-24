//
//  PersonTableViewCell.m
//  MyTableViewTest03-myCell
//
//  Created by 白洋 on 16/1/24.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "PersonTableViewCell.h"

@implementation PersonTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self PrepareView];
    }
    return self;
}

-(void)PrepareView{
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(170, 10, 150, 36)];
    self.sexLabel = [[UILabel alloc]initWithFrame:CGRectMake(170, 50, 100, 36)];
    self.ageLabel = [[UILabel alloc]initWithFrame:CGRectMake(280, 50, 50, 36)];
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 90, 80)];
    
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.ageLabel];
    [self.contentView addSubview:self.sexLabel];
    [self.contentView addSubview:self.imgView];
    self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    self.contentView.layer.borderWidth = 1;

}

@end
