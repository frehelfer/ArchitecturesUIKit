//
//  LocalFileManager.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let shared = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        guard let data = image.pngData() else { return }
        createFolderIfNeeded(folderName: folderName)
        let url = getURLForFolder(folderName: folderName)
        
        do {
            try data.write(to: url)
        } catch {
            print("Error saving image. ImageName: \(imageName). \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        let url = getURLForImage(imageName: imageName, folderName: folderName)
        return UIImage(contentsOfFile: url.path())
    }
    
    private func createFolderIfNeeded(folderName: String) {
        let url = getURLForFolder(folderName: folderName)
        
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch {
                print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL {
        let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return path[0].appendingPathComponent(folderName, conformingTo: .folder)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL {
        let folderURL = getURLForFolder(folderName: folderName)
        return folderURL.appendingPathComponent(imageName, conformingTo: .image)
    }
    
}
