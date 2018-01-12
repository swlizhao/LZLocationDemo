

#import "ViewController.h"
#import "LZLocation.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //请在真机上运行
    __weak typeof(self)weakSelf = self;
    [[LZLocation getLocation]lzConfig];//基础配置
    [[LZLocation getLocation]startGetLocationResult:^(BOOL isLocation, NSString *country, NSString *province, NSString *city, NSString *area, NSString *address, NSString *nearlyPlace) {
        if (!isLocation) {
            NSLog(@"没有打开定位服务");
        }else {
            NSString * contentString;
            contentString = [NSString stringWithFormat:@"%@%@%@%@%@%@",country,province,city,area,address,nearlyPlace];
            weakSelf.label.text = contentString;
        }
    } ];
}

- (void)dealloc {
    
}


@end
