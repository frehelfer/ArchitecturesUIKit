//
//  ImageService.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import SwiftUI
import Combine

class ImageService {
    var onReceivedImage: ((_ image: UIImage) -> Void)?
    
    private var imageSubscription: AnyCancellable?
    private let folderName = "person_images"
    
    private let fileManager = LocalFileManager.shared
    
    init() {
        
    }
    
    public func getImage(person: Person) {
        if let savedImage = fileManager.getImage(imageName: String(person.id), folderName: folderName) {
            onReceivedImage?(savedImage)
        } else {
            downloadImage(person: person)
        }
    }
    
    private func downloadImage(person: Person) {
        
        imageSubscription = URLSession.shared.dataTaskPublisher(for: person.photo)
            .tryMap({ data, response in
                guard
                    let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return UIImage(data: data)
            })
            .retry(2)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { [weak self] returnedImage in
                guard
                    let downloadedImage = returnedImage
                else { return }
                
                self?.onReceivedImage?(downloadedImage)
                self?.imageSubscription?.cancel()
            })
        
    }
}
