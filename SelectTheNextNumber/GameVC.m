//
//  GameVC.m
//  SelectTheNextNumber
//
//  Created by Macbook on 20/08/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "GameVC.h"
#import "SCLAlertView.h"

@interface GameVC ()
{
    NSMutableArray * dataArray;
    NSMutableDictionary * data;
    
    NSMutableDictionary * SelectedItem;
    
    NSString * target;
    
    NSString * answerString;
    
    
    int n1;
    int n2;
    int n3;
    int n4;
    
    
    int targetNumber;
    int sum;
    int attempts;
    int buttonCount;
    
    int randomButton;
    int index;
    int score;
    int count;
    
    NSTimer * t;
    int timer;
}

@end



NSString *kSuccessTitle = @"Congratulations";
NSString *kErrorTitle = @"Connection error";
NSString *kNoticeTitle = @"Notice";
NSString *kWarningTitle = @"Warning";
NSString *kInfoTitle = @"Info";
NSString *kSubtitle = @"You've just displayed this awesome Pop Up View";
NSString *kButtonTitle = @"Done";
NSString *kAttributeTitle = @"Attributed string operation successfully completed.";



@implementation GameVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = false;
   
  
    [self setEasyArray];
   
    
    sum = 1;
    buttonCount = 1;
    
    index = 0;
    score = 0;
    count = 0;
    attempts = 3;
    
    [self setScreen];
}


- (IBAction)b1:(id)sender
{
 
    NSString * val = _b1.titleLabel.text;
    
    if ([val isEqualToString:answerString])
    {
        _p5.text = [NSString stringWithFormat:@"%@",val];
        score = score + 100;
        count = count + 1;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b2:(id)sender
{
    NSString * val = _b2.titleLabel.text;
    
    if ([val isEqualToString:answerString])
    {
        _p5.text = [NSString stringWithFormat:@"%@",val];
        score = score + 100;
        count = count + 1;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b3:(id)sender
{
    NSString * val = _b3.titleLabel.text;
    
    if ([val isEqualToString:answerString])
    {
        _p5.text = [NSString stringWithFormat:@"%@",val];
        score = score + 100;
        count = count + 1;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b4:(id)sender
{
    NSString * val = _b4.titleLabel.text;
    
    if ([val isEqualToString:answerString])
    {
        _p5.text = [NSString stringWithFormat:@"%@",val];
        score = score + 100;
        count = count + 1;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b5:(id)sender
{
    NSString * val = _b5.titleLabel.text;
    
    if ([val isEqualToString:answerString])
    {
        _p5.text = [NSString stringWithFormat:@"%@",val];
        score = score + 100;
        count = count + 1;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b6:(id)sender
{
    NSString * val = _b6.titleLabel.text;
    
    if ([val isEqualToString:answerString])
    {
        _p5.text = [NSString stringWithFormat:@"%@",val];
        score = score + 100;
        count = count + 1;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b7:(id)sender
{
    NSString * val = _b7.titleLabel.text;
    
    if ([val isEqualToString:answerString])
    {
        _p5.text = [NSString stringWithFormat:@"%@",val];
        score = score + 100;
        count = count + 1;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b8:(id)sender
{
    NSString * val = _b8.titleLabel.text;
    
    if ([val isEqualToString:answerString])
    {
        _p5.text = [NSString stringWithFormat:@"%@",val];
        score = score + 100;
        count = count + 1;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b9:(id)sender
{
    NSString * val = _b9.titleLabel.text;
    
    if ([val isEqualToString:answerString])
    {
        _p5.text = [NSString stringWithFormat:@"%@",val];
        score = score + 100;
        count = count + 1;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}


-(void) setScreen
{
    if (count == 5)
    {
        if (score == 500)
        {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", score];
             [self showWin];
        }
        else
        {
            _scoreLabel.text = [NSString stringWithFormat:@"%d", score];
            [self showWrongAnswer];
        }
    }
    else
    {
        sum = 1;
        buttonCount = 1;
        answerString = @"";
        
        
        int rand = arc4random()%dataArray.count;
        
        SelectedItem = [dataArray objectAtIndex:rand];
        
         answerString = [SelectedItem objectForKey:@"answer"];
        
         _levelLabel.text = [NSString stringWithFormat:@"%d/5", count+1];
        
        _scoreLabel.text = [NSString stringWithFormat:@"%d", score];
        
        [self setButtons];
    }
    
}

-(void) setButtons
{
    
    _p1.text = [SelectedItem objectForKey:@"p1"];
    _p2.text = [SelectedItem objectForKey:@"p2"];
    _p3.text = [SelectedItem objectForKey:@"p3"];
    _p4.text = [SelectedItem objectForKey:@"p4"];
    _p5.text = @"?";
    _p6.text = [SelectedItem objectForKey:@"p6"];
    _p7.text = [SelectedItem objectForKey:@"p7"];
    _p8.text = [SelectedItem objectForKey:@"p8"];
    _p9.text = [SelectedItem objectForKey:@"p9"];
    
    
    
    [_b1 setTitle:[SelectedItem objectForKey:@"n1"] forState:UIControlStateNormal];
    [_b2 setTitle:[SelectedItem objectForKey:@"n2"] forState:UIControlStateNormal];
    [_b3 setTitle:[SelectedItem objectForKey:@"n3"] forState:UIControlStateNormal];
    [_b4 setTitle:[SelectedItem objectForKey:@"n4"] forState:UIControlStateNormal];
    [_b5 setTitle:[SelectedItem objectForKey:@"n5"] forState:UIControlStateNormal];
    [_b6 setTitle:[SelectedItem objectForKey:@"n6"] forState:UIControlStateNormal];
    [_b7 setTitle:[SelectedItem objectForKey:@"n7"] forState:UIControlStateNormal];
    [_b8 setTitle:[SelectedItem objectForKey:@"n8"] forState:UIControlStateNormal];
    [_b9 setTitle:[SelectedItem objectForKey:@"n9"] forState:UIControlStateNormal];

}


-(void) setEasyArray
{
    dataArray = [[NSMutableArray alloc] init];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"1" forKey:@"p1"];
    [data setValue:@"2" forKey:@"p2"];
    [data setValue:@"3" forKey:@"p3"];
    [data setValue:@"4" forKey:@"p4"];
    [data setValue:@"5" forKey:@"answer"];
    [data setValue:@"6" forKey:@"p6"];
    [data setValue:@"7" forKey:@"p7"];
    [data setValue:@"8" forKey:@"p8"];
    [data setValue:@"9" forKey:@"p9"];
    
    [data setValue:@"9" forKey:@"n1"];
    [data setValue:@"5" forKey:@"n2"];
    [data setValue:@"4" forKey:@"n3"];
    [data setValue:@"3" forKey:@"n4"];
    [data setValue:@"13" forKey:@"n5"];
    [data setValue:@"10" forKey:@"n6"];
    [data setValue:@"1" forKey:@"n7"];
    [data setValue:@"2" forKey:@"n8"];
    [data setValue:@"13" forKey:@"n9"];
    [dataArray addObject:data];
    
    
    
    
  
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"1" forKey:@"p1"];
    [data setValue:@"2" forKey:@"p2"];
    [data setValue:@"1" forKey:@"p3"];
    [data setValue:@"2" forKey:@"p4"];
    [data setValue:@"4" forKey:@"answer"];
    [data setValue:@"2" forKey:@"p6"];
    [data setValue:@"3" forKey:@"p7"];
    [data setValue:@"6" forKey:@"p8"];
    [data setValue:@"3" forKey:@"p9"];
    
    [data setValue:@"7" forKey:@"n1"];
    [data setValue:@"2" forKey:@"n2"];
    [data setValue:@"9" forKey:@"n3"];
    [data setValue:@"3" forKey:@"n4"];
    [data setValue:@"13" forKey:@"n5"];
    [data setValue:@"4" forKey:@"n6"];
    [data setValue:@"14" forKey:@"n7"];
    [data setValue:@"2" forKey:@"n8"];
    [data setValue:@"3" forKey:@"n9"];
    [dataArray addObject:data];
    
    
    
   
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"a" forKey:@"p1"];
    [data setValue:@"b" forKey:@"p2"];
    [data setValue:@"c" forKey:@"p3"];
    [data setValue:@"g" forKey:@"p4"];
    [data setValue:@"h" forKey:@"answer"];
    [data setValue:@"i" forKey:@"p6"];
    [data setValue:@"m" forKey:@"p7"];
    [data setValue:@"n" forKey:@"p8"];
    [data setValue:@"o" forKey:@"p9"];
    
    [data setValue:@"e" forKey:@"n1"];
    [data setValue:@"s" forKey:@"n2"];
    [data setValue:@"d" forKey:@"n3"];
    [data setValue:@"f" forKey:@"n4"];
    [data setValue:@"l" forKey:@"n5"];
    [data setValue:@"k" forKey:@"n6"];
    [data setValue:@"y" forKey:@"n7"];
    [data setValue:@"t" forKey:@"n8"];
    [data setValue:@"h" forKey:@"n9"];
    [dataArray addObject:data];
 
    
    
    

    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"ab" forKey:@"p1"];
    [data setValue:@"bc" forKey:@"p2"];
    [data setValue:@"cd" forKey:@"p3"];
    [data setValue:@"de" forKey:@"p4"];
    [data setValue:@"ef" forKey:@"answer"];
    [data setValue:@"fg" forKey:@"p6"];
    [data setValue:@"gh" forKey:@"p7"];
    [data setValue:@"hi" forKey:@"p8"];
    [data setValue:@"ij" forKey:@"p9"];
    
    [data setValue:@"ed" forKey:@"n1"];
    [data setValue:@"ef" forKey:@"n2"];
    [data setValue:@"tg" forKey:@"n3"];
    [data setValue:@"tp" forKey:@"n4"];
    [data setValue:@"op" forKey:@"n5"];
    [data setValue:@"we" forKey:@"n6"];
    [data setValue:@"no" forKey:@"n7"];
    [data setValue:@"mp" forKey:@"n8"];
    [data setValue:@"pq" forKey:@"n9"];
    [dataArray addObject:data];

    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"11" forKey:@"p1"];
    [data setValue:@"22" forKey:@"p2"];
    [data setValue:@"33" forKey:@"p3"];
    [data setValue:@"33" forKey:@"p4"];
    [data setValue:@"22" forKey:@"answer"];
    [data setValue:@"11" forKey:@"p6"];
    [data setValue:@"11" forKey:@"p7"];
    [data setValue:@"22" forKey:@"p8"];
    [data setValue:@"33" forKey:@"p9"];
    
    [data setValue:@"10" forKey:@"n1"];
    [data setValue:@"11" forKey:@"n2"];
    [data setValue:@"77" forKey:@"n3"];
    [data setValue:@"44" forKey:@"n4"];
    [data setValue:@"33" forKey:@"n5"];
    [data setValue:@"13" forKey:@"n6"];
    [data setValue:@"11" forKey:@"n7"];
    [data setValue:@"22" forKey:@"n8"];
    [data setValue:@"14" forKey:@"n9"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"2" forKey:@"p1"];
    [data setValue:@"4" forKey:@"p2"];
    [data setValue:@"6" forKey:@"p3"];
    [data setValue:@"3" forKey:@"p4"];
    [data setValue:@"5" forKey:@"answer"];
    [data setValue:@"7" forKey:@"p6"];
    [data setValue:@"4" forKey:@"p7"];
    [data setValue:@"6" forKey:@"p8"];
    [data setValue:@"8" forKey:@"p9"];
    
    [data setValue:@"3" forKey:@"n1"];
    [data setValue:@"5" forKey:@"n2"];
    [data setValue:@"11" forKey:@"n3"];
    [data setValue:@"6" forKey:@"n4"];
    [data setValue:@"13" forKey:@"n5"];
    [data setValue:@"9" forKey:@"n6"];
    [data setValue:@"4" forKey:@"n7"];
    [data setValue:@"2" forKey:@"n8"];
    [data setValue:@"1" forKey:@"n9"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"10" forKey:@"p1"];
    [data setValue:@"20" forKey:@"p2"];
    [data setValue:@"30" forKey:@"p3"];
    [data setValue:@"60" forKey:@"p4"];
    [data setValue:@"50" forKey:@"answer"];
    [data setValue:@"40" forKey:@"p6"];
    [data setValue:@"70" forKey:@"p7"];
    [data setValue:@"80" forKey:@"p8"];
    [data setValue:@"90" forKey:@"p9"];
    
    [data setValue:@"90" forKey:@"n1"];
    [data setValue:@"60" forKey:@"n2"];
    [data setValue:@"40" forKey:@"n3"];
    [data setValue:@"30" forKey:@"n4"];
    [data setValue:@"13" forKey:@"n5"];
    [data setValue:@"10" forKey:@"n6"];
    [data setValue:@"50" forKey:@"n7"];
    [data setValue:@"20" forKey:@"n8"];
    [data setValue:@"130" forKey:@"n9"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"31" forKey:@"p1"];
    [data setValue:@"32" forKey:@"p2"];
    [data setValue:@"33" forKey:@"p3"];
    [data setValue:@"42" forKey:@"p4"];
    [data setValue:@"43" forKey:@"answer"];
    [data setValue:@"44" forKey:@"p6"];
    [data setValue:@"53" forKey:@"p7"];
    [data setValue:@"54" forKey:@"p8"];
    [data setValue:@"55" forKey:@"p9"];
    
    [data setValue:@"39" forKey:@"n1"];
    [data setValue:@"35" forKey:@"n2"];
    [data setValue:@"34" forKey:@"n3"];
    [data setValue:@"43" forKey:@"n4"];
    [data setValue:@"13" forKey:@"n5"];
    [data setValue:@"10" forKey:@"n6"];
    [data setValue:@"41" forKey:@"n7"];
    [data setValue:@"42" forKey:@"n8"];
    [data setValue:@"13" forKey:@"n9"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"a" forKey:@"p1"];
    [data setValue:@"s" forKey:@"p2"];
    [data setValue:@"d" forKey:@"p3"];
    [data setValue:@"f" forKey:@"p4"];
    [data setValue:@"g" forKey:@"answer"];
    [data setValue:@"h" forKey:@"p6"];
    [data setValue:@"j" forKey:@"p7"];
    [data setValue:@"k" forKey:@"p8"];
    [data setValue:@"l" forKey:@"p9"];
    
    [data setValue:@"q" forKey:@"n1"];
    [data setValue:@"w" forKey:@"n2"];
    [data setValue:@"e" forKey:@"n3"];
    [data setValue:@"g" forKey:@"n4"];
    [data setValue:@"t" forKey:@"n5"];
    [data setValue:@"e" forKey:@"n6"];
    [data setValue:@"u" forKey:@"n7"];
    [data setValue:@"i" forKey:@"n8"];
    [data setValue:@"o" forKey:@"n9"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"q" forKey:@"p1"];
    [data setValue:@"w" forKey:@"p2"];
    [data setValue:@"e" forKey:@"p3"];
    [data setValue:@"r" forKey:@"p4"];
    [data setValue:@"t" forKey:@"answer"];
    [data setValue:@"y" forKey:@"p6"];
    [data setValue:@"u" forKey:@"p7"];
    [data setValue:@"i" forKey:@"p8"];
    [data setValue:@"o" forKey:@"p9"];
    
    [data setValue:@"a" forKey:@"n1"];
    [data setValue:@"s" forKey:@"n2"];
    [data setValue:@"d" forKey:@"n3"];
    [data setValue:@"f" forKey:@"n4"];
    [data setValue:@"g" forKey:@"n5"];
    [data setValue:@"h" forKey:@"n6"];
    [data setValue:@"j" forKey:@"n7"];
    [data setValue:@"t" forKey:@"n8"];
    [data setValue:@"l" forKey:@"n9"];
    [dataArray addObject:data];
    
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"1a" forKey:@"p1"];
    [data setValue:@"2b" forKey:@"p2"];
    [data setValue:@"3c" forKey:@"p3"];
    [data setValue:@"4e" forKey:@"p4"];
    [data setValue:@"5f" forKey:@"answer"];
    [data setValue:@"6g" forKey:@"p6"];
    [data setValue:@"7i" forKey:@"p7"];
    [data setValue:@"8j" forKey:@"p8"];
    [data setValue:@"9k" forKey:@"p9"];
    
    [data setValue:@"9s" forKey:@"n1"];
    [data setValue:@"5c" forKey:@"n2"];
    [data setValue:@"4e" forKey:@"n3"];
    [data setValue:@"5f" forKey:@"n4"];
    [data setValue:@"1r" forKey:@"n5"];
    [data setValue:@"1t" forKey:@"n6"];
    [data setValue:@"5d" forKey:@"n7"];
    [data setValue:@"2d" forKey:@"n8"];
    [data setValue:@"5y" forKey:@"n9"];
    [dataArray addObject:data];
    
    

    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"1a1" forKey:@"p1"];
    [data setValue:@"2c2" forKey:@"p2"];
    [data setValue:@"3e3" forKey:@"p3"];
    [data setValue:@"4g4" forKey:@"p4"];
    [data setValue:@"5i5" forKey:@"answer"];
    [data setValue:@"6k6" forKey:@"p6"];
    [data setValue:@"7m7" forKey:@"p7"];
    [data setValue:@"8o8" forKey:@"p8"];
    [data setValue:@"9q9" forKey:@"p9"];
    
    [data setValue:@"9a9" forKey:@"n1"];
    [data setValue:@"5s5" forKey:@"n2"];
    [data setValue:@"4c4" forKey:@"n3"];
    [data setValue:@"3v3" forKey:@"n4"];
    [data setValue:@"3r3" forKey:@"n5"];
    [data setValue:@"1t1" forKey:@"n6"];
    [data setValue:@"4y4" forKey:@"n7"];
    [data setValue:@"5i5" forKey:@"n8"];
    [data setValue:@"7r7" forKey:@"n9"];
    [dataArray addObject:data];
    
}



-(void) setMediumArray
{
    dataArray = [[NSMutableArray alloc] init];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"12" forKey:@"p1"];
    [data setValue:@"24" forKey:@"p2"];
    [data setValue:@"36" forKey:@"p3"];
    [data setValue:@"48" forKey:@"p4"];
    [data setValue:@"60" forKey:@"answer"];
    
    [data setValue:@"90" forKey:@"n1"];
    [data setValue:@"60" forKey:@"n2"];
    [data setValue:@"61" forKey:@"n3"];
    [data setValue:@"62" forKey:@"n4"];
    [data setValue:@"63" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"10" forKey:@"p1"];
    [data setValue:@"30" forKey:@"p2"];
    [data setValue:@"50" forKey:@"p3"];
    [data setValue:@"70" forKey:@"p4"];
    [data setValue:@"90" forKey:@"answer"];
    
    [data setValue:@"90" forKey:@"n1"];
    [data setValue:@"100" forKey:@"n2"];
    [data setValue:@"30" forKey:@"n3"];
    [data setValue:@"110" forKey:@"n4"];
    [data setValue:@"120" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"11" forKey:@"p1"];
    [data setValue:@"23" forKey:@"p2"];
    [data setValue:@"35" forKey:@"p3"];
    [data setValue:@"43" forKey:@"p4"];
    [data setValue:@"51" forKey:@"answer"];
    
    [data setValue:@"59" forKey:@"n1"];
    [data setValue:@"51" forKey:@"n2"];
    [data setValue:@"52" forKey:@"n3"];
    [data setValue:@"53" forKey:@"n4"];
    [data setValue:@"56" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"21" forKey:@"p1"];
    [data setValue:@"41" forKey:@"p2"];
    [data setValue:@"61" forKey:@"p3"];
    [data setValue:@"41" forKey:@"p4"];
    [data setValue:@"21" forKey:@"answer"];
    
    [data setValue:@"41" forKey:@"n1"];
    [data setValue:@"11" forKey:@"n2"];
    [data setValue:@"21" forKey:@"n3"];
    [data setValue:@"81" forKey:@"n4"];
    [data setValue:@"61" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"102" forKey:@"p1"];
    [data setValue:@"82" forKey:@"p2"];
    [data setValue:@"62" forKey:@"p3"];
    [data setValue:@"42" forKey:@"p4"];
    [data setValue:@"22" forKey:@"answer"];
    
    [data setValue:@"42" forKey:@"n1"];
    [data setValue:@"12" forKey:@"n2"];
    [data setValue:@"52" forKey:@"n3"];
    [data setValue:@"22" forKey:@"n4"];
    [data setValue:@"32" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"50" forKey:@"p1"];
    [data setValue:@"100" forKey:@"p2"];
    [data setValue:@"150" forKey:@"p3"];
    [data setValue:@"200" forKey:@"p4"];
    [data setValue:@"250" forKey:@"answer"];
    
    [data setValue:@"240" forKey:@"n1"];
    [data setValue:@"210" forKey:@"n2"];
    [data setValue:@"220" forKey:@"n3"];
    [data setValue:@"250" forKey:@"n4"];
    [data setValue:@"260" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"81" forKey:@"p1"];
    [data setValue:@"71" forKey:@"p2"];
    [data setValue:@"61" forKey:@"p3"];
    [data setValue:@"51" forKey:@"p4"];
    [data setValue:@"41" forKey:@"answer"];
    
    [data setValue:@"41" forKey:@"n1"];
    [data setValue:@"61" forKey:@"n2"];
    [data setValue:@"81" forKey:@"n3"];
    [data setValue:@"31" forKey:@"n4"];
    [data setValue:@"11" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"12" forKey:@"p1"];
    [data setValue:@"22" forKey:@"p2"];
    [data setValue:@"32" forKey:@"p3"];
    [data setValue:@"42" forKey:@"p4"];
    [data setValue:@"52" forKey:@"answer"];
    
    [data setValue:@"32" forKey:@"n1"];
    [data setValue:@"52" forKey:@"n2"];
    [data setValue:@"92" forKey:@"n3"];
    [data setValue:@"22" forKey:@"n4"];
    [data setValue:@"62" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"1" forKey:@"p1"];
    [data setValue:@"4" forKey:@"p2"];
    [data setValue:@"7" forKey:@"p3"];
    [data setValue:@"10" forKey:@"p4"];
    [data setValue:@"13" forKey:@"answer"];
    
    [data setValue:@"14" forKey:@"n1"];
    [data setValue:@"11" forKey:@"n2"];
    [data setValue:@"12" forKey:@"n3"];
    [data setValue:@"13" forKey:@"n4"];
    [data setValue:@"16" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"111" forKey:@"p1"];
    [data setValue:@"112" forKey:@"p2"];
    [data setValue:@"113" forKey:@"p3"];
    [data setValue:@"114" forKey:@"p4"];
    [data setValue:@"115" forKey:@"answer"];
    
    [data setValue:@"114" forKey:@"n1"];
    [data setValue:@"115" forKey:@"n2"];
    [data setValue:@"112" forKey:@"n3"];
    [data setValue:@"113" forKey:@"n4"];
    [data setValue:@"116" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"23" forKey:@"p1"];
    [data setValue:@"26" forKey:@"p2"];
    [data setValue:@"29" forKey:@"p3"];
    [data setValue:@"32" forKey:@"p4"];
    [data setValue:@"35" forKey:@"answer"];
    
    [data setValue:@"31" forKey:@"n1"];
    [data setValue:@"32" forKey:@"n2"];
    [data setValue:@"33" forKey:@"n3"];
    [data setValue:@"34" forKey:@"n4"];
    [data setValue:@"35" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"14" forKey:@"p1"];
    [data setValue:@"18" forKey:@"p2"];
    [data setValue:@"22" forKey:@"p3"];
    [data setValue:@"26" forKey:@"p4"];
    [data setValue:@"30" forKey:@"answer"];
    
    [data setValue:@"20" forKey:@"n1"];
    [data setValue:@"32" forKey:@"n2"];
    [data setValue:@"30" forKey:@"n3"];
    [data setValue:@"38" forKey:@"n4"];
    [data setValue:@"39" forKey:@"n5"];
    [dataArray addObject:data];
    
}


-(void) setHardArray
{
    dataArray = [[NSMutableArray alloc] init];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"11" forKey:@"p1"];
    [data setValue:@"13" forKey:@"p2"];
    [data setValue:@"15" forKey:@"p3"];
    [data setValue:@"17" forKey:@"p4"];
    [data setValue:@"19" forKey:@"answer"];
    
    [data setValue:@"19" forKey:@"n1"];
    [data setValue:@"10" forKey:@"n2"];
    [data setValue:@"11" forKey:@"n3"];
    [data setValue:@"12" forKey:@"n4"];
    [data setValue:@"13" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"12" forKey:@"p1"];
    [data setValue:@"32" forKey:@"p2"];
    [data setValue:@"52" forKey:@"p3"];
    [data setValue:@"72" forKey:@"p4"];
    [data setValue:@"92" forKey:@"answer"];
    
    [data setValue:@"92" forKey:@"n1"];
    [data setValue:@"102" forKey:@"n2"];
    [data setValue:@"32" forKey:@"n3"];
    [data setValue:@"112" forKey:@"n4"];
    [data setValue:@"122" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"16" forKey:@"p1"];
    [data setValue:@"36" forKey:@"p2"];
    [data setValue:@"56" forKey:@"p3"];
    [data setValue:@"36" forKey:@"p4"];
    [data setValue:@"16" forKey:@"answer"];
    
    [data setValue:@"9" forKey:@"n1"];
    [data setValue:@"16" forKey:@"n2"];
    [data setValue:@"26" forKey:@"n3"];
    [data setValue:@"36" forKey:@"n4"];
    [data setValue:@"66" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"52" forKey:@"p1"];
    [data setValue:@"54" forKey:@"p2"];
    [data setValue:@"56" forKey:@"p3"];
    [data setValue:@"54" forKey:@"p4"];
    [data setValue:@"52" forKey:@"answer"];
    
    [data setValue:@"54" forKey:@"n1"];
    [data setValue:@"51" forKey:@"n2"];
    [data setValue:@"52" forKey:@"n3"];
    [data setValue:@"58" forKey:@"n4"];
    [data setValue:@"56" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"100" forKey:@"p1"];
    [data setValue:@"80" forKey:@"p2"];
    [data setValue:@"60" forKey:@"p3"];
    [data setValue:@"40" forKey:@"p4"];
    [data setValue:@"20" forKey:@"answer"];
    
    [data setValue:@"40" forKey:@"n1"];
    [data setValue:@"10" forKey:@"n2"];
    [data setValue:@"50" forKey:@"n3"];
    [data setValue:@"20" forKey:@"n4"];
    [data setValue:@"30" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"53" forKey:@"p1"];
    [data setValue:@"103" forKey:@"p2"];
    [data setValue:@"153" forKey:@"p3"];
    [data setValue:@"203" forKey:@"p4"];
    [data setValue:@"253" forKey:@"answer"];
    
    [data setValue:@"243" forKey:@"n1"];
    [data setValue:@"213" forKey:@"n2"];
    [data setValue:@"223" forKey:@"n3"];
    [data setValue:@"253" forKey:@"n4"];
    [data setValue:@"263" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"83" forKey:@"p1"];
    [data setValue:@"73" forKey:@"p2"];
    [data setValue:@"63" forKey:@"p3"];
    [data setValue:@"53" forKey:@"p4"];
    [data setValue:@"43" forKey:@"answer"];
    
    [data setValue:@"43" forKey:@"n1"];
    [data setValue:@"63" forKey:@"n2"];
    [data setValue:@"83" forKey:@"n3"];
    [data setValue:@"33" forKey:@"n4"];
    [data setValue:@"13" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"17" forKey:@"p1"];
    [data setValue:@"27" forKey:@"p2"];
    [data setValue:@"37" forKey:@"p3"];
    [data setValue:@"47" forKey:@"p4"];
    [data setValue:@"57" forKey:@"answer"];
    
    [data setValue:@"37" forKey:@"n1"];
    [data setValue:@"57" forKey:@"n2"];
    [data setValue:@"97" forKey:@"n3"];
    [data setValue:@"27" forKey:@"n4"];
    [data setValue:@"67" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"19" forKey:@"p1"];
    [data setValue:@"49" forKey:@"p2"];
    [data setValue:@"79" forKey:@"p3"];
    [data setValue:@"109" forKey:@"p4"];
    [data setValue:@"139" forKey:@"answer"];
    
    [data setValue:@"149" forKey:@"n1"];
    [data setValue:@"119" forKey:@"n2"];
    [data setValue:@"129" forKey:@"n3"];
    [data setValue:@"139" forKey:@"n4"];
    [data setValue:@"169" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"111" forKey:@"p1"];
    [data setValue:@"121" forKey:@"p2"];
    [data setValue:@"131" forKey:@"p3"];
    [data setValue:@"141" forKey:@"p4"];
    [data setValue:@"151" forKey:@"answer"];
    
    [data setValue:@"141" forKey:@"n1"];
    [data setValue:@"151" forKey:@"n2"];
    [data setValue:@"121" forKey:@"n3"];
    [data setValue:@"131" forKey:@"n4"];
    [data setValue:@"161" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"33" forKey:@"p1"];
    [data setValue:@"63" forKey:@"p2"];
    [data setValue:@"93" forKey:@"p3"];
    [data setValue:@"123" forKey:@"p4"];
    [data setValue:@"153" forKey:@"answer"];
    
    [data setValue:@"113" forKey:@"n1"];
    [data setValue:@"123" forKey:@"n2"];
    [data setValue:@"133" forKey:@"n3"];
    [data setValue:@"143" forKey:@"n4"];
    [data setValue:@"153" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"41" forKey:@"p1"];
    [data setValue:@"81" forKey:@"p2"];
    [data setValue:@"121" forKey:@"p3"];
    [data setValue:@"161" forKey:@"p4"];
    [data setValue:@"201" forKey:@"answer"];
    
    [data setValue:@"101" forKey:@"n1"];
    [data setValue:@"201" forKey:@"n2"];
    [data setValue:@"301" forKey:@"n3"];
    [data setValue:@"181" forKey:@"n4"];
    [data setValue:@"191" forKey:@"n5"];
    [dataArray addObject:data];
    
}



-(void) setChallengeArray
{
    dataArray = [[NSMutableArray alloc] init];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"113" forKey:@"p1"];
    [data setValue:@"133" forKey:@"p2"];
    [data setValue:@"153" forKey:@"p3"];
    [data setValue:@"173" forKey:@"p4"];
    [data setValue:@"193" forKey:@"answer"];
    
    [data setValue:@"193" forKey:@"n1"];
    [data setValue:@"103" forKey:@"n2"];
    [data setValue:@"113" forKey:@"n3"];
    [data setValue:@"123" forKey:@"n4"];
    [data setValue:@"133" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"127" forKey:@"p1"];
    [data setValue:@"327" forKey:@"p2"];
    [data setValue:@"527" forKey:@"p3"];
    [data setValue:@"727" forKey:@"p4"];
    [data setValue:@"927" forKey:@"answer"];
    
    [data setValue:@"927" forKey:@"n1"];
    [data setValue:@"107" forKey:@"n2"];
    [data setValue:@"327" forKey:@"n3"];
    [data setValue:@"717" forKey:@"n4"];
    [data setValue:@"972" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"167" forKey:@"p1"];
    [data setValue:@"367" forKey:@"p2"];
    [data setValue:@"567" forKey:@"p3"];
    [data setValue:@"367" forKey:@"p4"];
    [data setValue:@"167" forKey:@"answer"];
    
    [data setValue:@"97" forKey:@"n1"];
    [data setValue:@"167" forKey:@"n2"];
    [data setValue:@"267" forKey:@"n3"];
    [data setValue:@"367" forKey:@"n4"];
    [data setValue:@"667" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"521" forKey:@"p1"];
    [data setValue:@"541" forKey:@"p2"];
    [data setValue:@"561" forKey:@"p3"];
    [data setValue:@"541" forKey:@"p4"];
    [data setValue:@"521" forKey:@"answer"];
    
    [data setValue:@"541" forKey:@"n1"];
    [data setValue:@"511" forKey:@"n2"];
    [data setValue:@"521" forKey:@"n3"];
    [data setValue:@"581" forKey:@"n4"];
    [data setValue:@"561" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"100" forKey:@"p1"];
    [data setValue:@"80" forKey:@"p2"];
    [data setValue:@"60" forKey:@"p3"];
    [data setValue:@"40" forKey:@"p4"];
    [data setValue:@"20" forKey:@"answer"];
    
    [data setValue:@"40" forKey:@"n1"];
    [data setValue:@"10" forKey:@"n2"];
    [data setValue:@"50" forKey:@"n3"];
    [data setValue:@"20" forKey:@"n4"];
    [data setValue:@"30" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"53" forKey:@"p1"];
    [data setValue:@"103" forKey:@"p2"];
    [data setValue:@"153" forKey:@"p3"];
    [data setValue:@"203" forKey:@"p4"];
    [data setValue:@"253" forKey:@"answer"];
    
    [data setValue:@"243" forKey:@"n1"];
    [data setValue:@"213" forKey:@"n2"];
    [data setValue:@"223" forKey:@"n3"];
    [data setValue:@"253" forKey:@"n4"];
    [data setValue:@"263" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"283" forKey:@"p1"];
    [data setValue:@"273" forKey:@"p2"];
    [data setValue:@"263" forKey:@"p3"];
    [data setValue:@"253" forKey:@"p4"];
    [data setValue:@"243" forKey:@"answer"];
    
    [data setValue:@"243" forKey:@"n1"];
    [data setValue:@"263" forKey:@"n2"];
    [data setValue:@"283" forKey:@"n3"];
    [data setValue:@"233" forKey:@"n4"];
    [data setValue:@"213" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"417" forKey:@"p1"];
    [data setValue:@"427" forKey:@"p2"];
    [data setValue:@"437" forKey:@"p3"];
    [data setValue:@"447" forKey:@"p4"];
    [data setValue:@"457" forKey:@"answer"];
    
    [data setValue:@"437" forKey:@"n1"];
    [data setValue:@"457" forKey:@"n2"];
    [data setValue:@"497" forKey:@"n3"];
    [data setValue:@"427" forKey:@"n4"];
    [data setValue:@"467" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"19" forKey:@"p1"];
    [data setValue:@"49" forKey:@"p2"];
    [data setValue:@"79" forKey:@"p3"];
    [data setValue:@"109" forKey:@"p4"];
    [data setValue:@"139" forKey:@"answer"];
    
    [data setValue:@"149" forKey:@"n1"];
    [data setValue:@"119" forKey:@"n2"];
    [data setValue:@"129" forKey:@"n3"];
    [data setValue:@"139" forKey:@"n4"];
    [data setValue:@"169" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"111" forKey:@"p1"];
    [data setValue:@"121" forKey:@"p2"];
    [data setValue:@"131" forKey:@"p3"];
    [data setValue:@"141" forKey:@"p4"];
    [data setValue:@"151" forKey:@"answer"];
    
    [data setValue:@"141" forKey:@"n1"];
    [data setValue:@"151" forKey:@"n2"];
    [data setValue:@"121" forKey:@"n3"];
    [data setValue:@"131" forKey:@"n4"];
    [data setValue:@"161" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"33" forKey:@"p1"];
    [data setValue:@"63" forKey:@"p2"];
    [data setValue:@"93" forKey:@"p3"];
    [data setValue:@"123" forKey:@"p4"];
    [data setValue:@"153" forKey:@"answer"];
    
    [data setValue:@"113" forKey:@"n1"];
    [data setValue:@"123" forKey:@"n2"];
    [data setValue:@"133" forKey:@"n3"];
    [data setValue:@"143" forKey:@"n4"];
    [data setValue:@"153" forKey:@"n5"];
    [dataArray addObject:data];
    
    
    
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"41" forKey:@"p1"];
    [data setValue:@"81" forKey:@"p2"];
    [data setValue:@"121" forKey:@"p3"];
    [data setValue:@"161" forKey:@"p4"];
    [data setValue:@"201" forKey:@"answer"];
    
    [data setValue:@"101" forKey:@"n1"];
    [data setValue:@"201" forKey:@"n2"];
    [data setValue:@"301" forKey:@"n3"];
    [data setValue:@"181" forKey:@"n4"];
    [data setValue:@"191" forKey:@"n5"];
    [dataArray addObject:data];
    
}


-(void) showFailAlert
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Failed"
                                                                   message:[NSString stringWithFormat:@"You failed to find next number"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) showFailAlertFinal
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Failed"
                                                                   message:[NSString stringWithFormat:@"You have failed to Score 500. Your score is %d", score]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) showFailAlertAttempt
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Failed"
                                                                   message:[NSString stringWithFormat:@"You failed to find next number"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self setScreen];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) showPassedAlert
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Congratulations"
                                                                   message:[NSString stringWithFormat:@"You found the next number"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Next" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self setScreen];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) showPassedAlertFinal
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Congratulations"
                                                                   message:[NSString stringWithFormat:@"You Score is : %d", score]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}





- (void)showCorrectAnswer
{
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    
    [alert addButton:@"Fill The Next Miss" actionBlock:^(void) {
        [self setScreen];
    }];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [NSBundle mainBundle].resourcePath]];
    
    [alert showSuccess:@"Correct Answer" subTitle:@"You successfully filled the miss" closeButtonTitle:nil duration:0.0f];
}

- (void)showWin
{
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    
    [alert addButton:@"Fill The Miss Again" actionBlock:^(void) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [NSBundle mainBundle].resourcePath]];
    
    [alert showSuccess:kSuccessTitle subTitle:@"You successfully filled all the misses" closeButtonTitle:nil duration:0.0f];
}


- (void)showWrongAnswer
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    
    [alert addButton:@"Try Again" actionBlock:^(void) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alert showError:self title:@"You Miss the Fill"
            subTitle:@"You tried to fill the wrong miss"
    closeButtonTitle:nil duration:0.0f];
}




@end
