//
//  FMDBPersistentQueue.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-26.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "FMDBPersistentQueue.h"

@implementation FMDBPersistentQueue


+ (instancetype) databaseQueueWithDB:(FMDatabase*) db
{
    return [[self alloc] initWithDB:db];
}


- (instancetype) initWithDB:(FMDatabase*) db
{
    if(self = [super init])
    {
        _db = db;
        _queue = dispatch_queue_create([[NSString stringWithFormat:@"fmdb.%@", self] UTF8String], NULL);
    }
    
    return self;
}


- (void)inDatabase:(FMDBCallback)callback
{
    FMDBRetain(self);
    dispatch_queue_t currentQueue = dispatch_get_current_queue();
    FMDatabase *retDB =[self database];
    assert(retDB!=nil);
    if (currentQueue == _queue) {
        callback(retDB);
    }
    else
    {
        //main sys..
        dispatch_sync(_queue, ^{
             callback(retDB);
            //judge hander count
            if ([retDB hasOpenResultSets]) {
                 NSLog(@"Warning: there is at least one open result set around after performing [FMDatabaseQueue inDatabase:]");
            }
        });
    }
    FMDBRelease(self);
}

//log!
- (FMDatabase*)database {
    if (!_db) {
    }
    _db.logsErrors = YES; //ENABLE DEBUG LOG
    return _db;
}
@end
