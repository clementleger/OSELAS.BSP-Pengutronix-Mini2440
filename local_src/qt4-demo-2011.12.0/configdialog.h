
#ifndef CONFIG_DIALOG_H
#define CONFIG_DIALOG_H

#include <QtGui/QColor>
#include <QtGui/QDialog>

#include "ui_config.h"

class ConfigDialog : public QDialog
{
Q_OBJECT
public:
	ConfigDialog(QWidget *parent = 0);

signals:
	void curveShow(int id, bool show);
	void curveColor(int id, const QColor &color);

private slots:
	void stateChanged(int state);
	void clicked();

private:
	int getId(QObject *s);

	Ui_ConfigDialog m_ui;
};

#endif // CONFIG_DIALOG_H

