//
//  Note.h
//  noteBook
//
//  Created by 王长旭 on 15/8/30.
//  Copyright (c) 2015年 王长旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * name;

@end
