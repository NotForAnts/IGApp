//
//  IGFieldInputView.m
//  IGApp
//
//  Created by Paul Webb on 10/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGFieldInputView.h"

@implementation IGFieldInputView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
if (self = [super initWithFrame:frame])
	{
    [self makeTopDescription];
    [self makeInputField];
    }
return self;
}


-(void)     dealloc
{
[super dealloc];
}


-(void)     makeInputField
{
infoLabel=[[UITextField alloc]initWithFrame:[self infoFieldRect]];
infoLabel.backgroundColor=[UIColor clearColor];
infoLabel.textColor = [UIColor blackColor];
infoLabel.font=[UIFont fontWithName:@"HelveticaNeue" size:14.0];
infoLabel.inputAccessoryView=[self createInputAccessoryView];
infoLabel.delegate=self;
infoLabel.backgroundColor=[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];


[self addSubview:infoLabel];
[infoLabel release];
}

-(CGRect)      infoFieldRect
{
float   wide=self.frame.size.width;
float   high=self.frame.size.height;
float   ypos=CGRectGetMaxY([self descriptionRect])+6;

return CGRectMake(0,ypos,wide,high-ypos);
}



-(BOOL)        dataInputIsValid
{
return ([infoLabel.text length]>0);
}

-(NSString*)        textValue
{
return infoLabel.text;
}


#pragma mark - ACCESSORY VIEW + METHODS


-(void)     closeInputAction:(id)sender
{
[infoLabel resignFirstResponder];
}




#pragma mark - Text Field Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
return YES;
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
if([delegate respondsToSelector:@selector(didBeginEditingWithField:)])
[delegate didBeginEditingWithField:self];
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
if([delegate respondsToSelector:@selector(didEndEditingWithField:)])
[delegate didEndEditingWithField:self];
}

- (void)textFieldDidChange:(UITextView *)textView
{
}


@end
