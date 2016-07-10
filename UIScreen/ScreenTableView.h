//
//  ScreenTableView.h
//  UIScreen
//
//  Created by KSHRD on 7/3/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenTableView :  UITableViewController	<UITableViewDataSource, UITableViewDelegate,
UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) IBOutlet UITableView *tvController;
@property (nonatomic, strong) UISearchController * searchController;
@property (nonatomic, strong) NSMutableArray * filteredItems;
@property (nonatomic, weak) NSArray * displayedItems;


@end
