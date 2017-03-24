//
//  Service.swift
//  ContactsGoJek
//
//  Created by Ankit on 24/03/17.
//  Copyright © 2017 Ankit. All rights reserved.
//

import UIKit
import Alamofire

class Service: NSObject {
    
    var serviceType : ServiceType?
    var subServiveType : SubServiceType?
    
    var parameters : [String:AnyObject]?
    var method : HTTPMethod = .get    
    var outPutResponse : AnyObject?
    var errorMessage : AnyObject?
    var errorCode : Int!
    var failedCount = 0
    var finalURL : String!
    var responderDelegate: NetworkWrapperProtocol?
    
    init(method : HTTPMethod, serviceType : ServiceType, subServiveType : SubServiceType, parameters : [String:AnyObject]?) {
        
        self.serviceType = serviceType
        self.subServiveType = subServiveType
        self.parameters = parameters
        self.method = method
        
        super.init()
        
        constructFinalUrl()
        
        
    }
    private func constructFinalUrl(){
        
        switch subServiveType{
            
        default:
            if let serviceType = serviceType{
                if let subServiveType = subServiveType{
                    self.finalURL = "\(serviceType.rawValue)\(subServiveType.rawValue)"
                }
            }
        }
    }
    
    
}
