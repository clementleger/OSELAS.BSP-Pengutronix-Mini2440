/*
 * Copyright 2011 Josef Holzmayr, holzmayr@rsi-elektrotechnik.de
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

import QtQuick 1.0

Rectangle {
	id: btnMain
	width: 50
	height: 50

	property alias text: btnText.text

	signal clicked

	Text {
		id: btnText
		x: 13
		y: 18
		text: qsTr("text")
		verticalAlignment: Text.AlignVCenter
		horizontalAlignment: Text.AlignHCenter
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter
		font.pixelSize: 12
	}

	MouseArea {
		id: btnMAclicked
		anchors.fill: parent
		onClicked: btnMain.clicked()
	}
}
