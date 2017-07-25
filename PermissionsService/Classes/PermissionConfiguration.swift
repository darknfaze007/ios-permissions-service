//
//  PermissionConfiguration.swift
//  Pods
//
//  Created by Hellen Soloviy on 7/25/17.
//
//

import Foundation

public protocol PermissionConfiguration {
    var messages: ServiceMessages { get }
    
}

extension PermissionConfiguration {
    public var messages: ServiceMessages { return DefaultMessages() }
    
}

//extension PermissionConfiguration where Self: LocationConfiguration {
//    
//    public func config() {
//         print("Location!")
//    }
//    
//    var permissionType: LocationPermissionType {
//        return self.permissionType
//    }
//
////    public func config<T: PermissionConfiguration>(with configuration: T)
////        where T: DefaultConfiguration {
////            print("Default")
////    }
//    
//}
//extension PermissionConfiguration where Self: DefaultConfiguration {
//    
//    public func config() {
//        print("Default!")
//    }
//    
//}

struct DefaultMessages: ServiceMessages {
    
    let deniedTitle = "Access denied"
    let deniedMessage = "You can enable access in Privacy Settings"
    let restrictedTitle = "Access restricted"
    let restrictedMessage = "Access to this component is restricted"
}


public final class DefaultConfiguration: PermissionConfiguration {
    //mock for unknown&default situations
    public let messages: ServiceMessages
    
    public required init(with messages: ServiceMessages = DefaultMessages()) {
        self.messages = messages
        
    }
    
}

public final class Configurator: PermissionConfiguration {
    
    var configuration: PermissionConfiguration = DefaultConfiguration()
    
    public init(for permission: PermissionService.Type) {
        
        switch permission {
        case is Location.Type:
            self.configuration = LocationConfiguration()            
            break
        default:
            self.configuration = DefaultConfiguration()
            break
        }
        
    }
    
}
