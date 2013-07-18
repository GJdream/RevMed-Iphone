//
//  Question.h
//  Revmed
//
//  Created by Nader on 5/21/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *question;
@property (nonatomic) int objectiveId;
@property (nonatomic) int _id;
@property (nonatomic, strong) NSString *revision;

@end
