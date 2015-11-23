//
//  ViewController.h
//  WeatherLibrary
//
//  Created by ME-Tech MacPro User 2 on 11/20/15.
//  Copyright © 2015 iTrain Asia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

