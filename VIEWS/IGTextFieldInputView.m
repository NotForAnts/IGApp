//
//  IGTextFieldInputView.m
//  IGApp
//
//  Created by Paul Webb on 10/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGTextFieldInputView.h"

@implementation IGTextFieldInputView


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
infoLabel=[[UITextView alloc]initWithFrame:[self infoFieldRect]];
infoLabel.backgroundColor=[UIColor clearColor];
infoLabel.textColor = [UIColor blackColor];
infoLabel.font=[UIFont fontWithName:@"HelveticaNeue" size:14.0];
infoLabel.inputAccessoryView=[self createInputAccessoryView];
infoLabel.backgroundColor=[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
infoLabel.delegate=self;

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

#pragma mark - IS DATA OKAY
-(BOOL)        dataInputIsValid
{
return ([infoLabel.text length]>0);
}

-(NSString*)        textValue
{
return infoLabel.text;
}


-(void)     closeInputAction:(id)sender
{
[infoLabel resignFirstResponder];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
if([delegate respondsToSelector:@selector(didBeginEditing:)])
[delegate didBeginEditing:self];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
if([delegate respondsToSelector:@selector(didEndEditing:)])
[delegate didEndEditing:self];
}


@end
