//
//  FMDBPersistentHelper.h
//  MenueModel
//
//  Created by yinjiwang on 14-1-26.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDBPersistentQueue.h"

#import "FMDBPathUtility.h"
#import "SandboxFile.h"


#ifdef DEBUG
#define DebugAssert(cnd, prompt)  NSAssert((cnd), (prompt))
#else
#define DebugAssert(cnd, prompt)
#endif


//use? db is ok!
//auto -> FMDB->queue
@interface FMDBPersistentHelper : NSObject


#pragma mark - Constructor

- (instancetype)initWithDB:(FMDatabase*)db;

#pragma mark - Close

- (void)close;

//executeSql..
/*
    1.sql.
    2.sql..
      .
      .
      .
    n.sql......
 */

- (void)executeSql:(FMDBCallback)callback;
////after executeSql ..Block ..do 哨兵函数重写惆怅啊。。 暂时用FMDB的吧
//- (void)executeUpdate:(NSString*)sql;
@end
