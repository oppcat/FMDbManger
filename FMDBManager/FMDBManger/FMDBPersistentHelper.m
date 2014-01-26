//
//  FMDBPersistentHelper.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-26.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "FMDBPersistentHelper.h"
/*
 */

@interface  FMDBPersistentHelper()
{
    FMDBPersistentQueue *_queue;
    
    FMDatabase          *_db;
    
}


//bind DB to Fmqueue..
- (void)bindDBToFmqueue:(FMDBCallback)callback;

@end

@implementation FMDBPersistentHelper


- (instancetype)initWithDB:(FMDatabase*)db
{
    if (self = [super init]) {
        
        _db=db;
        _queue =[FMDBPersistentQueue databaseQueueWithDB:db];
        
    }
    return self;
}


- (void)executeSql:(FMDBCallback)callback
{
    [_queue inDatabase:^(FMDatabase *retDb) {
        callback(retDb);
    }];
}

- (void)close
{
    [_queue close];
    _queue = nil;
}


////block
//- (void)executeUpdate:(NSString*)sql
//{
//    BOOL flag;
//    assert(_db!=nil);
//    flag = [_db executeUpdate:sql];
//    DebugAssert(flag, @"sql occour error!");
//}
@end
