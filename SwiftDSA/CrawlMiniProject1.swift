// https://www.hackingwithswift.com/example-code/system/how-to-read-the-contents-of-a-directory-using-filemanager
// https://gist.github.com/brennanMKE/a0a2ee6aa5a2e2e66297c580c4df0d66
// https://forums.swift.org/t/checking-if-a-url-is-a-directory/13842
// https://www.swiftnotes.dev/posts/swift-check-if-directory-exists/

import Foundation

func crawl(_ path: String) {
    var fileCount = 0, folderCount = 0
    crawlHelper("/Users/erikdesk/Downloads/test/", "", &fileCount, &folderCount)
    print("\(folderCount) directories, \(fileCount) files")
}

func crawlHelper(_ path: String, _ soFar: String, _ fileCount: inout Int, _ folderCount: inout Int) {
    let fileManager = FileManager.default
    
    do {
        let items = try fileManager.contentsOfDirectory(atPath: path)
        
        for (index, item) in items.enumerated() {
            if directoryExistsAtPath(path + item) {
                folderCount += 1
                if index == items.count - 1 {
                    print(soFar + "└─ " + "\(item)")
                } else {
                    print(soFar + "├─ " + "\(item)")
                }
                crawlHelper(path + item + "/", soFar + "│  ", &fileCount, &folderCount)
            } else {
                fileCount += 1
                if index == items.count - 1 {
                    print(soFar + "└─ " + item)
                } else {
                    print(soFar + "├─ " + item)
                }
            }
        }
    } catch {
    }
}

func directoryExistsAtPath(_ path: String) -> Bool {
    var isDirectory = ObjCBool(true)
    let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
    return exists && isDirectory.boolValue
}
