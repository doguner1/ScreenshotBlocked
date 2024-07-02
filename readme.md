## ScreenshotBlocked

```swift
import SwiftUI

struct ScreenshotPreventView<Content: View>: View { //-> `@ViewBuilder` ile içeriği alarak, ekran görüntüsü alındığında gösterilmesini istediğiniz içeriği saklayacak bir yapı oluşturuluyor
    var content: Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    /// View Properties
    @State private var hostingController: UIHostingController<Content>?
    
    var body: some View {
        
        /*
         `GeometryReader` kullanılarak içerik boyutu alınıyor ve içeriğin boyutuna göre hosting controller oluşturuluyor veya güncelleniyor
         */
        _ScreenshotPreventHelper(hostingController: $hostingController)
            .overlay {
                
                GeometryReader {
                    
                    let size = $0.size
                    
                    Color.clear
                        .preference(key: SizeKey.self, value: size)
                        .onPreferenceChange(SizeKey.self, perform: { value in
                            if value != .zero {
                                if hostingController == nil {
                                    hostingController = UIHostingController(rootView: content)
                                    hostingController?.view.backgroundColor = .clear
                                    hostingController?.view.tag = 1009
                                    hostingController?.view.frame = .init(origin: .zero, size: value)
                                } else {
                                    /// Sometimes the View size may updated, In that case updating the UIView Size
                                    hostingController?.view.frame = .init(origin: .zero, size: value)
                                }
                            }
                        })
                }
            }
    }
}

fileprivate struct SizeKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

fileprivate struct _ScreenshotPreventHelper<Content: View>: UIViewRepresentable {
    @Binding var hostingController: UIHostingController<Content>?
    
    func makeUIView(context: Context) -> UIView {
        let secureField = UITextField()
        secureField.isSecureTextEntry = true
        secureField.isUserInteractionEnabled = false
        /*
         isSecureTextEntry = true ile gizli bir UITextField oluşturur. Bu metin alanı, ekran görüntülerinin içerik görünümünü yakalamasını etkin bir şekilde engelleyen bir güvenlik katmanı görevi görür.
         
         Metin düzenini çıkarmaya çalışır, bu da içeriğini gizlenmiş olarak işlemeyi sağlayan metin alanının bir alt görünümüdür.
         */
        
        if let textLayoutView = secureField.subviews.first {
            return textLayoutView
            
        }
        return UIView()
        
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        /// Hosting Görünümünü TextLayout Görünümüne Alt Görünüm Olarak Ekleme
        if let hostingController, !uiView.subviews.contains(where: { $0.tag == 1009 }) {
            /// Tek Seferlik Barındırma Denetleyicisi Ekleme
            uiView.addSubview(hostingController.view)
        }
    }
}

```

```swift
ScreenshotPreventView {
    Text("Hidden")
}

```




https://github.com/doguner1/ScreenshotBlocked/assets/105864359/afc8fd8e-8114-44f1-8f8c-5980af90504d







