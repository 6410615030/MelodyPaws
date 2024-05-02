import SwiftUI

struct ContinuousCollisionDetectionView: View {
    let fixedX: CGFloat = 100
    @State private var positionY: CGFloat = -50
    @State private var draggablePosition = CGPoint(x: 150, y: 300)
    @State private var isColliding = false
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(isColliding ? Color.red : Color.blue)
                    .frame(width: 50, height: 50)
                    .position(x: fixedX, y: positionY)
                    .onReceive(timer) { _ in
                        if positionY > geometry.size.height + 25 {
                            positionY = -50
                        } else {
                            positionY += 5
                        }
                        checkCollision(geometry: geometry)
                    }

                Circle()
                    .fill(isColliding ? Color.red : Color.green)
                    .frame(width: 100, height: 100)
                    .position(draggablePosition)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                draggablePosition = gesture.location
                                checkCollision(geometry: geometry)
                            }
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func checkCollision(geometry: GeometryProxy) {
        let fallingCircleFrame = CGRect(x: fixedX - 25, y: positionY - 25, width: 50, height: 50)
        let draggableCircleFrame = CGRect(x: draggablePosition.x - 50, y: draggablePosition.y - 50, width: 100, height: 100)

        isColliding = fallingCircleFrame.intersects(draggableCircleFrame)
    }
}




struct ContinuousCollisionDetectionView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuousCollisionDetectionView()
    }
}
