//
//  IGTraderPastInfo.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGTraderPastInfo.h"

@implementation IGTraderPastInfo



@synthesize pastInfo;



-(id)   init
{
if(self=[super init])
    {
    pastInfo=[[NSMutableString alloc]init];
    
    }
return self;
}

-(void)     dealloc
{
[pastInfo release];
[super dealloc];
}


@end
