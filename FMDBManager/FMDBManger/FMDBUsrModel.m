//
//  FMDBUsrModel.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-26.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "FMDBUsrModel.h"
//.h souce

#import "FMDBPersistentHelper.h"

@implementation FMDBUsrModel

- (id)init
{
    if (self=[super init]) {
        
    }
    return self;
}



-(void)operation
{
    NSString *path =[SandboxFile GetDocumentPath];
    
    FMDBPathUtility *utility =[[FMDBPathUtility alloc]init];
    
    FMDatabase * db= [utility createDbWithpath:path];
    
    FMDBPersistentHelper *helper =[[FMDBPersistentHelper alloc]initWithDB:db];
    
    [helper executeSql:^(FMDatabase *retDb) {
       //sql .. here..
    }];
}






@end
