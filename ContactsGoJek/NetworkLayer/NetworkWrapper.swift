//
//  NetworkWrapper.swift
//  ContactsGoJek
//
//  Created by Ankit on 24/03/17.
//  Copyright © 2017 Ankit. All rights reserved.
//

import UIKit
import Alamofire

protocol NetworkWrapperProtocol : class {
    func serviceFinishedSucessfully(service : Service)
    func serivceFinishedWithError(service : Service)
}

class NetworkWrapper: NSObject {
    
    var headers : [String:String] = [:]
    var activeRequest : [Request] = []
    
    func serverCall(service : Service){
        
        print("server call with API url :: \(service.finalURL)")
        print("parameters \(service.parameters)")
        
        
        let currentRequest = Alamofire.request(service.finalURL, method: service.method, parameters: service.parameters, encoding: URLEncoding.httpBody)
            
            currentRequest.responseJSON { response in
                
                self.recievedServerResponse(service: service, response: response)
                
            }
    }

    
    func recievedServerResponse(service : Service , response :DataResponse<Any>){
        print("response from : \(response.response)")
        
        switch response.result {
        case .success:
            
            service.failedCount = 0
            
            if service.responderDelegate != nil{
                if let statusCode = response.response?.statusCode{
                    if statusCode >= 400 {
                        service.errorMessage = response.result.value as AnyObject?
                        service.errorCode = response.response?.statusCode
                        service.responderDelegate!.serivceFinishedWithError(service: service)
                        
                    }else{
                        service.outPutResponse = response.result.value as AnyObject?
                        service.responderDelegate!.serviceFinishedSucessfully(service: service)
                    }
                    
                }
                
            }
            
            break;
            
        case .failure:
            service.errorMessage = response.result.value as AnyObject?
            service.errorCode = response.response?.statusCode
            
            if service.responderDelegate != nil{
                service.responderDelegate!.serivceFinishedWithError(service: service)
            }
            break;
        }
        
    }
    
    
}
