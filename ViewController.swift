//
//  ViewController.swift
//  Gumasta
//
//  Created by Sampath Kumar Kunta on 3/10/15.
//  Copyright (c) 2015 Kent State University. All rights reserved.
//

import UIKit
import AddressBook
import MediaPlayer
import AssetsLibrary
import CoreLocation
import CoreMotion

class ViewController: UIViewController, GPPSignInDelegate {
    
    let kClientId = "810455911760-rbovr6t789jl7nacr73ggm41vtc9ohv3.apps.googleusercontent.com"
    let kGTLAuthScopePlusLogin = "https://www.googleapis.com/auth/plus.login"
    var signIn: GPPSignIn?
    @IBOutlet var signInButton : GPPSignInButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Configure Google Login
        signIn = GPPSignIn.sharedInstance()
        signIn?.shouldFetchGooglePlusUser = true
        signIn?.shouldFetchGoogleUserEmail = true
        signIn?.clientID = kClientId
        signIn?.scopes = [kGTLAuthScopePlusLogin]
        signIn?.scopes = ["profile"]
        signIn?.delegate = self
        signIn?.trySilentAuthentication()
//        signIn?.authenticate()
    }
    
    func refreshInterfaceBasedOnSignIn()
    {
        if (GPPSignIn.sharedInstance().authentication != nil)
        {
            self.signInButton!.hidden = true
        }
        else {
            self.signInButton!.hidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        println("Recieved error \(error) and auth object \(auth)")
        if (error != nil)
        {
            
            
        } else {
            self.refreshInterfaceBasedOnSignIn()
            println("Successfully logged in")
            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("HomeVC") as HomeViewController
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
    }
    

    
    func didDisconnectWithError(error: NSError!) {
        
    }


}

