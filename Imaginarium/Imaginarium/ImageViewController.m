//
//  ImageViewController.m
//  Imaginarium
//
//  Created by Deep Sidhpura on 6/12/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate,UISplitViewControllerDelegate>
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UIImage * image;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation ImageViewController

-(void) setImageUrl:(NSURL *)imageUrl{
    
    _imageUrl=imageUrl;
    //self.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageUrl]];
    [self startDownloadingImage];
}



-(void) startDownloadingImage{
    
    self.image=nil;
    if (self.imageUrl) {
        [self.spinner startAnimating];
        NSURLRequest *request=[NSURLRequest requestWithURL:self.imageUrl];
        NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session=[NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *task=[session downloadTaskWithRequest:request
                                                      completionHandler:^(NSURL *localfile, NSURLResponse *response, NSError *error) {
                                                          if (!error) {
                                                              if ([request.URL isEqual:self.imageUrl]) { // we check this because request url might change if the user while ongoing clicks on some other url,it taking time
                                                                  
                                                                  UIImage* image=[UIImage imageWithData:[NSData dataWithContentsOfURL:localfile]];
                                                                  //this is not happeneing in main queue
                                                                 // self.image=image; // this one line will happen on main thread so...
                                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                                      self.image=image;
                                                                  });
                                                              }
                                                          }
        }];
        [task resume];
    }
}

#pragma mark -UISplitViewControllerDelegate

-(void) awakeFromNib{
    
    self.splitViewController.delegate=self;
}

-(BOOL) splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation{
    
    return UIInterfaceOrientationIsPortrait(orientation);
}

-(void) splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc{
    
    barButtonItem.title=aViewController.title; // Setting it equal to master's title.
    self.navigationItem.leftBarButtonItem=barButtonItem;
}

-(void) splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    self.navigationItem.leftBarButtonItem=nil;
}








-(void)setScrollView:(UIScrollView *)scrollView{  //We are doing this because there is a chance when segway is called,the outlets might not be set. Thus scrollView object in setImage might be empty when called.
    _scrollView=scrollView;
    _scrollView.minimumZoomScale=0.2;
    _scrollView.maximumZoomScale=2.0;
    _scrollView.delegate=self; // We have to include the delegate
    self.scrollView.contentSize=self.image ? self.image.size : CGSizeZero;
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.imageView;
}

-(UIImageView *)imageView{
    
    if(!_imageView) _imageView=[[UIImageView alloc] init];
    return _imageView;
}

-(UIImage *)image{
    
    return self.imageView.image;
}

-(void)setImage:(UIImage *)image{
    
    self.scrollView.zoomScale=1.0;
    
    self.imageView.image=image;
        //Specially creating setter and getter because we want to implement more functions when we set our image like sizToFit here.No synthesize needed because we are not using an instance variable(_Var)
    self.imageView.frame=CGRectMake(0, 0, image.size.width, image.size.height);
    self.scrollView.contentSize=self.image ? self.image.size : CGSizeZero;
    [self.spinner stopAnimating];
}

-(void) viewDidLoad{
    
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
}

@end
