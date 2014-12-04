//
//  FizzViewController.m
//  Hamburger
//
//  Created by jdburgie on 12/3/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import "FizzViewController.h"

@interface FizzViewController ()

@property (weak, nonatomic) IBOutlet UITextField *theNumber;
@property (weak, nonatomic) IBOutlet UITextView *progressText;

@end

@implementation FizzViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)fizzBuzzFactorial:(NSInteger)number {
    NSInteger i;
    
    for (i = 1; i <= number; i++)
        {
        NSInteger modThree = 0;
        NSInteger modFive = 0;
        
        BOOL isFizzOrBuzz = NO;
        
        modThree = i%3;
        modFive = i%5;
        
        NSString *fizzBuzzMsg;
        if (modThree == 0)
            {
            fizzBuzzMsg = [NSString stringWithFormat:@"%ld - Fizz", (long)i];
            self.progressText.text = [self.progressText.text stringByAppendingString:fizzBuzzMsg];
            isFizzOrBuzz = YES;
            }
        if (modFive == 0)
            {
            fizzBuzzMsg = [NSString stringWithFormat:@"%ld - Buzz", (long)i];
            self.progressText.text = [self.progressText.text stringByAppendingString:fizzBuzzMsg];
            isFizzOrBuzz = YES;
            }
        
        long factorialFizzBuzz = 1;
        
        if (isFizzOrBuzz)
            {
            for (NSInteger j = i; j > 0; j--)
                {
                factorialFizzBuzz *= j;
                }
            NSString *factorialMsg;
            factorialMsg = [NSString stringWithFormat:@"\n%ld factorial by iteration is %ld\n", (long)i, (long)factorialFizzBuzz];
            
            self.progressText.text = [self.progressText.text stringByAppendingString:factorialMsg];
            
            factorialFizzBuzz = [self recurseFactorial:i];
            
            factorialMsg = [NSString stringWithFormat:@"%ld factorial by recursion is %ld\n\n", (long)i, (long)factorialFizzBuzz];
            
            self.progressText.text = [self.progressText.text stringByAppendingString:factorialMsg];
            
            isFizzOrBuzz = NO;
            }
        }
}

- (NSInteger)recurseFactorial:(NSInteger)number {
    if (number == 0 || number == 1)
        {
        return 1;
        }
    
    number *= [self recurseFactorial:number - 1];
    
    return number;
}

- (IBAction)tappedRunIt:(id)sender {
    if ([self.theNumber canResignFirstResponder])
        {
        [self.theNumber resignFirstResponder];
        }
    
    self.progressText.text = @"";
    
    NSInteger number = [self.theNumber.text intValue];
    
    UIAlertView *alert;
    if (number > 20)
        {
        alert = [[UIAlertView alloc] initWithTitle:@"Too Big" message:@"Enter a number ≤ 20" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        } else if (number < 0)
            {
            alert = [[UIAlertView alloc] initWithTitle:@"Too Negative" message:@"Enter a number ≥ 0" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            } else
                {
                [self fizzBuzzFactorial:number];
                }
    
}

@end
