
CONFIG += qt

TARGET = qt4-demo

SOURCES = plotdata.cpp plothandler.cpp configdialog.cpp main.cpp
FORMS = config.ui mainwindow.ui
HEADERS = plotdata.h plothandler.h configdialog.h

LIBS += -lqwt

MOC_DIR = moc

