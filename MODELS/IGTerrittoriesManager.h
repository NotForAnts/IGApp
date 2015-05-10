//
//  IGTerrittoriesManager.h
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGTerrittory.h"


@interface IGTerrittoriesManager : NSObject
{
NSMutableArray      *territoryCollection;
}



-(void)             addNewTerritory:(IGTerrittory*)territory;
-(NSInteger)        numberTerrittories;
-(IGTerrittory*)    territoryAtIndex:(NSInteger)index;
-(NSString*)        territoryNameAtIndex:(NSInteger)index;
-(IGTerrittory*)    defaultTerritory;


@end
