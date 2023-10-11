import Foundation
import UIKit.UIApplication

/// Most important application lifecycle states enum.
public enum ApplicationLifeCycleState: CaseIterable, Identifiable {
    
    public var id: String { return title }
    
    case didEnterBackground
    case willEnterForeground
    case didFinishLaunching
    case didBecomeActive
    case willResignActive
    case willTerminate
    
    public var notificationName: NSNotification.Name {
        switch self {
        case .didEnterBackground: return UIApplication.didEnterBackgroundNotification
        case .willEnterForeground: return UIApplication.willEnterForegroundNotification
        case .didFinishLaunching: return UIApplication.didFinishLaunchingNotification
        case .didBecomeActive: return UIApplication.didBecomeActiveNotification
        case .willResignActive: return UIApplication.willResignActiveNotification
        case .willTerminate: return UIApplication.willTerminateNotification
        }
    }
    
    // The title is not supposed to be user facing.
    public var title: String {
        switch self {
        case .didEnterBackground: return "didEnterBackground"
        case .willEnterForeground: return "willEnterForeground"
        case .didFinishLaunching: return "didFinishLaunching"
        case .didBecomeActive: return "didBecomeActive"
        case .willResignActive: return "willResignActive"
        case .willTerminate: return "willTerminate"
        }
    }
    
    public init?(notificationName: Notification.Name) {

        switch notificationName {
        case UIApplication.didEnterBackgroundNotification: self = .didEnterBackground
        case UIApplication.willEnterForegroundNotification: self = .willEnterForeground
        case UIApplication.didFinishLaunchingNotification: self = .didFinishLaunching
        case UIApplication.didBecomeActiveNotification: self = .didBecomeActive
        case UIApplication.willResignActiveNotification: self = .willResignActive
        case UIApplication.willTerminateNotification: self = .willTerminate
        default:
            return nil
        }
    }
}
