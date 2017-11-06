//
//  ViewController.m
//  KitRecord3
//
//  Created by Duncan Frost on 04/11/2017.
//  Copyright © 2017 Duncan Frost. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) IBOutlet ARSCNView *sceneView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _arSessionConfiguration = [ARWorldTrackingConfiguration new];
    _arSessionConfiguration.worldAlignment = ARWorldAlignmentGravity;
    _arSession = [ARSession new];
    
    
    
    NSLog(@"Starting to send this puppy to");
    
    ARFrame *frame = _arSession.currentFrame;
    ARCamera *camera = frame.camera;
    
    
    matrix_float4x4 transformMatrix = self.arSession.currentFrame.camera.transform;
    
    
    float data[16];
    
    int count = 0;
    for (int c = 0; c < 4; c++) {
        simd_float4 col = transformMatrix.columns[c];
        for (int r = 0; r < 4; r++) {
            data[count] = col[r];
            count++;
        }
    }
    
    matrix_float4x4 t = self.arSession.currentFrame.camera.transform;
    for (int r = 0; r < 4; r++)
      NSLog(@"%f %f %f %f \n", t.columns[0][r], t.columns[1][r], t.columns[2][r], t.columns[3][r]);
    
    
    
    
    // _arCamera = [ARCamera new];ss
    
    // Set the view's delegate
    self.sceneView.delegate = self;
    // Show statistics such as fps and timing information
    self.sceneView.showsStatistics = YES;
    
    // Create a new scesne
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
    
    // Set the scene to the view
    self.sceneView.scene = scene;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    
    // Run the view's session
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.sceneView.session pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - ARSCNViewDelegate

/*
// Override to create and configure nodes for anchors added to the view's session.
- (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
    SCNNode *node = [SCNNode new];
 
    // Add geometry to the node...
 
    return node;
}
*/

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}

@end
