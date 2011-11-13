
#include <QtCore/QDateTime>
#include <QtCore/QFile>
#include <QtCore/QTextStream>
#include <QtCore/QStringList>
#include <QtCore/QDebug>

#include "plotdata.h"

PlotData::PlotData(QObject *parent)
	: QObject(parent), m_old(nValue, 0)
{
	QVector<int> values(nValue);
	getValues(values);
	startTimer(1000);
}

void PlotData::getValues(QVector<int> &values)
{
	int cpuCount = -1;
	QFile file("/proc/stat");
	if (!file.open(QIODevice::ReadOnly))
		return;
	QTextStream stream(&file);
	do {
		QString line = stream.readLine();
		const QStringList list = line.trimmed().split(" ",  QString::SkipEmptyParts);
		if (list[0].left(3) == "cpu")
			++cpuCount;
		if ((list.count() < 6) || list[0] != "cpu")
			continue;

		m_now = 0;
		for (int i = 0; i < list.length()-1; ++i) {
			int value = list[i+1].toInt();
			m_now += value;
			if (i < nValue) {
				values[i] = value - m_old[i];
				m_old[i] = value;
			}
		}
	} while(!stream.atEnd());
	for (int i = 0; i < nValue; ++i)
		values[i] /= cpuCount;
	m_now /= cpuCount;
}

void PlotData::timerEvent(QTimerEvent *)
{
	QVector<int> values(nValue);

	getValues(values);
	emit data(m_now, values);
}

