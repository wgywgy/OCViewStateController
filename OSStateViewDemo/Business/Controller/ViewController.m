//
//  ViewController.m
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import "ViewController.h"

#import "DELoadingView.h"
#import "DEErrorView.h"
#import "DEEmptyView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) UIRefreshControl *refreshControl;
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)setupViews {
    self.dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self.tableView addSubview:self.refreshControl];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"textCell"];
    
    self.loadingView = [[DELoadingView alloc]initWithFrame:self.view.frame];
    self.emptyView = [[DEEmptyView alloc]initWithFrame:self.view.frame];
    self.errorView = [[DEErrorView alloc]initWithFrame:self.view.frame];
    [((DEErrorView *)self.errorView).tapGes addTarget:self action:@selector(refresh)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupInitialViewState];
    [self refresh];
}

#pragma mark - Content State
- (BOOL)hasContent {
    return self.dataArray.count;
}

- (void)handleErrorWhenContentAvailable {
    NSLog(@"有内容错误");
}

#pragma mark - Action
- (void)refresh {
    [self startLoading];
    
    // Fake network call
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.dataArray = @[@"1", @"2",@"3", @"4"].mutableCopy;
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
        
//        [self endLoadingWithError:nil];
        [self endLoadingWithError:[NSError errorWithDomain:@"ex" code:10 userInfo:nil]];
    });
}

#pragma mark - Getter
- (UIRefreshControl *)refreshControl {
    if (!_refreshControl) {
        _refreshControl = [[UIRefreshControl alloc] init];
        [_refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    }
    return _refreshControl;
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

@end
