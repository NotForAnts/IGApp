//
//  IGBasicInputDataView.m
//  IGApp
//
//  Created by Paul Webb on 10/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGBasicInputDataView.h"

@implementation IGBasicInputDataView



-(void)     makeTopDescription
{
descriptionLabel=[[UILabel alloc] initWithFrame:[self descriptionRect]];
descriptionLabel.backgroundColor=[UIColor clearColor];
descriptionLabel.textColor = [UIColor blackColor];
descriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:10.0];
[self addSubview:descriptionLabel];
[descriptionLabel release];
}

-(CGRect)      descriptionRect
{
float   wide=self.frame.size.width;
return CGRectMake(0,0,wide,12);
}


-(void)        setDescription:(NSString*)name
{
descriptionLabel.text=name;
}


-(BOOL)        dataInputIsValid
{
return NO;
}


#pragma mark - ACCESSORY VIEW + METHODS
-(UIToolbar*)   createInputAccessoryView
{
UIToolbar           *keyboardToolbar=[[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 44)];
keyboardToolbar.barStyle=UIBarStyleBlackTranslucent;

UIBarButtonItem     *flexSpace=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//UIBarButtonItem     *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(nextInputAction:)];
UIBarButtonItem     *doneButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeInputAction:)];

[keyboardToolbar setItems:[NSArray arrayWithObjects:flexSpace, doneButton, nil] animated:NO];
return keyboardToolbar;
}



-(void)     nextInputAction:(id)sender
{
}


-(void)     closeInputAction:(id)sender
{
}




@end
