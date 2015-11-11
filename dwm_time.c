// See LICENSE file for copyright and license details

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <X11/Xlib.h>

#include "config.h"

void die(const char* message)
{
   fprintf(stderr, "dwm_time: %s\n", message);
   exit(EXIT_FAILURE);
}

void set_status(Display *display, const char *s)
{
   const Window rootWindow = DefaultRootWindow(display);
   XStoreName(display, rootWindow, s);
   XSync(display, False);
}

int main(void)
{
   setenv("TZ", time_zone, 1);

   Display *display = XOpenDisplay(NULL);
   if (!display) die("Cannot open display");

   for (;;)
   {
      const time_t now = time(NULL);
      const struct tm *t = localtime(&now);
      if (!t) die("Failed to determine current time");

      char status[18];
      memset(status, 0, sizeof(status));
   
      const size_t length = strftime(status, sizeof(status) - 1, "%Y-%m-%d %H:%M", t);
      if (!length) die("Failed to format current time");

      set_status(display, status);
      sleep(1);
   }

   XCloseDisplay(display);

   return EXIT_SUCCESS;
}

