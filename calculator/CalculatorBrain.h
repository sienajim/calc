//
//  CalculatorBrain.h
//  calculator
//
//  Created by Jim/Users/jmahoney/develop/Calculator/calculator/calculator/CalculatorBrain.m Mahoney on 5/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void) pushOperand: (double) operand;
- (double) performOperation:(NSString *) operation;
- (void) clearStack;
@end
