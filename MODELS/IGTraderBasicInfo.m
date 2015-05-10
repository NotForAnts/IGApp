//
//  IGTraderBasicInfo.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGTraderBasicInfo.h"

@implementation IGTraderBasicInfo


@synthesize     userName;
@synthesize     userDateBirth;

-(id)   init
{
if(self=[super init])
    {
    userName=[[NSMutableString alloc]init];
    userDateBirth=[[NSMutableString alloc]init];
    
    }
return self;
}


-(void)     dealloc
{
[userName release];
[userDateBirth release];

[super dealloc];
}


@end
