
#ifndef PLOT_HANDLER_H
#define PLOT_HANDLER_H

#include <QtGui/QColor>
#include <QtCore/QObject>
#include <QtCore/QProcess>

class QwtPlot;
class QwtPlotItem;

class PlotCurve;

class PlotHandler : public QObject
{
Q_OBJECT
public:
	PlotHandler(QwtPlot *plot);
	~PlotHandler();

	enum Value {
		User,
		Nice,
		System,
		Idle,
	
		nValue
	};

	void showCurve(QwtPlotItem *item, bool on);

public slots:
	void append(int timestamp, const QVector<int> &values);
	void curveShow(int id, bool show);
	void curveColor(int id, const QColor &color);

	void load(bool enable);

private:
	PlotCurve *m_curve[nValue];
	QwtPlot *m_plot;
	int m_pos;
	double *m_timeStamp;
	double *m_data[nValue];
	QProcess loadProcess;
};

#endif // PLOT_HANDLER_H

