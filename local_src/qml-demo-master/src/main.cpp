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

#include <QtGui/QApplication>
#include <QDeclarativeView>
#include <QWSServer>

int main(int argc, char **argv)
{

	QApplication app(argc, argv);

/* Hide the mouse cursor. Guards are there to enable compileability on non-embedded qt systems*/
#ifdef Q_WS_QWS
	QWSServer::setCursorVisible( false );
#endif

	QDeclarativeView *qdv = new QDeclarativeView;
	qdv->setSource(QUrl::fromLocalFile("/usr/lib/qml-demo/main.qml"));
	qdv->setResizeMode(QDeclarativeView::SizeRootObjectToView);
	qdv->showFullScreen();

	return app.exec();;
}
