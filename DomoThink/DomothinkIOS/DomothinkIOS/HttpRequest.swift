//
//  HttpRequest.swift
//  
//
//  Created by Guillaume Wehrling on 14/03/2016.
//
//

import UIKit

class HttpRequest: NSObject {
    
    private var request1: NSMutableURLRequest!
    
    func getRequest(urlPath: String) -> NSMutableArray {
        var url: NSURL = NSURL(string: urlPath)!
        request1 = NSMutableURLRequest(URL:  url)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
        var err: NSError?
        var jsonResult: NSMutableArray = (NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSMutableArray)!
        return jsonResult
        //println("Synchronous\(jsonResult)")
    }
    
    func postRequest(urlPath: String, body: AnyObject) -> NSDictionary {
        var url: NSURL = NSURL(string: urlPath)!
        request1 = NSMutableURLRequest(URL:  url)
        //var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        var response: NSURLResponse?
        var code: Int!
        var jsonResult: NSDictionary!
        
        request1.HTTPMethod = "POST"
        //let options = prettyPrinted ? NSJSONWritingOptions.PrettyPrinted : NSJSONWritingOptions(rawValue: 0)
        let data = NSJSONSerialization.dataWithJSONObject(body, options: nil, error: nil)
        //let data = body.dataUsingEncoding(NSUTF8StringEncoding)
        println(data)
        request1.HTTPBody = data
        request1.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: &response, error:nil)!
        var err: NSError?
        println("--------------------")
        if let httpResponse = response as? NSHTTPURLResponse {
            code = httpResponse.statusCode
            println("error \(code)")
        }
        println("--------------------")
        if (code == 200) {
            jsonResult = (NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary)!
        } else {
            jsonResult = [
                "error": 400
            ]
        }
        println("Synchronous\(jsonResult)")
        return jsonResult
        
    }
    
    func putRequest(urlPath: String, body: AnyObject) {
        var url: NSURL = NSURL(string: urlPath)!
        request1 = NSMutableURLRequest(URL:  url)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        
        request1.HTTPMethod = "PUT"
        let data = NSJSONSerialization.dataWithJSONObject(body, options: nil, error: nil)
        //let data = body.dataUsingEncoding(NSUTF8StringEncoding)
        request1.HTTPBody = data
        request1.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
        var err: NSError?
        var jsonResult: NSDictionary = (NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary)!
        println("Synchronous\(jsonResult)")
    }
    
    func deleteRequest(urlPath: String) {
        var url: NSURL = NSURL(string: urlPath)!
        request1 = NSMutableURLRequest(URL:  url)
        
        
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        request1.HTTPMethod = "DELETE"
        
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
        var err: NSError?
        var jsonResult: NSDictionary = (NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary)!
        println("Synchronous\(jsonResult)")
    }
}
