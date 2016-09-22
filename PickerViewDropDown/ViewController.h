//
//  ViewController.h
//  PickerViewDropDown
//
//  Created by Mahaboobsab Nadaf on 21/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *countryImage;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

