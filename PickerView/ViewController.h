//
//  ViewController.h
//  PickerView
//
//  Created by Suresh on 2/15/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView1;
@property (strong, nonatomic) IBOutlet UITextField *txtField2;
@property (strong, nonatomic) IBOutlet UITextField *txtField1;


@end

