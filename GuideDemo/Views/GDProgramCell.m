//
//  GDProgramCell.m
//  GuideDemo
//
//  Created by Mamnun Bhuiyan on 28/01/2014.
//  Copyright (c) 2014 Mamnun. All rights reserved.
//

#import "GDProgramCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation GDProgramCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)configureWithProgram:(Program*)program{
    self.ratingLabel.layer.cornerRadius = 5;
    self.nameLabel.text = program.name;
    self.ratingLabel.text = program.rating;
    self.channelLabel.text = program.channel;
    self.timeLabel.text = [NSString stringWithFormat:@"%@ %@", program.startTime, program.endTime];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
