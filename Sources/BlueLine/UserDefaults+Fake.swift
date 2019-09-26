import Foundation



public extension UserDefaults {
  static func fake(forDomain: String? = nil, handler:()->Void){
    guard let domainName = forDomain ?? Bundle.main.bundleIdentifier else {
      fatalError("Couldn't find bundle ID.")
    }

    let defs = UserDefaults.standard
    
    let oldDomain = defs.persistentDomain(forName: domainName)
    defer {
      defs.setPersistentDomain(oldDomain ?? [:], forName: domainName)
    }
    defs.removePersistentDomain(forName: domainName)
    handler()
  }
}
