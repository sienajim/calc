//
//  CalculatorBrain.m
//  calculator
//
//  Created by Jim Mahoney on 5/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
#import "math.h"

@interface CalculatorBrain()

@property (nonatomic, strong  ) NSMutableArray *operandStack;

@end

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack;
{
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

//- (void) setOperandStack:(NSMutableArray *)operandStack
//{
//    _operandStack = operandStack;
//}


- (void) pushOperand:(double)operand
{
    
    [self.operandStack addObject:[NSNumber numberWithDouble:operand] ] ;
    
}

- (double) popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [ self.operandStack removeLastObject];

    return [operandObject doubleValue];
}

- (double) performOperation:(NSString *)operation
{
    double result = 0;
    double first = 0;
    double second = 0;
    // calculate result
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [ self popOperand];
    
    } else if ([@"*" isEqualToString:operation]) {
        result = [self popOperand ] * [self popOperand];
    } else if ([@"-" isEqualToString:operation]) {
        first = [self popOperand ];
        second = [self popOperand ];
        result = second - first;
    } else if ([@"/" isEqualToString:operation]) {
        first = [self popOperand ];
        second = [self popOperand ];
        result = second / first;
    } else if ([@"sqrt" isEqualToString:operation]) {
        result = sqrt([self popOperand]);
    }else if ([@"π" isEqualToString:operation]) {
        result = M_PI ;
    }else if ([@"sin" isEqualToString:operation]) {
        result = sin([self popOperand]);
    }else if ([@"e" isEqualToString:operation]) {
        result = M_E ;
    }else if ([@"cos" isEqualToString:operation]) {
        result = cos([self popOperand]);
    }
        
    return result;
    
}

@end
