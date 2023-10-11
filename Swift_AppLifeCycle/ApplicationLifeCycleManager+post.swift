import Foundation

extension ApplicationLifeCycleManager {
    public func post(newState: ApplicationLifeCycleState) {
        NotificationCenter.default.post(Notification(name: newState.notificationName))
    }
}
