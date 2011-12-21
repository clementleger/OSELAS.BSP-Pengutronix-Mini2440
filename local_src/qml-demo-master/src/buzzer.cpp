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

#include "buzzer.h"

#define _XOPEN_SOURCE 500	/* for usleep() */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include <linux/version.h>
#include <linux/input.h>

#define BEEP_DEVICE		"/dev/input/beeper"

Buzzer::Buzzer(QObject *parent) :
	QObject(parent)
{

}

void
Buzzer::beep()
{
	ssize_t s;
	struct input_event ev;

	int fd;

	fd = open(BEEP_DEVICE, O_WRONLY);
	if (fd != -1) {
  /*	ev.time = ??; TODO */
	  ev.type = EV_SND;
	  ev.code = SND_BELL;
	  ev.value = 1;	/* enable (ring) the bell */

	  s = write(fd, &ev, sizeof(ev));
	  if (s == -1) {
		  return;
	  }

	  usleep(100 * 1000);	/* 100 ms */

	  ev.value = 0;	/* stop bell from ringing */

	  s = write(fd, &ev, sizeof(ev));
	  if (s == -1) {
		  return;
	  }
	}
}
