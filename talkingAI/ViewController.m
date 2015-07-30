//
//  ViewController.m
//  talkingAI
//
//  Created by zerd on 15/7/29.
//  Copyright (c) 2015年 zerd. All rights reserved.
//

#import "ViewController.h"

const NSString *TULING_APP_KEY = @"13d1fc5b2a496c5260cdafd8514823a5";

@interface ViewController () <NSURLConnectionDataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSString *infoString = @"今天北京天气怎么样？";//测试
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)infoString, NULL, NULL,  kCFStringEncodingUTF8 ));
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.tuling123.com/openapi/api?key=%@&info=%@",TULING_APP_KEY,encodedString]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *resultJsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"data:%@",resultJsonString);
}

@end
