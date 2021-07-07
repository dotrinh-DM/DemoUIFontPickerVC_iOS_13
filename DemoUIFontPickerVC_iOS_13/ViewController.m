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
    
    /**
     After selecting font in UIFontPickerViewController list,
     then [UIFont familyNames] will get installed fonts from other apps.
     
     If we kill app and open app again, selected font remains unchanged.
     
     Why do I call getFontList? Because I want to check before | after of [UIFont familyNames] method
     */
    [self getFontList];

}

- (IBAction)showList:(id)sender {
    NSLog(@"Showed");

    [self presentViewController:uiFontVC animated:YES completion:nil];
}

- (IBAction)refreshFontList:(id)sender {
    [self getFontList];
}

-(void) getFontList {
    for (NSString *family in [UIFont familyNames]) {
        NSLog(@"%@", family);
        for (NSString *name in [UIFont fontNamesForFamilyName:family]) {
            NSLog(@"\t%@", name);
        }
    }
}

- (void)fontPickerViewControllerDidPickFont:(UIFontPickerViewController *)viewController
{
    UIFontDescriptor *selectedFontDescriptor = viewController.selectedFontDescriptor;
    NSLog(@"selected: %@",selectedFontDescriptor.postscriptName);
    _realtimeSelect.text = selectedFontDescriptor.postscriptName;
    [_realtimeSelect setFont:[UIFont fontWithName:selectedFontDescriptor.postscriptName size:25]];
}
@end
