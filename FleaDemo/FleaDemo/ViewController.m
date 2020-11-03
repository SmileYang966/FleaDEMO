//
//  ViewController.m
//  FleaDemo
//
//  Created by EVAN YANG on 2020/11/2.
//

#import "ViewController.h"
#import "Masonry/Masonry.h"
#import "SCFleaMenuView.h"
#import "TitleViewController.h"

@interface ViewController ()

@property(nonatomic,strong)SCFleaMenuView *menuView;

@end

@implementation ViewController

- (SCFleaMenuView *)menuView{
    if (_menuView == nil) {
        _menuView = [[SCFleaMenuView alloc]init];
        [self.view addSubview:_menuView];
        [_menuView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(80);
            make.height.mas_equalTo(50);
        }];
        _menuView.backgroundColor = UIColor.blueColor;
    }
    return _menuView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self menuView];
    
    UIButton *clickButton = [[UIButton alloc]init];
    [self.view addSubview:clickButton];
    [clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(200);
        make.width.height.mas_equalTo(80);
    }];
    clickButton.backgroundColor = UIColor.redColor;
    [clickButton addTarget:self action:@selector(redButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)redButtonClicked:(UIButton *)button{
    TitleViewController *titleVC = [[TitleViewController alloc]init];
    [self.navigationController pushViewController:titleVC animated:YES];
}


@end
