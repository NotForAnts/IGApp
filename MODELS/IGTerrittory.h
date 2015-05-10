//
//  IGTerrittory.h
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface IGTerrittory : NSObject
{
NSMutableString     *locationName;
NSMutableArray      *requireFieldDataTypes;

}

@property   (readonly)      NSMutableArray      *requireFieldDataTypes;



-(void)         addRequiredDataType:(NSString*)name;
-(void)         setLocationName:(NSString*)name;
-(NSString*)    locationName;



@end
