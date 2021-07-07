//
//  ViewController.m
//  DemoUIFontPickerVC_iOS_13
//
//  Created by Do Trinh on 2021/07/07.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *realtimeSelect;

@end

@implementation ViewController

UIFontPickerViewController *uiFontVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    uiFontVC = [[UIFontPickerViewController alloc] init];
    uiFontVC.delegate = self;
//    NSArray *yourArray =  UIFont.familyNames;
//    for (int i = 0; i < yourArray.count; i++) {
//        NSLog(@"%@", yourArray[i]);
//    }
    for (NSString *family in [UIFont familyNames]) {
        NSLog(@"%@", family);
        for (NSString *name in [UIFont fontNamesForFamilyName:family]) {
            NSLog(@"\t%@", name);
        }
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
    _realtimeSelect.text = selectedFontDescriptor.postscriptName;
}
@end
