//
//  TweetsTodayTableViewCell.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/23/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetsTodayTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *customCellTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *numbersLabel;

@end
