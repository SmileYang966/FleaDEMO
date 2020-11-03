//
//  TitleViewController.m
//  FleaDemo
//
//  Created by EVAN YANG on 2020/11/3.
//

#import "TitleViewController.h"
#import "JXCategoryTitleView.h"
#import "JXCategoryIndicatorLineView.h"
#import "JXCategoryListContainerView.h"
#import "ListViewController.h"

@interface TitleViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation TitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.categoryView = [[JXCategoryTitleView alloc]initWithFrame:CGRectMake(0,60,UIScreen.mainScreen.bounds.size.width,50)];
    self.categoryView.delegate = self;
    self.categoryView.listContainer = self.listContainerView;
    
    [self.view addSubview:self.categoryView];
    self.titles = @[@"螃蟹", @"麻辣小龙虾", @"苹果",@"详情",@"香蕉",@"股票",@"螃蟹", @"麻辣小龙虾", @"苹果",@"详情",@"香蕉",@"股票"];
    self.categoryView.titles = self.titles;
    self.categoryView.titleColorGradientEnabled = YES;
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = [UIColor redColor];
    lineView.indicatorWidth = 20;
    self.categoryView.indicators = @[lineView];
}

- (JXCategoryListContainerView *)listContainerView{
    if (_listContainerView == nil) {
        _listContainerView = [[JXCategoryListContainerView alloc]initWithType:JXCategoryListContainerType_ScrollView delegate:self];
        [self.view addSubview:self.listContainerView];
    }
    return _listContainerView;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.listContainerView.frame = CGRectMake(0,110,self.view.bounds.size.width, self.view.bounds.size.height-110);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // 处于第一个item的时候，才允许屏幕边缘手势返回
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    // 离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

// 点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index{
    NSLog(@"index is %ld",index);
    NSLog(@"---%@----",self.listContainerView.validListDict);
    
    ListViewController *vc = (ListViewController *)self.listContainerView.validListDict[@(index)];
    vc.itemIndex = index;
    NSLog(@"vc is %@\n",vc);
}

// 点击选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index{
    
}

// 滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index{
    
}

// 正在滚动中的回调
- (void)categoryView:(JXCategoryBaseView *)categoryView scrollingFromLeftIndex:(NSInteger)leftIndex toRightIndex:(NSInteger)rightIndex ratio:(CGFloat)ratio{
    
}


// 返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

// 返回各个列表菜单下的实例，该实例需要遵守并实现 <JXCategoryListContentViewDelegate> 协议
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    ListViewController *list = [[ListViewController alloc] init];
    return list;
}


#pragma mark - Public

- (JXCategoryBaseView *)preferredCategoryView {
    return [[JXCategoryBaseView alloc] init];
}

- (CGFloat)preferredCategoryViewHeight {
    return 50;
}

@end
