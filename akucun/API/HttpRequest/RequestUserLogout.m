//
//  RequestUserLogout.m
//  akucun
//
//  Created by Jarry on 2017/7/15.
//  Copyright © 2017年 Sucang. All rights reserved.
//

#import "RequestUserLogout.h"

@implementation RequestUserLogout

- (NSString *) uriPath
{
    return API_URI_USER;
}

- (NSString *) actionId
{
    return ACTION_LOGOUT;
}

@end
