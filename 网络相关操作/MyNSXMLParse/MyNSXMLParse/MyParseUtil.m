//
//  MyParseUtil.m
//  MyNSXMLParse
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "MyParseUtil.h"

@interface MyParseUtil ()
@property(nonatomic,strong) Customer * customer;
@property(nonatomic,copy) NSString * currentElement;
@end


@implementation MyParseUtil

- (instancetype)init{
    
    self = [super init];
    if (self) {
        _customersArray = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

- (void)parseXML:(NSString *)filepath{
    
    NSData * data = [[NSData alloc]initWithContentsOfFile:filepath];
    NSXMLParser * parse = [[NSXMLParser alloc]initWithData:data];
    parse.delegate = self;
    [parse parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    
    NSLog(@"parserDidStartDocument....");
}
// sent when the parser begins parsing of the document.
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    NSLog(@"parserDidEndDocument....");
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if ([_currentElement isEqualToString:@"name"]) {
        _customer.name = string;
    }
    else if([_currentElement isEqualToString:@"id"]){
        _customer.pid = [string integerValue];
    }
    else if([_currentElement isEqualToString:@"phone"]){
        _customer.phone = string;
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
    
    NSLog(@"start %@...",elementName);
    _currentElement = elementName;
    
    if ([_currentElement isEqualToString:@"customer"]) {
        self.customer = [[Customer alloc]init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{

    NSLog(@"end %@...",elementName);
    if ([elementName isEqualToString:@"customer"]) {
        [_customersArray addObject:_customer];
    }
    _currentElement = nil;
}
@end
