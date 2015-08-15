#!/usr/bin/env xcrun swift
import Foundation

let url = NSURL(string: "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=&showintro=0&startdate%5Bday%5D=&startdate%5Bmonth%5D=&startdate%5Byear%5D=&mimetype=plaintext")
let hostsFile = NSString(contentsOfURL:url!, encoding: NSUTF8StringEncoding, error: nil)
let hosts = hostsFile!.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as! [NSString]
var blocks = [[String:[String:String]]]()
for host in hosts {
    if host != "" {
        let block = ["trigger" : ["url-filter" : String(host) ], "action" : [ "type" : "block" ] ]
        blocks.append(block)
    }
}

let data = NSJSONSerialization.dataWithJSONObject(blocks, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
string?.writeToFile("Extension/blockerList.json", atomically: true, encoding: NSUTF8StringEncoding, error:nil)
