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
