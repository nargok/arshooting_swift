//
//  ContentView.swift
//  ARShooting
//
//  Created by 後閑諒一 on 2020/05/30.
//  Copyright © 2020 nargok. All rights reserved.
//

import SwiftUI
import RealityKit


struct ARTitleView : View {
    
    @EnvironmentObject var gameInfo: GameInfo
    
    var body: some View {
        
        let arView = ARViewContainer().edgesIgnoringSafeArea(.all)
        
        let view = ZStack {
            
            arView
            
            VStack(spacing: 200) {

                if gameInfo.gameState == .menu {
                    Text("ARShooting").font(Font.custom("HelveticaNeue-Bold", size: 60.0))

                }

                Button(action: {
                    self.gameInfo.gameState = .placingContent
                }) {

                    if gameInfo.gameState == .menu {
                        Text("Game Start")
                    }
                }
            }
        }
        
        return view
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ARTitleView()
    }
}
#endif
