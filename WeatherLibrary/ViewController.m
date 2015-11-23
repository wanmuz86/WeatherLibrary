//
//  ViewController.m
//  WeatherLibrary
//
//  Created by ME-Tech MacPro User 2 on 11/20/15.
//  Copyright © 2015 iTrain Asia. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <SDWebImage/UIImageView+WebCache.h>


@interface ViewController ()
@property (nonatomic,strong) NSArray *weatherArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=2de143494c0b295cca9337e1e96b00e0" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.weatherArray = responseObject[@"list"];
        [self.tableView reloadData];
        
        
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"Error: %@", error);
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.weatherArray[indexPath.row][@"weather"][0][@"main"];
    cell.detailTextLabel.text = self.weatherArray[indexPath.row][@"weather"][0][@"description"];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", self.weatherArray[indexPath.row][@"weather"][0][@"icon"]]]
                      placeholderImage:[UIImage imageNamed:@"home.jpg"]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.weatherArray count];
}
@end
