//
//  ViewController.m
//  rich_html
//
//  Created by HJaycee on 2018/7/17.
//  Copyright © 2018年 HJaycee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    NSString *html = @"<style>*{margin:0;padding:0;}</style>";
    
    // <p> wrong
//     html = [html stringByAppendingString:@"<p style=\"background-color:red;\">p element</p>"];
    
    // <div> wrong
//     html = [html stringByAppendingString:@"<div style=\"background-color:red;\">div element</div>"];
    
    // <span> right
     html = [html stringByAppendingString:@"<span style=\"background-color:red;\">span element</span>"];
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithData:[html dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    label.attributedText = str;
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:NULL];
    rect.origin.y = 200;
    rect.origin.x = 50;
    
    label.frame = rect;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
