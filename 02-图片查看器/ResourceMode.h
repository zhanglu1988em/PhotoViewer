//
//  ResourceMode.h
//  02-图片查看器
//
//  Created by zhanglu1988em on 16/1/2.
//  Copyright © 2016年 wbder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResourceMode : NSObject
@property (nonatomic,copy) NSString* imagename;
@property (nonatomic,copy) NSString* desc;


-(instancetype) initWithDict: (NSDictionary*) dict;
+(instancetype) ResourceWithDict:(NSDictionary*) dict;
+(NSArray*) Resources;




@end
