import QtQuick 1.0

Rectangle {
	id: page
	color: "grey"
	width: 320
	height: 240

	property int boxsize: 50
	property int markersize: 30
	property int borderoffset: 10
	property int boxoffset: (boxsize - markersize) / 2

	Rectangle {
		id: rectTL
		width: boxsize
		height: boxsize
		color: "#00000000"
		anchors.left: parent.left
		anchors.leftMargin: borderoffset
		anchors.top: parent.top
		anchors.topMargin: borderoffset
		border.color: "#000000"

		MouseArea {
			anchors.fill: parent
			onClicked: page.state = 'TL'
		}
	}
	Rectangle {
		id: rectTR
		width: boxsize
		height: boxsize
		color: "#00000000"
		anchors.top: parent.top
		anchors.topMargin: borderoffset
		anchors.right: parent.right
		anchors.rightMargin: borderoffset
		border.color: "#000000"

		MouseArea {
			anchors.fill: parent
			onClicked: page.state = 'TR'
		}
	}
	Rectangle {
		id: rectBL
		width: boxsize
		height: boxsize
		color: "#00000000"
		anchors.left: parent.left
		anchors.leftMargin: borderoffset
		anchors.bottom: parent.bottom
		anchors.bottomMargin: borderoffset
		border.color: "#000000"

		MouseArea {
			anchors.fill: parent
			onClicked: page.state = 'BL'
		}
	}
	Rectangle {
		id: rectBR
		width: boxsize
		height: boxsize
		color: "#00000000"
		anchors.bottom: parent.bottom
		anchors.bottomMargin: borderoffset
		anchors.right: parent.right
		anchors.rightMargin: borderoffset
		border.color: "#000000"

		MouseArea {
			anchors.fill: parent
			onClicked: page.state = 'BR'
		}
	}

	Rectangle {
		id: marker
		x: (page.width / 2) - (marker.width / 2)
		y: (page.height / 2) - (marker.height / 2)
		width: markersize
		height: markersize
		color: "#ff0000"
	}

	Text {
		id: text1
		text: qsTr("Touch the black squares to move the red marker.")
		anchors.right: parent.right
		anchors.rightMargin: borderoffset
		anchors.left: parent.left
		anchors.leftMargin: borderoffset
		anchors.bottom: parent.bottom
		anchors.bottomMargin: (borderoffset * 2) + boxsize
		anchors.top: parent.top
		anchors.topMargin: (borderoffset * 2) + boxsize
		wrapMode: Text.WordWrap
		horizontalAlignment: Text.AlignHCenter
		font.family: "Arial Black"
		font.underline: true
		font.pixelSize: 12
	}
	states: [
		State {
			name: "TL"

			PropertyChanges {
				target: marker
				x: rectTL.x + boxoffset
				y: rectTL.y + boxoffset
			}
		},
		State {
			name: "TR"
			PropertyChanges {
				target: marker
				x: rectTR.x + boxoffset
				y: rectTR.y + boxoffset
			}
		},
		State {
			name: "BL"
			PropertyChanges {
				target: marker
				x: rectBL.x + boxoffset
				y: rectBL.y + boxoffset
			}
		},
		State {
			name: "BR"
			PropertyChanges {
				target: marker
				x: rectBR.x + boxoffset
				y: rectBR.y + boxoffset
			}
		}
	]

	transitions: Transition {
		NumberAnimation { properties: "x, y"; easing.type: Easing.InOutQuad; duration: 500 }
	}
}
