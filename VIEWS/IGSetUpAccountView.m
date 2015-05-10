//
//  IGSetUpAccountView.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGSetUpAccountView.h"

@implementation IGSetUpAccountView


@synthesize dataSource;
@synthesize delegate;

@synthesize nameField;
@synthesize dateBirthView;
@synthesize pastInfoView;
@synthesize financeInfoView;



- (id)initWithFrame:(CGRect)frame
{
if (self = [super initWithFrame:frame])
	{
    pastInfoView=nil;
    financeInfoView=nil;
    }
return self;
}


-(void)     dealloc
{
[super dealloc];
}



#pragma mark -  ADD ADDITIONAL VIEWS DEPENDING ON EXTRA FIELDS FOR TERRITORY
-(void)     updateViewsUsing:(IGTurboTraderAccount*)account
{
IGTerrittory        *userTerritory=[account territtoryInfo];
NSMutableArray      *requireFieldDataTypes=[userTerritory requireFieldDataTypes];


pastInfoView.hidden=YES;
financeInfoView.hidden=YES;

for(NSString *dataType in requireFieldDataTypes)
    {
    if([dataType isEqualToString:@"IGTraderPastInfo"])      [self addPastInfoView];
    if([dataType isEqualToString:@"IGTraderFinanceInfo"])   [self addFinanceInfoView];
    }

[self adjustViewLayouts];
[self adjustScrollViewSize];
[self checkAllFilledAndOkay];
}




-(void)     adjustViewLayouts
{
float   currentY=12;

for(UIView *view in [myScrollView subviews])
    {
    if(![view isHidden])
        {
        view.frame=CGRectMake(view.frame.origin.x,currentY,view.frame.size.width,view.frame.size.height);
        currentY=CGRectGetMaxY(view.frame)+12;
        }
    }
}



-(void)     adjustScrollViewSize
{
float   maximumY=0;

for(UIView *view in [myScrollView subviews])
    {
    if(![view isHidden])
        {
        float   yp=CGRectGetMaxY(view.frame);
        if(yp>maximumY)
        maximumY=yp;
        }
    }

myScrollView.contentSize=CGSizeMake(myScrollView.frame.size.width,maximumY+12);
}





#pragma mark -  scroll to top
-(void)     scrollToTop
{
[myScrollView setContentOffset:CGPointMake(0,0) animated:YES];
}





#pragma mark -  CREATE SUBVIEWS
-(void)     makeViews
{
[self makeScrollView];
[self makeSignUpButton];

[self makeNameField];
[self makeDOBField];
[self makeCountryPicker];
}


-(void)     makeScrollView
{
myScrollView=[[UIScrollView alloc]initWithFrame:[self scrollRect]];
myScrollView.showsHorizontalScrollIndicator=NO;
myScrollView.showsVerticalScrollIndicator=NO;
[self addSubview:myScrollView];
[myScrollView release];
}


-(void)     addPastInfoView
{
if(pastInfoView==nil)
    {
    pastInfoView=[[IGPastInfoView alloc]initWithFrame:[self pastInfoRect]];
    pastInfoView.delegate=self;
    pastInfoView.backgroundColor=[UIColor clearColor];
    [myScrollView addSubview:pastInfoView];
    [pastInfoView release];
    }

pastInfoView.hidden=NO;
}


-(void)     addFinanceInfoView
{
if(financeInfoView==nil)
    {
    financeInfoView=[[IGFinacialInfoView alloc]initWithFrame:[self financeInfoRect]];
    financeInfoView.delegate=self;
    financeInfoView.backgroundColor=[UIColor clearColor];
    [myScrollView addSubview:financeInfoView];
    [financeInfoView release];
    }

financeInfoView.hidden=NO;
}


-(void)     makeCountryPicker
{
countrySelectorView=[[IGTerritorySelectView alloc]initWithFrame:[self pickerRect]];
countrySelectorView.backgroundColor=[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
countrySelectorView.delegate=self;
countrySelectorView.dataSource=self;
[myScrollView addSubview:countrySelectorView];
[countrySelectorView release];
}


-(void)     makeNameField
{
nameField=[[IGFieldInputView alloc]initWithFrame:[self nameFieldRect]];
nameField.delegate=self;
[nameField setDescription:@"Your Name"];
[myScrollView addSubview:nameField];
[nameField release];
}

-(void)     makeDOBField
{
dateBirthView=[[IGDateInputView alloc]initWithFrame:[self dateBirthRect]];
dateBirthView.delegate=self;
[myScrollView addSubview:dateBirthView];
[dateBirthView release];

}



-(void)     makeSignUpButton
{
signUpButton=[UIButton buttonWithType:UIButtonTypeCustom];
signUpButton.backgroundColor=[UIColor clearColor];
[signUpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
[signUpButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
signUpButton.frame=[self signUpButtonRect];
[signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
[signUpButton setTitle:@"Sign Up" forState:UIControlStateHighlighted];
[signUpButton addTarget:self action:@selector(signUpAction:) forControlEvents:UIControlEventTouchUpInside];

[self addSubview:signUpButton];
}





#pragma mark -  SUBVIEW RECTS


-(CGRect)      scrollRect
{
float   wide=self.frame.size.width;
float   high=CGRectGetMinY([self signUpButtonRect]);
float   ypos=0;

return CGRectMake(0,ypos,wide,high-ypos);
}





-(CGRect)      signUpButtonRect
{
float   wide=self.frame.size.width;
float   high=self.frame.size.height;
return CGRectMake(0,high-50,wide,50);
}

-(CGRect)      nameFieldRect
{
float   wide=self.frame.size.width;

return CGRectMake(20,0,wide-40,42);
}

-(CGRect)      dateBirthRect
{
float   ypos=CGRectGetMaxY([self nameFieldRect])+12;
float   wide=self.frame.size.width;

return CGRectMake(20,ypos,wide-40,42);
}


-(CGRect)      pickerRect
{
float   wide=self.frame.size.width;
float   ypos=CGRectGetMaxY([self dateBirthRect]);

return CGRectMake(20,ypos,wide/2,216);
}

-(CGRect)      pastInfoRect
{
float   wide=self.frame.size.width;
float   ypos=CGRectGetMaxY([self pickerRect]);

return CGRectMake(20,ypos,wide-40,100);
}

-(CGRect)      financeInfoRect
{
float   wide=self.frame.size.width;
float   ypos=CGRectGetMaxY([self pickerRect]);

return CGRectMake(20,ypos,wide-40,100);
}




#pragma mark -  ACTIONS


-(void)     signUpAction:(id)sender
{
NSLog(@"signUpAction");
if([delegate respondsToSelector:@selector(doSignUp:)])
return [delegate doSignUp:self];
}


#pragma mark -  PICKER DATASOURCE DELEGATE
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
if([dataSource respondsToSelector:@selector(numberOfCountries:)])
return [dataSource numberOfCountries:self];

return 0;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
if([dataSource respondsToSelector:@selector(countryNameForRow:row:)])
return [dataSource countryNameForRow:self row:row];


return @"Error";
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
if([dataSource respondsToSelector:@selector(didSelectCountryAtRow:row:)])
[dataSource didSelectCountryAtRow:self row:row];

[dateBirthView resignActive];
}




#pragma mark - CHECK FIELDS FILLED AND OKAY AND BUTTON
-(void)     checkAllFilledAndOkay
{
BOOL    okay=YES;

for(UIView *view in [myScrollView subviews])
    {
    if(![view isHidden])
        {
        if([view respondsToSelector:@selector(dataInputIsValid)])
            {
            okay=okay & [(IGBasicInputDataView*)view dataInputIsValid];
            }
        }
    }




float   alpha=okay? 1.0 : 0.2;

signUpButton.alpha=alpha;
signUpButton.enabled=okay;
}






#pragma mark - IGTextFieldInputViewDelegate

-(void)         didBeginEditing:(IGTextFieldInputView*)view
{
float   ypos=CGRectGetMinY(view.frame);

currentScrollOfset=[myScrollView contentOffset];
[myScrollView setContentOffset:CGPointMake(0,ypos-50) animated:YES];
}


-(void)         didEndEditing:(IGTextFieldInputView*)view
{
[myScrollView setContentOffset:currentScrollOfset animated:YES];
[self checkAllFilledAndOkay];
}







#pragma mark - IGFieldInputViewDelegate

-(void)         didBeginEditingWithField:(IGFieldInputView*)view
{
}

-(void)         didEndEditingWithField:(IGFieldInputView*)view
{
[self checkAllFilledAndOkay];
}






#pragma mark - IGDateInputViewDelegate

-(void)         didBeginEditingWithDateInput:(IGDateInputView*)view
{

}




-(void)         didEndEditingWithDateInput:(IGDateInputView*)view
{
[self checkAllFilledAndOkay];
}





@end
