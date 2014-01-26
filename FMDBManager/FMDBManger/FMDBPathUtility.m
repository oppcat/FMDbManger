//
//  FMDBPathUtility.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-26.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "FMDBPathUtility.h"

@implementation FMDBPathUtility
@synthesize dbPath=_dbPath;



- (FMDatabase*)createDbWithpath:(NSString*)path
{
    assert(path!=nil);
    
    FMDatabase* db = [FMDatabase databaseWithPath:path];
    
    return db;
}


@end
