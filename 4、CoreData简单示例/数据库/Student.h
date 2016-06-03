//
//  Student.h
//  4、CoreData简单示例
//
//  Created by niit on 15/5/25.
//  Copyright (c) 2015年 niit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * studentId;
@property (nonatomic, retain) NSString * studentClass;
@property (nonatomic, retain) NSString * studentName;

@end
