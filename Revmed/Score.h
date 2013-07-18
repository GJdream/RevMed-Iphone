//
//  Score.h
//  Revmed
//
//  Created by Nader on 5/22/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject

@property (nonatomic) int _id;
@property (nonatomic, strong) NSString *pseudo;
@property (nonatomic) float score;
@property (nonatomic, strong) NSString *date;
@property (nonatomic) int objectiveId;

@end
