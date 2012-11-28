//
//  CalendarAddViewController.h
//  CalendarAdd
//
//  Created by AgileThought on 11/27/12.
//  Copyright (c) 2012 AgileThought. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>


@interface CalendarAddViewController : UIViewController<EKEventEditViewDelegate>

- (IBAction)addCalendarEntry:(id)sender;


@end
