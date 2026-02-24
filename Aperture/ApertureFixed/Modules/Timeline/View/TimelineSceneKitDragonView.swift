// TimelineSceneKitDragonView.swift
// Scroll-driven 3D dragon animation - prototype by Stewei & Pilaf

import SwiftUI
import SceneKit

struct TimelineSceneKitDragonView: View {

    @State private var progress: CGFloat = 0.0

    var body: some View {

        ScrollView {

            VStack(spacing: 0) {

                TimelineDragonSceneView(progress: $progress)
                    .frame(height: 720)

                // Spacer content to allow scroll
                Color.clear
                    .frame(height: 2000)

            }
            .background(
                GeometryReader { geo in
                    let offset = -geo.frame(in: .named("scroll")).minY
                    let maxOffset: CGFloat = 1600
                    let p = min(max(offset / maxOffset, 0), 1)
                    Color.clear
                        .onAppear {
                            self.progress = p
                        }
                        .onChange(of: offset) { _, _ in
                            self.progress = p
                        }
                }
            )

        }
        .coordinateSpace(name: "scroll")

    }

}

// MARK: - SceneKit View Representable

struct TimelineDragonSceneView: UIViewRepresentable {

    @Binding var progress: CGFloat

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> SCNView {

        let view = SCNView()
        view.scene = context.coordinator.makeScene()
        view.backgroundColor = .black
        view.isPlaying = true
        view.preferredFramesPerSecond = 60
        view.rendersContinuously = true
        return view

    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        context.coordinator.update(progress: progress)
    }

}

// MARK: - SceneKit Coordinator

extension TimelineDragonSceneView {

    final class Coordinator {

        private var scene: SCNScene?

        private var dragonNode: SCNNode = SCNNode()
        private var coreNode: SCNNode = SCNNode()
        private var textNode: SCNNode = SCNNode()

        private let startY: Float = -6.0
        private let endY: Float = 6.0
        private let coreY: Float = 0.0

        private var ignited: Bool = false

        func makeScene() -> SCNScene {

            let scene = SCNScene()

            // Camera
            let cameraNode = SCNNode()
            cameraNode.camera = SCNCamera()
            cameraNode.position = SCNVector3(0, 0, 16)
            scene.rootNode.addChildNode(cameraNode)

            // Ambient light
            let ambient = SCNNode()
            ambient.light = SCNLight()
            ambient.light?.type = .ambient
            ambient.light?.intensity = 250
            scene.rootNode.addChildNode(ambient)

            // Key light
            let key = SCNNode()
            key.light = SCNLight()
            key.light?.type = .omni
            key.light?.intensity = 900
            key.position = SCNVector3(0, 6, 10)
            scene.rootNode.addChildNode(key)

            // Dragon placeholder
            dragonNode = makePlaceholderDragon()
            dragonNode.position = SCNVector3(0, startY, 0)
            scene.rootNode.addChildNode(dragonNode)

            // Activation core
            coreNode = makeActivationCore()
            coreNode.position = SCNVector3(0, coreY, 0)
            scene.rootNode.addChildNode(coreNode)

            // Text group
            textNode = makeTextGroup()
            textNode.opacity = 0.0
            scene.rootNode.addChildNode(textNode)

            self.scene = scene
            return scene

        }

        func update(progress: CGFloat) {

            guard scene != nil else { return }

            let p = Float(progress)
            let y = startY + (endY - startY) * p
            dragonNode.position.y = y

            // Slow rotation for life
            dragonNode.eulerAngles.y = 0.15 * p

            // Ignite when dragon reaches core
            if ignited == false && y >= coreY {
                ignited = true
                igniteCore()
                revealText()
            }

            // Reset logic for scroll back
            if ignited == true && p < 0.15 {
                ignited = false
                extinguishCore()
                hideText()
            }

        }

        // MARK: - Dragon Construction

        private func makePlaceholderDragon() -> SCNNode {

            // Placeholder: replace with real rig later
            // Tall capsule suggests serpentine body
            let capsule = SCNCapsule(capRadius: 0.35, height: 5.5)
            capsule.firstMaterial?.diffuse.contents = UIColor.white
            capsule.firstMaterial?.emission.contents = UIColor.darkGray

            let node = SCNNode(geometry: capsule)
            node.name = "DragonPlaceholder"

            // Head sphere
            let head = SCNSphere(radius: 0.55)
            head.firstMaterial?.diffuse.contents = UIColor.white
            let headNode = SCNNode(geometry: head)
            headNode.position = SCNVector3(0, 2.9, 0)
            node.addChildNode(headNode)

            return node

        }

        // MARK: - Activation Core

        private func makeActivationCore() -> SCNNode {

            let sphere = SCNSphere(radius: 0.6)
            sphere.firstMaterial?.diffuse.contents = UIColor.black
            sphere.firstMaterial?.emission.contents = UIColor.black

            let node = SCNNode(geometry: sphere)
            node.name = "ActivationCore"
            node.opacity = 0.85
            return node

        }

        private func igniteCore() {

            guard let mat = coreNode.geometry?.firstMaterial else { return }

            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.35
            mat.emission.contents = UIColor.white
            coreNode.opacity = 1.0
            coreNode.scale = SCNVector3(1.12, 1.12, 1.12)
            SCNTransaction.commit()

        }

        private func extinguishCore() {

            guard let mat = coreNode.geometry?.firstMaterial else { return }

            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.25
            mat.emission.contents = UIColor.black
            coreNode.opacity = 0.85
            coreNode.scale = SCNVector3(1.0, 1.0, 1.0)
            SCNTransaction.commit()

        }

        // MARK: - Text Construction

        private func makeTextGroup() -> SCNNode {

            let group = SCNNode()
            group.position = SCNVector3(0, -5.4, 0)

            let title = makeTextNode(
                string: "SunFlow: Reignited",
                fontName: "SFMono-Bold",
                fontSize: 0.55
            )
            title.position = SCNVector3(-3.2, 0.4, 0)

            let line1 = makeTextNode(
                string: "Descend until truth holds.",
                fontName: "SFMono-Regular",
                fontSize: 0.30
            )
            line1.position = SCNVector3(-3.2, 0.05, 0)

            let line2 = makeTextNode(
                string: "Ascend and reconstruct history with truth and bring it to light.",
                fontName: "SFMono-Regular",
                fontSize: 0.26
            )
            line2.position = SCNVector3(-3.2, -0.25, 0)

            group.addChildNode(title)
            group.addChildNode(line1)
            group.addChildNode(line2)

            return group

        }

        private func makeTextNode(string: String, fontName: String, fontSize: CGFloat) -> SCNNode {

            let text = SCNText(string: string, extrusionDepth: 0.02)
            text.flatness = 0.2
            text.font = UIFont(name: fontName, size: 24) ?? UIFont.monospacedSystemFont(ofSize: 24, weight: .regular)
            text.firstMaterial?.diffuse.contents = UIColor.white
            text.firstMaterial?.emission.contents = UIColor.darkGray

            let node = SCNNode(geometry: text)
            node.scale = SCNVector3(Float(fontSize), Float(fontSize), Float(fontSize))
            node.opacity = 1.0
            return node

        }

        private func revealText() {

            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.45
            textNode.opacity = 1.0
            SCNTransaction.commit()

        }

        private func hideText() {

            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.25
            textNode.opacity = 0.0
            SCNTransaction.commit()

        }

    }

}

// MARK: - Preview

#Preview {

    TimelineSceneKitDragonView()

}
