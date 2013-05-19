// Application with UI adaptability support template
import bb.cascades 1.0

// create application UI page
Page {
    Container {
        layout: DockLayout { }
        AppBackground {
            // setup application background
            verticalAlignment: VerticalAlignment.Fill
            horizontalAlignment: HorizontalAlignment.Fill
        }
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: qsTr("Menu Sihat Planner")
                textStyle.base: SystemDefaults.TextStyles.TitleText
                textStyle.color: Color.White
            }
            Container {
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                }
                layout: DockLayout {
                }
                verticalAlignment: VerticalAlignment.Fill
                horizontalAlignment: HorizontalAlignment.Fill
                Container {
                    property int padding: 10
                    layout: StackLayout {
                        // change layout direction according to current device orientation
                        // this feature is disabled for 720x720 devices in current template
                        // see: assets/720x720/AppOrientationHandler.qml
                        orientation: (orientationHandler.orientation == UIOrientation.Portrait) ? LayoutOrientation.TopToBottom : LayoutOrientation.LeftToRight
                    }
                    // create 9-sliced frame for this container
                    background: frame.imagePaint
                    attachedObjects: [
                        ImagePaintDefinition {
                            id: frame
                            imageSource: "asset:///images/round-border.amd"
                        }
                    ]
                    ImageButton {
                        defaultImageSource: "asset:///images/picture.png"
                    }
                    ImageButton {
                        defaultImageSource: "asset:///images/picture.png"
                    }
                    topPadding: padding
                    bottomPadding: padding
                    leftPadding: padding
                    rightPadding: padding
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        }
        attachedObjects: [
            AppOrientationHandler {
                // custom orientation handler
                // the different handler is used for 720x720 in this template
                // to disable oriantation adaptability for this kind of devices
                id: orientationHandler
            }
        ]
    }
}

