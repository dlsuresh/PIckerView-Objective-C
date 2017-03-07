//
//  ViewController.m
//  PickerView
//
//  Created by Suresh on 2/15/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *pickerData1;
    NSArray *pickerData2;

}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    pickerData1 = @[@"picker 1",@"picker 2",@"picker 3"];
    pickerData2 = @[@"picker 3",@"picker 1",@"picker 2",@"picker 4"];
    self.pickerView1.hidden = YES;
    self.txtField1.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 1) {
        return pickerData1.count;
    }else
        return pickerData2.count;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 1) {
        [self.txtField2 setText:[pickerData1 objectAtIndex:row]];
    }else
    [self.txtField1 setText:[pickerData2 objectAtIndex:row]];
    
    if (self.txtField1.text == self.txtField2.text) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Both are same" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}



-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 1) {
        return [pickerData1 objectAtIndex:row];

    }else
    return [pickerData2 objectAtIndex:row];
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    self.pickerView1.hidden = NO;
    [textField resignFirstResponder];
    
    return YES;
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//        self.pickerView1.hidden = YES;
//    
//    
//}

-(void)dismissKeyboard{
    [self.txtField1 resignFirstResponder];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



@end
