//import Foundation
//
//
//struct Item: CustomStringConvertible {
//    var itemID: UInt8
//    var itemLength: UInt16
//    var data: NSData
//    
//    var description: String {
//        return ""
//    }
//    
//    func getData() -> NSData {
//        var id = itemID
//        let tmpdata = NSMutableData(bytes: &id, length: 1)
//        var length = itemLength
//        tmpdata.appendBytes(&length, length: 2)
//        tmpdata.appendData(data)
//        return tmpdata
//    }
//}
//
//extension NSData {
//    
//    /// Create hexadecimal string representation of NSData object.
//    ///
//    /// - returns: String representation of this NSData object.
//    
//    func hexadecimalString() -> String {
//        var string = ""
//        var byte: UInt8 = 0
//        
//        for i in 0 ..< length {
//            getBytes(&byte, range: NSMakeRange(i, 1))
//            string += String(format: "%02x", byte)
//        }
//        
//        return string
//    }
//}
//
//struct TCTest {
//    func test1() {
//        
//        let x = -5764607523034232173
//        let y = x.byteSwapped
//        
//        print("%0x", x)
//        
//        0b11111111111111111111010101101101
//        0b11001111111111111111111111111111
//        
//        let aa: UInt32 = 3489660927 | 0
//        aa.byteSwapped
//        
//        let m = String(x, radix: 2)
//        m.characters.count
//        
//        let jsonString = "{\"aps\":{\"alert\":{\"body\":\"Test message\",\"title\":\"Optional title\"},\"category\":\"myCategory\"},\"customKey\":\"Use this file to define a testing payload for your notifications. The aps dictionary specifies the category, alert text and title. The WatchKit Simulator Actions array can provide info for one or more action buttons in addition to the standard Dismiss button. Any other top level keys are custom payload. If you have multiple such JSON files in your project, you'll be able to select them when choosing to debug the notification interface of your Watch App.\"}"
//        
//        guard let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding) else {
//            exit(0)
//        }
//        
//        
//        do {
//            let jsonSerial = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments) as? [NSObject: AnyObject]
//            
//            
//            let deviceToken = "529a5dd219a8b321a66388a5a951d74d47f6bbe0569ffba2fcb3a65cdbe86978".dataUsingEncoding(NSASCIIStringEncoding)?.hexadecimalString()
//            
//            let deviceTokenItem = Item(itemID: 1, itemLength: 32, data: deviceToken!.dataUsingEncoding(NSASCIIStringEncoding)!)
//            var payloadItem = Item(itemID: 2, itemLength: 32, data: jsonData)
//            payloadItem.itemLength = UInt16(payloadItem.data.length)
//            
//            var expireDate = NSDate(timeIntervalSinceNow: 6000).timeIntervalSince1970
//            let expireDateData = NSData()
//            expireDateData.getBytes(&expireDate, length: 4)
//            let expireDateItem = Item(itemID: 3, itemLength: 4, data: expireDateData)
//            
//            var priority: UInt8 = 10
//            let priorityItem = Item(itemID: 5, itemLength: 1, data: NSData(bytes: &priority, length: 1))
//            
//            var identifier: UInt32 = 2346
//            let identifierItem = Item(itemID: 1, itemLength: 4, data: NSData(bytes: &identifier, length: 1))
//            
//            let frameData = NSMutableData(data: deviceTokenItem.getData())
//            frameData.appendData(payloadItem.getData())
//            frameData.appendData(expireDateItem.getData())
//            frameData.appendData(priorityItem.getData())
//            frameData.appendData(identifierItem.getData())
//            
//            var frameLength = frameData.length
//            
//            var command = 2
//            let resultData = NSMutableData(bytes: &command, length: 1)
//            resultData.appendBytes(&frameLength, length: 4)
//            resultData.appendData(frameData)
//            
//            let url = NSURL(string: "/Users/reeonce/tests/test.data")
//            //    resultData.writeToFile(url, atomically: false)
//            //    resultData.writeToURL(url!, atomically: true)
//            do {
//                try resultData.writeToFile("/Users/reeonce/tests/test.data", options: NSDataWritingOptions.AtomicWrite)
//            } catch let e {
//                print(e)
//            }
//        } catch let e {
//            print(e)
//        }
//
//    }
//}
//
