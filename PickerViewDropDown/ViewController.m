//
//  ViewController.m
//  PickerViewDropDown
//
//  Created by Mahaboobsab Nadaf on 21/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#define kCountryComponent 0
#define kPlayerComponent   1
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSDictionary *iccCountryies;
@property (strong, nonatomic) NSArray *sortedPlayer;
@property (strong, nonatomic) NSArray *playerNames;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"myPList"
                               withExtension:@"plist"];
    self.iccCountryies = [NSDictionary
                      dictionaryWithContentsOfURL:plistURL];
    NSArray *allCountry = [self.iccCountryies allKeys];
    NSArray *sortedCountryies = [allCountry sortedArrayUsingSelector:
                             @selector(compare:)];
    
    self.sortedPlayer = sortedCountryies;
    NSString *selectedState = self.sortedPlayer[0];
    self.playerNames = self.iccCountryies[selectedState];
    
    self.iccCountryies = [NSDictionary dictionaryWithContentsOfURL:plistURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == kCountryComponent) {
        return [self.sortedPlayer count];
    } else {
        return [self.playerNames count];
    }
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == kCountryComponent) {
        return self.sortedPlayer[row];
    } else {
        return self.playerNames[row];
    }
    
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    if (component == kCountryComponent) {
        NSString *selectedState = self.sortedPlayer[row];
        self.playerNames = self.iccCountryies[selectedState];
        [self.pickerView reloadComponent:kPlayerComponent];
        [self.pickerView selectRow:0
         
         
                       inComponent:kPlayerComponent
                          animated:YES];
    }
    
    NSInteger countryRow = [self.pickerView
                          selectedRowInComponent:kCountryComponent];
    NSInteger playerRow = [self.pickerView
                           selectedRowInComponent:kPlayerComponent];
    NSString *country = self.sortedPlayer[countryRow];
    NSString *player = self.playerNames[playerRow];
    
    NSString *imageName = [NSString stringWithFormat:@"%@%@.jpg",country,player];
    NSLog(@"Image Name : %@",imageName);
    
    self.imageView.image = [UIImage imageNamed:imageName];
    
    self.countryImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",country]];
}
@end
