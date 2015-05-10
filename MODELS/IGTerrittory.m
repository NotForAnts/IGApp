//
//  IGTerrittory.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGTerrittory.h"

@implementation IGTerrittory

@synthesize  requireFieldDataTypes;


// CONSTRUCTOR / DECONSTRUCT
-(id)   init
{
if(self=[super init])
    {
    locationName=[[NSMutableString alloc]init];
    requireFieldDataTypes=[[NSMutableArray alloc]init];

    }
return self;
}


-(void) dealloc
{
[locationName           release];
[requireFieldDataTypes  release];
[super dealloc];
}


-(void)         addRequiredDataType:(NSString*)name
{
[requireFieldDataTypes  addObject:name];
}


-(void)     setLocationName:(NSString*)name
{
[locationName setString:name];
}

-(NSString*)    locationName
{
return (NSString*)locationName;
}



@end
