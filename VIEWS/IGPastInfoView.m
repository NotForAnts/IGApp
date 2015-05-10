//
//  IGPastInfoView.m
//  IGApp
//
//  Created by Paul Webb on 10/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGPastInfoView.h"

@implementation IGPastInfoView



- (id)initWithFrame:(CGRect)frame
{
if (self = [super initWithFrame:frame])
	{
    descriptionLabel.text=@"Past Information";
    }
return self;
}



-(void)     dealloc
{
[super dealloc];
}



@end
