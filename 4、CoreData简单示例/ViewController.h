//
//  ViewController.h
//  4、CoreData简单示例
//
//  Created by niit on 15/5/25.
//  Copyright (c) 2015年 niit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textfiled1;
@property (weak, nonatomic) IBOutlet UITextField *textfield2;
@property (weak, nonatomic) IBOutlet UITextField *textfiled3;

- (IBAction)save:(id)sender;
- (IBAction)read:(id)sender;
- (IBAction)deleteMe:(id)sender;
- (IBAction)modify:(id)sender;



@end

