//
//  ViewController.m
//  baselineoffset
//
//  Created by HJaycee on 2018/11/5.
//  Copyright © 2018 HJaycee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableAttributedString *attrString = ({
        // 文字
        NSAttributedString *leftString = [[NSAttributedString alloc] initWithString:@"好" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10]}];
        
        // 图片
        NSAttributedString *attachString = ({
            UIImage *image = [UIImage imageNamed:@"项目标签"];
            NSTextAttachment *attach = [NSTextAttachment new];
            attach.image = image;
            
            [NSAttributedString attributedStringWithAttachment:attach];
        });
        
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithAttributedString:leftString];
        [attrString appendAttributedString:attachString];
        
        // 设置行高
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        style.maximumLineHeight = 22.5;
        style.minimumLineHeight = 22.5;
        
        [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attrString.length)];
        
        // 设置baseline=0
        [attrString addAttribute:NSBaselineOffsetAttributeName value:@0 range:NSMakeRange(0, attrString.length)];
        
        attrString;
    });
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    label.attributedText = attrString;
    [label sizeToFit];
}


@end
