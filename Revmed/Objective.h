//
//  Objective.h
//  Revmed
//
//  Created by Nader on 5/19/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Speciality.h"
@interface Objective : NSObject

@property (nonatomic)int _id;
@property (nonatomic)int spec_id;
@property (nonatomic, strong)NSString *objective;

@end
