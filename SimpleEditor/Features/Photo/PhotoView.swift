import SwiftUI
import PhotosUI
import AVKit
import ComposableArchitecture

struct VideoPickerView: View {
//    @Bindable var store: StoreOf<PhotoFeature>
    
    var body: some View {
        VideoPicker { url in
            if let url {
//                store.send(.videoSelected(url))
            }
        }
        .onDisappear {
//            store.send(.dismissGallery)
        }
    }
}

struct VideoPicker: UIViewControllerRepresentable {
    var onVideoSelected: (URL?) -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .videos // 비디오만 필터링
        config.selectionLimit = 1 // 단일 선택
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: VideoPicker
        
        init(_ parent: VideoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let result = results.first else { return }
            let itemProvider = result.itemProvider
            
            // 비디오 파일 로드
            if itemProvider.hasItemConformingToTypeIdentifier(UTType.movie.identifier) {
                itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { url, error in
                    guard let tempURL = url else { return }
                    
                    // 임시 파일을 앱의 영구 저장소로 복사
                    let fileName = "selectedVideo-\(Date().timeIntervalSince1970).mov"
                    let permanentURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
                    
                    do {
                        try FileManager.default.copyItem(at: tempURL, to: permanentURL)
                        DispatchQueue.main.async {
                            self.parent.onVideoSelected(permanentURL) // 콜백 호출
                        }
                    } catch {
                        self.parent.onVideoSelected(nil)
                    }
                }
            }
        }
    }
}
