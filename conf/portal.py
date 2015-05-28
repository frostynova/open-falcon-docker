#!/usr/bin/env python
# -*- coding: utf-8 -*-

# -- app config --
DEBUG = True

# -- db config --
DB_HOST = "127.0.0.1"
DB_PORT = 3306
DB_USER = "root"
DB_PASS = ""
DB_NAME = "falcon_portal"

# -- mc config --
MEMCACHED_SERVERS = ["127.0.0.1:11211"]
MEMCACHED_PREFIX = 'portal.0.'

# -- cookie config --
SECRET_KEY = "4e.5tyg8-u9ioj"
SESSION_COOKIE_NAME = "falcon-portal"
PERMANENT_SESSION_LIFETIME = 3600 * 24 * 30

UIC_ADDRESS = {
    'internal': 'http://127.0.0.1:8080',
    'external': 'http://127.0.0.1',
}

UIC_TOKEN = ''

MAINTAINERS = ['root']
CONTACT = ''

COMMUNITY = True

try:
    from frame.local_config import *
except Exception, e:
    print "[warning] %s" % e
