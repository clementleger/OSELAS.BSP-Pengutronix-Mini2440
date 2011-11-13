
#include <QtCore/QDebug>
#include <QtGui/QColorDialog>

#include "configdialog.h"

ConfigDialog::ConfigDialog(QWidget *parent)
	: QDialog(parent)
{
	m_ui.setupUi(this);
	connect(m_ui.user_checkBox, SIGNAL(stateChanged(int)), this, SLOT(stateChanged(int)));
	connect(m_ui.nice_checkBox, SIGNAL(stateChanged(int)), this, SLOT(stateChanged(int)));
	connect(m_ui.system_checkBox, SIGNAL(stateChanged(int)), this, SLOT(stateChanged(int)));
	connect(m_ui.idle_checkBox, SIGNAL(stateChanged(int)), this, SLOT(stateChanged(int)));
	m_ui.user_checkBox->setChecked(true);
	m_ui.nice_checkBox->setChecked(false);
	m_ui.system_checkBox->setChecked(true);
	m_ui.idle_checkBox->setChecked(false);

	connect(m_ui.user_colorButton, SIGNAL(clicked()), this, SLOT(clicked()));
	connect(m_ui.nice_colorButton, SIGNAL(clicked()), this, SLOT(clicked()));
	connect(m_ui.system_colorButton, SIGNAL(clicked()), this, SLOT(clicked()));
	connect(m_ui.idle_colorButton, SIGNAL(clicked()), this, SLOT(clicked()));

}

int ConfigDialog::getId(QObject *s)
{
	if (s == m_ui.user_checkBox)
		return 0;
	if (s == m_ui.nice_checkBox)
		return 1;
	if (s == m_ui.system_checkBox)
		return 2;
	if (s == m_ui.idle_checkBox)
		return 3;
	if (s == m_ui.user_colorButton)
		return 0;
	if (s == m_ui.nice_colorButton)
		return 1;
	if (s == m_ui.system_colorButton)
		return 2;
	if (s == m_ui.idle_colorButton)
		return 3;
	return -1;
}

void ConfigDialog::stateChanged(int state)
{
	bool show = state == Qt::Checked;
	int id = getId(sender());

	if (id >= 0)
		emit curveShow(id, show);
}

void ConfigDialog::clicked()
{
	int id = getId(sender());
	QColor c = QColorDialog::getColor();

	if ((id >= 0) && c.isValid())
		emit curveColor(id, c);
}


