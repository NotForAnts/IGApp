//
//  IGTraderFinanceInfo.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGTraderFinanceInfo.h"

@implementation IGTraderFinanceInfo


@synthesize financeInfo;


-(id)   init
{
if(self=[super init])
    {
    financeInfo=[[NSMutableString alloc]init];
    
    }
return self;
}

-(void)     dealloc
{
[financeInfo release];
[super dealloc];
}


@end
