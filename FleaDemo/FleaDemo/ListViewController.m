//
//  ListViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/8.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "ListViewController.h"
#import "Masonry/Masonry.h"
#define MARGINX 20
#define MARGINSPACING 10

#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R green:G blue:B alpha:A]

@interface ListViewController()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation ListViewController

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        CGFloat width = (UIScreen.mainScreen.bounds.size.width-2*MARGINX-MARGINSPACING)*0.5;
        CGFloat height = width * 1.5f;
        layout.itemSize = CGSizeMake(width,height);
        layout.sectionInset = UIEdgeInsetsMake(0,MARGINX,0,MARGINX);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
            make.height.mas_equalTo(self.view.bounds.size.height-64-50);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.contentInset = UIEdgeInsetsMake(MARGINSPACING,0,MARGINSPACING,0);
        
        //注册cell
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ReuseCell"];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景颜色：随机色
    self.collectionView.backgroundColor = COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
}

#pragma mark - JXCategoryListContentViewDelegate

/**
 实现 <JXCategoryListContentViewDelegate> 协议方法，返回该视图控制器所拥有的「视图」
 */
- (UIView *)listView {
    return self.view;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReuseCell" forIndexPath:indexPath];
    cell.backgroundColor = UIColor.yellowColor;
    return cell;
}


- (void)setItemIndex:(NSInteger)itemIndex{
    _itemIndex = itemIndex;
    
}

@end
