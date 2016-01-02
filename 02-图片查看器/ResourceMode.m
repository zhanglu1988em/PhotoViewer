//
//  ResourceMode.m
//  02-图片查看器
//
//  Created by zhanglu1988em on 16/1/2.
//  Copyright © 2016年 wbder. All rights reserved.
//

#import "ResourceMode.h"

@implementation ResourceMode




-(instancetype) initWithDict: (NSDictionary*) dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype) ResourceWithDict:(NSDictionary*) dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray*) Resources
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"resource" ofType:@"plist"];
    NSArray *arry = [[NSArray alloc] initWithContentsOfFile:path];
    NSMutableArray *arryM = [NSMutableArray array];
    for (NSDictionary *dict in arry) {
        [arryM addObject:[self ResourceWithDict:dict]];
    }
    return arryM;
}

@end
