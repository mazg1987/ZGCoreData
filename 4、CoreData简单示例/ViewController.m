//
//  ViewController.m
//  4、CoreData简单示例
//
//  Created by niit on 15/5/25.
//  Copyright (c) 2015年 niit. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "NSManagedObject+helper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self queryAllStudent];//查询所有学生
}

//数据库保存操作
- (IBAction)save:(id)sender{
    Student *stu=[Student createNew];//新建一个学生
    stu.studentId=self.textfiled1.text;
    stu.studentName=self.textfield2.text;
    stu.studentClass=self.textfiled3.text;
    
    [Student save:^(NSError *error) {
        NSLog(@"保存成功");
    }];
    [self queryAllStudent];
}

//数据库查询操作
-(void)queryAllStudent{
    NSArray *fetchArr=[Student filter:nil orderby:nil offset:0 limit:0];
    for (Student *stu in fetchArr) {
        NSLog(@"%@-->%@-->%@",stu.studentId,stu.studentName,stu.studentClass);
    }
}

//查询一个学生
-(Student *)queryOneStudent{
    NSString *pre=[NSString stringWithFormat:@"studentId='%@'",self.textfiled1.text];
    NSArray *tmpArr=[Student filter:pre orderby:nil offset:0 limit:0];
    if (tmpArr.count>0) {
        return tmpArr[0];
    }
    return nil;
}


//读取一个学生
- (IBAction)read:(id)sender{
    Student *stu=[self queryOneStudent];
    self.textfiled1.text=stu.studentId;
    self.textfield2.text=stu.studentName;
    self.textfiled3.text=stu.studentClass;
}

//删除一个学生
- (IBAction)deleteMe:(id)sender{
    Student *stu=[self queryOneStudent];
    [Student delobject:stu];
    [Student save:^(NSError *error) {
        
    }];
}

//修改一个学生
- (IBAction)modify:(id)sender{
    Student *stu=[self queryOneStudent];
    stu.studentId=self.textfiled1.text;
    stu.studentName=self.textfield2.text;
    stu.studentClass=self.textfiled3.text;
    [Student save:^(NSError *error) {
        
    }];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
