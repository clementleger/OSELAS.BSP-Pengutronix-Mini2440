
#ifndef PLOT_DATA_H
#define PLOT_DATA_H

#include <QtCore/QObject>
#include <QtCore/QVector>

class PlotData : public QObject
{
Q_OBJECT
public:
	PlotData(QObject *parent = 0);

	enum Value {
		User,
		Nice,
		System,
		Idle,

		nValue
	};

signals:
	void data(int timestamp, const QVector<int> &values);

protected:
	virtual void timerEvent(QTimerEvent *);

private:
	void getValues(QVector<int> &values);
	QVector<int> m_old;
	int m_now;
};

#endif

