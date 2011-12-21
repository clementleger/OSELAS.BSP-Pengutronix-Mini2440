/*
 * Copyright (c) 2011 Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
 *
 * This code is derived from the 'evtest' sources:
 *  Copyright (c) 1999-2000 Vojtech Pavlik
 *  Copyright (c) 2009 Red Hat, Inc
 *  Copyright (c) 2011 Juergen Beisert <kernel@pengutronix.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * Purpose:
 * This is a small demo how to create kernel input subsystem related events
 * and to ring the bell device. Regular way would be to echo an alert into the
 * current TTY device. But for some embedded devices there is no TTY, because it
 * runs only a graphical application.
 */

#ifndef BUZZER_H
#define BUZZER_H

#include <QObject>

class Buzzer : public QObject
{
    Q_OBJECT
	Q_REVISION(1)

public:
    explicit Buzzer(QObject *parent = 0);

	Q_INVOKABLE void beep();

public slots:

protected:
};

#endif // BUZZER_H
