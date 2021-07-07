//
//  ViewController.m
//  DemoUIFontPickerVC_iOS_13
//
//  Created by Do Trinh on 2021/07/07.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIFontPickerViewController *uiFontVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    uiFontVC = [[UIFontPickerViewController alloc] init];
    NSArray *yourArray =  UIFont.familyNames;
    uiFontVC.delegate = self;
    for (int i = 0; i < yourArray.count; i++) {
        NSLog(@"%@", yourArray[i]);
    }
}

- (IBAction)showList:(id)sender {
    NSLog(@"Showed");

    [self presentViewController:uiFontVC animated:YES completion:nil];
}

- (void)fontPickerViewControllerDidPickFont:(UIFontPickerViewController *)viewController
{
    UIFontDescriptor *selectedFontDescriptor = viewController.selectedFontDescriptor;
    NSLog(@"selected: %@",selectedFontDescriptor.postscriptName);
}
@end
