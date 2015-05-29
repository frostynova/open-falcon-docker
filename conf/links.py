#!/usr/bin/env python
# -*- coding: utf-8 -*-

__author__ = 'Ulric Qin'

# -- app config --
DEBUG = True

# -- db config --
DB_HOST = "127.0.0.1"
DB_PORT = 3306
DB_USER = "root"
DB_PASS = ""
DB_NAME = "falcon_links"

# -- cookie config --
SECRET_KEY = "4e.5tyg8-u9ioj"
SESSION_COOKIE_NAME = "falcon-links"
PERMANENT_SESSION_LIFETIME = 3600 * 24 * 30

try:
        from frame.local_config import *
except Exception, e:
        print "[warning] %s" % e
