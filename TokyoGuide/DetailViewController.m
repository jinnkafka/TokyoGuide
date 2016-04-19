//
//  DetailViewController.m
//  TokyoGuide
//
//  Created by Chen Jin on 4/21/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIWebViewDelegate>



@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myIndicator;

@end

@implementation DetailViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *name = self.place[@"name"];
    self.navigationItem.title = name;
    //webview
    NSURL *url = [NSURL URLWithString:self.place[@"website"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.myWebView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.myIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.myIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
        [self.myIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
