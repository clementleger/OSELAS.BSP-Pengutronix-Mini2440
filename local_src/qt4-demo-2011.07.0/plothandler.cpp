
#include <QtCore/QTime>
#include <QtGui/QPainter>
#include <QtCore/QDebug>

#include <qwt_plot.h>
#include <qwt_legend.h>
#include <qwt_plot_layout.h>
#include <qwt_plot_curve.h>
#include <qwt_scale_draw.h>
#include <qwt_scale_widget.h>

#include "plothandler.h"

#define SIZE 100

class TimeScaleDraw: public QwtScaleDraw
{
public:
	virtual QwtText label(double v) const
	{
		QTime time(0,0);
		time = time.addSecs((int)v/100);
		return time.toString();
	}
};

class Background: public QwtPlotItem
{
public:
	Background()
	{
		setZ(0.0);
	}

	virtual int rtti() const
	{
		return QwtPlotItem::Rtti_PlotUserItem;
	}

	virtual void draw(QPainter *painter,
		const QwtScaleMap &, const QwtScaleMap &yMap,
		const QRect &rect) const
	{
		QColor c(Qt::white);
		QRect r = rect;

		for ( int i = 100; i > 0; i -= 10 )
		{
			r.setBottom(yMap.transform(i - 10));
			r.setTop(yMap.transform(i));
			painter->fillRect(r, c);

			c = c.dark(110);
		}
	}
};

class PlotCurve: public QwtPlotCurve
{
public:
	PlotCurve(const QString &title) : QwtPlotCurve(title)
	{
		setRenderHint(QwtPlotItem::RenderAntialiased);
	}
	void setColor(const QColor &color)
	{
		QColor c = color;
		c.setAlpha(150);
		setPen(c);
		setBrush(c);
	}
};

PlotHandler::PlotHandler(QwtPlot *plot)
	: QObject(plot), m_plot(plot), m_pos(0)
{
	QwtText xaxis("System Uptime [h:m:s]", QwtText::PlainText);
	QwtText yaxis("Cpu Usage [%]", QwtText::PlainText);

	QFont f(plot->font());
	xaxis.setFont(f);
	yaxis.setFont(f);

	for (int i = 0; i < nValue; ++i)
		m_data[i] = new double[SIZE];
	m_timeStamp = new double[SIZE];

	m_plot->setAutoReplot(false);
	m_plot->plotLayout()->setAlignCanvasToScales(true);

	QwtLegend *legend = new QwtLegend();
	m_plot->insertLegend(legend, QwtPlot::RightLegend);

	m_plot->setAxisTitle(QwtPlot::xBottom, xaxis);
	m_plot->setAxisFont(QwtPlot::xBottom, f);
	m_plot->setAxisScaleDraw(QwtPlot::xBottom, new TimeScaleDraw());
	m_plot->setAxisScale(QwtPlot::xBottom, 0, SIZE);

	m_plot->setAxisLabelRotation(QwtPlot::xBottom, -50.0);
	m_plot->setAxisLabelAlignment(QwtPlot::xBottom, Qt::AlignLeft | Qt::AlignBottom);

	QwtScaleWidget *scaleWidget = m_plot->axisWidget(QwtPlot::xBottom);
	const int fmh = QFontMetrics(scaleWidget->font()).height();
	scaleWidget->setMinBorderDist(0, fmh / 2);

	m_plot->setAxisTitle(QwtPlot::yLeft, yaxis);
	m_plot->setAxisFont(QwtPlot::yLeft, f);
	m_plot->setAxisScale(QwtPlot::yLeft, 0, 100);

	Background *bg = new Background();
	bg->attach(m_plot);

	m_curve[0] = new PlotCurve("User");
	m_curve[0]->setColor(Qt::blue);
	m_curve[0]->setZ(m_curve[0]->z() - 1);
	m_curve[0]->attach(m_plot);
	m_curve[0]->setRawSamples(m_timeStamp, m_data[0], SIZE);
	curveShow(0, true);

	m_curve[1] = new PlotCurve("Nice");
	m_curve[1]->setColor(Qt::yellow);
	m_curve[1]->setZ(m_curve[1]->z() - 2);
	m_curve[1]->attach(m_plot);
	m_curve[1]->setRawSamples(m_timeStamp, m_data[1], SIZE);
	curveShow(1, false);

	m_curve[2] = new PlotCurve("System");
	m_curve[2]->setColor(Qt::red);
	m_curve[2]->attach(m_plot);
	m_curve[2]->setRawSamples(m_timeStamp, m_data[2], SIZE);
	curveShow(2, true);

	m_curve[3] = new PlotCurve("Idle");
	m_curve[3]->setColor(Qt::darkCyan);
	m_curve[3]->setZ(m_curve[3]->z() - 3);
	m_curve[3]->attach(m_plot);
	m_curve[3]->setRawSamples(m_timeStamp, m_data[3], SIZE);
	curveShow(3, false);

}

PlotHandler::~PlotHandler()
{
	for (int i = 0; i < nValue; ++i)
		delete m_data[i];
	delete m_timeStamp;
}

void PlotHandler::append(int timestamp, const QVector<int> &values)
{
	if (m_pos == 0) {
		for (int j = 1; j < SIZE; ++j) {
			m_timeStamp[j] = timestamp - (SIZE-j)*100;
			for (int i = 0; i < nValue; ++i)
				m_data[i][j] = 0;
		}
	}
	int pos = m_pos % SIZE;
	m_timeStamp[pos] = (double)timestamp;
	m_timeStamp[(pos+1)%SIZE] = (double)timestamp + 100;
	for (int i = 0; i < nValue; ++i) {
		m_data[i][pos] = (double)values[i];
		m_data[i][(pos+1)%SIZE] = 0.0;
		m_data[i][(pos+2)%SIZE] = 0.0;
	}


	m_plot->setAxisScale(QwtPlot::xBottom, m_timeStamp[(pos+3)%SIZE], m_timeStamp[pos]);
	m_plot->replot();

	++m_pos;
}


void PlotHandler::curveShow(int id, bool show)
{
	m_curve[id]->setVisible(show);
	m_plot->replot();
}

void PlotHandler::curveColor(int id, const QColor &color)
{
	m_curve[id]->setColor(color);
	m_plot->replot();
}

void PlotHandler::load(bool enable)
{
	if (enable)
		loadProcess.start("qt4-demo-load");
	else
		loadProcess.terminate();
}
