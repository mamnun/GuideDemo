//
//  GDProgramCell.h
//  GuideDemo
//
//  Created by Mamnun Bhuiyan on 28/01/2014.
//  Copyright (c) 2014 Mamnun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Program.h"

@interface GDProgramCell : UITableViewCell


@property(nonatomic, strong) IBOutlet UILabel *nameLabel;
@property(nonatomic, strong) IBOutlet UILabel *channelLabel;
@property(nonatomic, strong) IBOutlet UILabel *ratingLabel;
@property(nonatomic, strong) IBOutlet UILabel *timeLabel;

- (void)configureWithProgram:(Program*)program;
@end
