//
//  IGTerrittoriesManager.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGTerrittoriesManager.h"

@implementation IGTerrittoriesManager


// CONSTRUCTOR / DECONSTRUCT
-(id)   init
{
if(self=[super init])
    {
    territoryCollection=[[NSMutableArray alloc]init];
    
    }
return self;
}


-(void) dealloc
{
[territoryCollection release];
[super dealloc];
}


-(IGTerrittory*)    defaultTerritory
{
return [self territoryAtIndex:0];
}


-(void)             addNewTerritory:(IGTerrittory*)territory
{
[territoryCollection addObject:territory];
}

-(NSInteger)        numberTerrittories
{
return [territoryCollection count];
}

-(NSString*)        territoryNameAtIndex:(NSInteger)index
{
IGTerrittory        *territory=[self territoryAtIndex:index];


return territory==nil ? @"" : [territory locationName];;
}



-(IGTerrittory*)    territoryAtIndex:(NSInteger)index
{
if(index>=0 && index<[self numberTerrittories])
    {
    return [territoryCollection objectAtIndex:index];
    }
    
return nil;
}


@end
