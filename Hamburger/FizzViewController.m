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
        if ((modThree == 0) && (modFive == 0))
            {
            fizzBuzzMsg = [NSString stringWithFormat:@"\nBizzBuzz"];
            self.progressText.text = [self.progressText.text stringByAppendingString:fizzBuzzMsg];
            isFizzOrBuzz = YES;
            }
        else if (modThree == 0)
            {
            fizzBuzzMsg = [NSString stringWithFormat:@"\nBizz"];
            self.progressText.text = [self.progressText.text stringByAppendingString:fizzBuzzMsg];
            isFizzOrBuzz = YES;
            }
        else if (modFive == 0)
            {
            fizzBuzzMsg = [NSString stringWithFormat:@"\nBuzz"];
            self.progressText.text = [self.progressText.text stringByAppendingString:fizzBuzzMsg];
            isFizzOrBuzz = YES;
            }
        else
            {
            fizzBuzzMsg = [NSString stringWithFormat:@"%ld\n", (long)i];
            self.progressText.text = [self.progressText.text stringByAppendingString:fizzBuzzMsg];
            isFizzOrBuzz = NO;
            }
        
        long factorialFizzBuzz = 1;
        
        if (isFizzOrBuzz)
            {
            for (NSInteger j = i; j > 0; j--)
                {
                factorialFizzBuzz *= j;
                }
            NSString *factorialMsg;
            factorialMsg = [NSString stringWithFormat:@"\n%ld factorial by iteration %ld, ", (long)i, (long)factorialFizzBuzz];
            
            self.progressText.text = [self.progressText.text stringByAppendingString:factorialMsg];
            
            factorialFizzBuzz = [self recurseFactorial:i];
            
            factorialMsg = [NSString stringWithFormat:@" by recursion %ld\n\n", (long)factorialFizzBuzz];
            
            self.progressText.text = [self.progressText.text stringByAppendingString:factorialMsg];
            }
        }
    
    if ([self.progressText.text isEqualToString:@""])
        {
        self.progressText.text = @"Nothing to count.";
        }
    else
        {
        self.progressText.text = [self.progressText.text stringByReplacingOccurrencesOfString:@"\n\n\n" withString:@"\n\n"];
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
    NSString *alertTitle;
    NSString *alertMsg;
    if ((number > 20) || (number < 0))
        {
        alertTitle = number < 0 ? @"Too Negative" : @"Too Big";
        alertMsg = number < 0 ? @"Enter a number ≥ 0" : @"Enter a number ≤ 20";
        
        alert = [[UIAlertView alloc] initWithTitle:alertTitle message:alertMsg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        }
    else
        {
        [self fizzBuzzFactorial:number];
        }
    
}

@end
