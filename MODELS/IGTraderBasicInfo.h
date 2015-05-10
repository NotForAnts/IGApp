//
//  IGTraderBasicInfo.h
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IGTraderBasicInfo : NSObject
{
NSMutableString         *userName;
NSMutableString         *userDateBirth;
}

@property   (readonly)      NSMutableString         *userName;
@property   (readonly)      NSMutableString         *userDateBirth;

@end
