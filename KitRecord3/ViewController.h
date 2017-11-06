//
//  ViewController.h
//  KitRecord3
//
//  Created by Duncan Frost on 04/11/2017.
//  Copyright © 2017 Duncan Frost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) ARWorldTrackingConfiguration *arSessionConfiguration;
@property (nonatomic, strong) ARSession *arSession;
@property (weak, nonatomic) IBOutlet UITextField *tbOut;

@end
