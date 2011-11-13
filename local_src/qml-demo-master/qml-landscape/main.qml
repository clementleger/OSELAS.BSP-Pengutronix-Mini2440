import QtQuick 1.0

Rectangle {
	id: page
	color: "grey"
	width: 320
	height: 240

	Rectangle {
		id: rectTL
		x: 10
		y: 10
		width: 50
		height: 50
		color: "#00000000"
		border.color: "#000000"

		MouseArea {
			anchors.fill: parent
			onClicked: page.state = 'TL'
		}
	}
	Rectangle {
		id: rectTR
		x: 260
		y: 10
		width: 50
		height: 50
		color: "#00000000"
		border.color: "#000000"

		MouseArea {
			anchors.fill: parent
			onClicked: page.state = 'TR'
		}
	}
	Rectangle {
		id: rectBL
		x: 10
		y: 180
		width: 50
		height: 50
		color: "#00000000"
		border.color: "#000000"

		MouseArea {
			anchors.fill: parent
			onClicked: page.state = 'BL'
		}
	}
	Rectangle {
		id: rectBR
		x: 260
		y: 180
		width: 50
		height: 50
		color: "#00000000"
		border.color: "#000000"

		MouseArea {
			anchors.fill: parent
			onClicked: page.state = 'BR'
		}
	}

	Rectangle {
		id: marker
		x: 145
		y: 105
		width: 30
		height: 30
		color: "#ff0000"
	}

	Text {
		id: text1
		x: 21
		y: 78
		text: qsTr("Touch the black squares to move the red marker.")
		anchors.horizontalCenter: parent.horizontalCenter
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
				x: 20
				y: 20
			}
		},
		State {
			name: "TR"
			PropertyChanges {
				target: marker
				x: 270
				y: 20
			}
		},
		State {
			name: "BL"
			PropertyChanges {
				target: marker
				x: 20
				y: 190
			}
		},
		State {
			name: "BR"
			PropertyChanges {
				target: marker
				x: 270
				y: 190
			}
		}
	]

	transitions: Transition {
		NumberAnimation { properties: "x, y"; easing.type: Easing.InOutQuad; duration: 500 }
	}
}
