//
//  CalculatorViewController.m
//  calculator
//
//  Created by Jim Mahoney on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
//#import "math.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end


@implementation CalculatorViewController
@synthesize display = _display;
@synthesize operationList = _operationList;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *) brain
{
    if (! _brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender 
{  
    NSString *digit = [sender currentTitle];
  
 if (self.userIsInTheMiddleOfEnteringANumber)
 {
    //NSLog(@"digit pressed = %@",digit );
    //UILabel *myDisplay =self.display; // [ self display];
   // NSString *currentText = myDisplay.text; //[myDisplay text ] ;
   // NSString *newText = [currentText stringByAppending:digit] ;
   // myDisplay.text = newText;
    //[myDisplay setText:newText];
     if ([digit isEqualToString:@"."]) 
     {
       //  NSLog(@"Decimal %@",digit);
       NSRange range = [self.display.text rangeOfString:@"."]; 
         if (range.location == NSNotFound)
         {
             // NSLog(@"Decimal add");
             self.display.text = [self.display.text stringByAppendingString:digit];
         } else {
             self.userIsInTheMiddleOfEnteringANumber = YES;
         }

     } else { // other digit
        //  NSLog(@"Decimal not %@",digit);
         self.display.text = [self.display.text stringByAppendingString:digit];
     }
 }
 else {
     self.display.text = digit;
     self.userIsInTheMiddleOfEnteringANumber = YES;
 
     }
}
- (IBAction)clearPressed {
    self.display.text = @"";
    self.operationList.text = @"";
    [self.brain  clearStack];
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.operationList.text = [[self.operationList.text stringByAppendingString:@" "] stringByAppendingString:self.display.text ] ;
}


- (IBAction)operationPressed:(UIButton *)sender 
{
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    
  //  if ([sender.currentTitle isEqualToString:@"π"])
  //  {
       // [self enterPressed];
   //     [self.brain pushOperand:M_PI];
   // }
    
    double result = [self.brain performOperation: sender.currentTitle];
    
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
     self.operationList.text = [[self.operationList.text stringByAppendingString:@" "] stringByAppendingString:sender.currentTitle ];
    
}

//- (IBAction)enterPressed {
//    [self.brain pushOperand:[self.display.text doubleValue]];
//    self.userIsInTheMiddleOfEnteringANumber = NO;
//}

- (void)viewDidUnload {
    [self setOperationList:nil];
    [super viewDidUnload];
}
@end
