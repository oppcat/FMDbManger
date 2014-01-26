//
//  FMDBPathUtility.h
//  MenueModel
//
//  Created by yinjiwang on 14-1-26.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//



#import <Foundation/Foundation.h>


#import "FMDatabase.h"

@interface FMDBPathUtility : NSObject

- (FMDatabase*)createDbWithpath:(NSString*)path;

@property (nonatomic, strong)NSString* dbPath;

@end
