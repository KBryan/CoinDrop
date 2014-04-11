//
//  TEIViewController.m
//  Hackathon
//
//  Created by Kwame Bryan on 2014-04-10.
//  Copyright (c) 2014 Kwame Bryan. All rights reserved.
//

#import "TEIViewController.h"

@interface TEIViewController ()
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *countdownLabel;

@end

@implementation TEIViewController

#define CLIENTID b590e0f25dc63f4bc10a8370df0377c010876543932bf9fc957702b6df8900f4
#define CLIENTSECRET 9519479abbaa6095e730ac33f195ec70156f42b5e63affb5ea5a28565da026b4
int counter;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    counter = 10;
    //[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
}
-(void)determineOAUTH{
   // NSString  *launchURL = @""
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getPrice
{
    NSURL *url = [NSURL URLWithString:@"https://coinbase.com/api/v1/prices/spot_rate/"];
    NSURLRequest *request  = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
        if(error == nil)
        {
            NSDictionary *spotPrice
            = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            self.priceLabel.text = [[[spotPrice objectForKey:@"amount"] stringByAppendingString:@" "]stringByAppendingString:[spotPrice objectForKey:@"currency"]];
        }
     }];
}
-(void)countdown {
    counter--;
    self.countdownLabel.text = [NSString stringWithFormat:@"%d", counter];
    if(counter == 0)
    {
        counter = 15;
        [self getPrice];
    }
}
//Creat your Google APP here: https://code.google.com/apis/console/ and get the key and secret

#define GoogleClientID    @"YOUR CLIENT ID"
#define GoogleClientSecret @"YOUR CLIENT SECRET"
#define GoogleAuthURL   @"https://accounts.google.com/o/oauth2/auth"
#define GoogleTokenURL  @"https://accounts.google.com/o/oauth2/token"


/*- (GTMOAuth2Authentication * )authForGoogle
{
    //This URL is defined by the individual 3rd party APIs, be sure to read their documentation
    
    NSURL * tokenURL = [NSURL URLWithString:GoogleTokenURL];
    // We'll make up an arbitrary redirectURI.  The controller will watch for
    // the server to redirect the web view to this URI, but this URI will not be
    // loaded, so it need not be for any actual web page. This needs to match the URI set as the
    // redirect URI when configuring the app with Instagram.
    NSString * redirectURI = @"urn:ietf:wg:oauth:2.0:oob";
    GTMOAuth2Authentication * auth;
    
    auth = [GTMOAuth2Authentication authenticationWithServiceProvider:@"lifebeat"
                                                             tokenURL:tokenURL
                                                          redirectURI:redirectURI
                                                             clientID:GoogleClientID
                                                         clientSecret:GoogleClientSecret];
    auth.scope = @"https://www.googleapis.com/auth/userinfo.profile";
    return auth;
}


- (void)signInToGoogle
{
    GTMOAuth2Authentication * auth = [self authForGoogle];
    
    // Display the authentication view
    GTMOAuth2ViewControllerTouch * viewController = [[GTMOAuth2ViewControllerTouch alloc] initWithAuthentication:auth
                                                                                                authorizationURL:[NSURL URLWithString:GoogleAuthURL]
                                                                                                keychainItemName:@"GoogleKeychainName"
                                                                                                        delegate:self
                                                                                                finishedSelector:@selector(viewController:finishedWithAuth:error:)];
    [self.navigationController pushViewController:viewController animated:YES];
}


- (void)viewController:(GTMOAuth2ViewControllerTouch * )viewController
      finishedWithAuth:(GTMOAuth2Authentication * )auth
                 error:(NSError * )error
{
    NSLog(@"finished");
    NSLog(@"auth access token: %@", auth.accessToken);
    
    [self.navigationController popToViewController:self animated:NO];
    if (error != nil) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error Authorizing with Google"
                                                         message:[error localizedDescription]
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert show];
    } else {
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Success Authorizing with Google"
                                                         message:[error localizedDescription]
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert show];
    }
}*/
@end
