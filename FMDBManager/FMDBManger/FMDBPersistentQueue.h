//
//  FMDBPersistentQueue.h
//  MenueModel
//
//  Created by yinjiwang on 14-1-26.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"

//FMDBBlock

typedef void (^FMDBCallback)(FMDatabase *retDb);


@interface FMDBPersistentQueue : FMDatabaseQueue



+ (instancetype) databaseQueueWithDB:(FMDatabase*) db;

//over ridden
- (void)inDatabase:(FMDBCallback)callback;
@end
