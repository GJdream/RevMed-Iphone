//
//  Choice.h
//  Revmed
//
//  Created by Nader on 5/22/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Choice : NSObject

@property (nonatomic) int _id;
@property (nonatomic, strong) NSString *choice;
@property (nonatomic) int questionId;
@property (nonatomic) int state;
@property (nonatomic) BOOL isSelected;
@end
