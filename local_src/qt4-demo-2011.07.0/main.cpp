
#include <QtGui/QApplication>
#include <QtGui/QWidget>
#include <QtGui/QVBoxLayout>

#include "plothandler.h"
#include "plotdata.h"
#include "configdialog.h"

#include "ui_mainwindow.h"

int main(int argc, char **argv)
{

	QApplication app(argc, argv);

	QMainWindow window;
	Ui_MainWindow ui;
	ConfigDialog config;

	ui.setupUi(&window);

	PlotHandler handler(ui.plot);
	PlotData data;
        QObject::connect(&data, SIGNAL(data(int, const QVector<int>&)), &handler, SLOT(append(int, const QVector<int>&)));

	QObject::connect(ui.action_Configure, SIGNAL(triggered(bool)), &config, SLOT(open()));
	QObject::connect(ui.action_Quit, SIGNAL(triggered(bool)), &window, SLOT(close()));
	QObject::connect(ui.action_Load, SIGNAL(triggered(bool)), &handler, SLOT(load(bool)));
	QObject::connect(&config, SIGNAL(curveShow(int, bool)), &handler, SLOT(curveShow(int, bool)));
	QObject::connect(&config, SIGNAL(curveColor(int, const QColor&)), &handler, SLOT(curveColor(int, const QColor&)));

	window.showFullScreen();
	return app.exec();;
}

