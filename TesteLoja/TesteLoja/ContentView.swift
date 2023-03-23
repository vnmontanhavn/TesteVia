//
//  ContentView.swift
//  TesteLoja
//
//  Created by Vinicius Soares Lima on 21/03/23.
//

import SwiftUI
import URLImage

//class NavigationCoordinator: NSObject, UINavigationControllerDelegate {
//    var navigationController: UINavigationController?
//
//    func navigateToDetailScreen() {
////        let detailView = DetailView()
////        navigationController?.pushViewController(detailView, animated: true)
//    }
//}

struct ContentView: View {
    private var numberOfImages = 4
//    let coordinator = NavigationCoordinator()
    func getURLs() -> [URL] {
        var urlArray: [URL] = []
        urlArray.append(URL(string: "https://www.casasbahia-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=228062260")!)
        urlArray.append(URL(string: "https://www.casasbahia-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=228062241")!)
        return urlArray
    }
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes.updateValue(UIColor.white, forKey: NSAttributedString.Key.foregroundColor)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = .red
        UINavigationBar.appearance().backgroundColor = .blue
//        UINavigationBar().standardAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                TabView {
                    var urlArray: [URL] = getURLs()
                    
                    ForEach(0 ..< urlArray.count) { index in
                        URLImage(url: urlArray[index]) { image in
                            image.resizable().scaledToFit()
                        }
                    }
                }.tabViewStyle(PageTabViewStyle())
                    .frame(width: proxy.size.width, height: proxy.size.height / 3, alignment: .top)
            }
            .navigationTitle("title")
            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
            
        }
        
        
//            .navigationViewStyle(StackNavigationViewStyle())
//            .onAppear {
//                coordinator.navigationController = UINavigationController()
//                coordinator.navigationController?.delegate = coordinator
//                coordinator.navigationController?.title = "Detalhes"
//            }
//            .background(NavigationConfigurator { nc in
//                coordinator.navigationController = nc
//            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var callback: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let navigationController = uiViewController.navigationController {
            callback(navigationController)
        }
    }
}
