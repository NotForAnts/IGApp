//
//  IGDateInputView.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGDateInputView.h"

@implementation IGDateInputView

@synthesize delegate;


- (id)initWithFrame:(CGRect)frame
{
if (self = [super initWithFrame:frame])
	{
    [self makeTopDescription];
    [self makeDOBField];

    descriptionLabel.text=@"Enter your DOB DD MM YYYY";
    }
return self;
}


-(void)     dealloc
{
[super dealloc];
}

-(void)     resignActive
{
[self checkYearField];
[self doValidHighlight];
}


-(void)     makeDOBField
{
dayField=[[UITextField alloc]initWithFrame:[self dobDayRect]];
dayField.textColor = [UIColor blackColor];
dayField.font=[UIFont fontWithName:@"HelveticaNeue" size:14.0];
dayField.placeholder=@"DD";
dayField.inputAccessoryView=[self createInputAccessoryView];
[dayField setKeyboardType:UIKeyboardTypeNumberPad];
dayField.backgroundColor=[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
dayField.delegate=self;
[self addSubview:dayField];
[dayField release];

monthField=[[UITextField alloc]initWithFrame:[self dobMonthRect]];
monthField.textColor = [UIColor blackColor];
monthField.font=[UIFont fontWithName:@"HelveticaNeue" size:14.0];
monthField.inputAccessoryView=[self createInputAccessoryView];
monthField.placeholder=@"MM";
[monthField setKeyboardType:UIKeyboardTypeNumberPad];
monthField.backgroundColor=[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
monthField.delegate=self;
[self addSubview:monthField];
[monthField release];

yearField=[[UITextField alloc]initWithFrame:[self dobYearRect]];
yearField.textColor = [UIColor blackColor];
yearField.font=[UIFont fontWithName:@"HelveticaNeue" size:14.0];
yearField.inputAccessoryView=[self createInputAccessoryView];
yearField.placeholder=@"YYYY";
[yearField setKeyboardType:UIKeyboardTypeNumberPad];
yearField.backgroundColor=[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
yearField.delegate=self;
[self addSubview:yearField];
[yearField release];
}


-(CGRect)      dobDayRect
{
float   ypos=CGRectGetMaxY([self descriptionRect])+6;
float   high=self.frame.size.height;

return CGRectMake(0,ypos,[self fieldWide],high-ypos);
}

-(CGRect)      dobMonthRect
{
float   ypos=CGRectGetMaxY([self descriptionRect])+6;
float   xpos=CGRectGetMaxX([self dobDayRect])+[self spacing];
float   high=self.frame.size.height;

return CGRectMake(xpos,ypos,[self fieldWide],high-ypos);
}

-(CGRect)      dobYearRect
{
float   ypos=CGRectGetMaxY([self descriptionRect])+6;
float   xpos=CGRectGetMaxX([self dobMonthRect])+[self spacing];
float   high=self.frame.size.height;

return CGRectMake(xpos,ypos,[self fieldWide],high-ypos);
}

-(float)       spacing
{
return 24;
}


-(float)       fieldWide
{
float   wide=self.frame.size.width;

return (wide-[self spacing]*2)/3;

}



#pragma mark - ACCESSORY VIEW + METHODS
-(UIToolbar*)   createInputAccessoryView
{
UIToolbar           *keyboardToolbar=[[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 44)];
keyboardToolbar.barStyle=UIBarStyleBlackTranslucent;

UIBarButtonItem     *flexSpace=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
UIBarButtonItem     *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(nextInputAction:)];
UIBarButtonItem     *doneButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeInputAction:)];

[keyboardToolbar setItems:[NSArray arrayWithObjects:nextButton,flexSpace, doneButton, nil] animated:NO];
return keyboardToolbar;
}


#pragma mark - Text Field Delegate


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
int     maxLength=textField==yearField? 4 : 2;

if([string length]==0)	
return YES;

if ([textField.text length]>=maxLength)
return NO;

return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
self.backgroundColor=[UIColor clearColor];
currentField=textField;
return YES;
}


-(void) textFieldDidBeginEditing:(UITextField *)textField
{
if([delegate respondsToSelector:@selector(didBeginEditingWithDateInput:)])
[delegate didBeginEditingWithDateInput:self];
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
if(textField==yearField)
[self checkYearField];


if([delegate respondsToSelector:@selector(didEndEditingWithDateInput:)])
[delegate didEndEditingWithDateInput:self];
}





-(void)     nextInputAction:(id)sender
{
if(currentField==dayField)      currentField=monthField;    else
if(currentField==monthField)    currentField=yearField;     else
if(currentField==yearField)     currentField=dayField;

[self checkYearField];
[currentField becomeFirstResponder];
}


-(void)     closeInputAction:(id)sender
{
[currentField resignFirstResponder];
[self doValidHighlight];
}


-(void)     checkYearField
{
NSString    *year=yearField.text;

if([year length]==2)
    {
    year=[NSString stringWithFormat:@"19%@",year];
    yearField.text=year;
    }
}


-(void) doValidHighlight
{
if([self isValidateDOB] || [self allEmptyField])
    self.backgroundColor=[UIColor clearColor];
else
    self.backgroundColor=[UIColor redColor];
}

-(BOOL) allEmptyField
{
if([yearField.text length]>0)       return NO;
if([dayField.text length]>0)        return NO;
if([monthField.text length]>0)      return NO;

return YES;
}




-(BOOL)        dataInputIsValid
{
return [self isValidateDOB];
}


-(NSString*)      dateValue
{
NSString    *date=[NSString stringWithFormat:@"%@/%@/%@",dayField.text,monthField.text,yearField.text];
return  date;
}


-(BOOL) isValidateDOB
{
NSString    *year=yearField.text;

if([year length]==1)    return NO;
if([year length]==2)    year=[NSString stringWithFormat:@"19%@",year];
if([year length]==3)    return NO;


NSString    *date=[NSString stringWithFormat:@"%@/%@/%@",dayField.text,monthField.text,year];
BOOL        valid=[self isValidateDOB:date];


return valid;
}



-(BOOL) isValidateDOB:(NSString *)dateOfBirth
{
NSDateFormatter *format = [[NSDateFormatter alloc] init];
[format setDateStyle:NSDateFormatterShortStyle];
[format setDateFormat:@"dd/MM/yyyy"];
NSDate *validateDOB = [format dateFromString:dateOfBirth];
[format release];
    
if (validateDOB != nil)
       return YES;
    else
       return NO;
    
}


@end
