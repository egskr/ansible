#!/usr/bin/python

from __future__ import (absolute_import, division, print_function)
__metaclass__ = type
from ansible import errors

def get_list(arg, os_family, os_release, mongodb_version):
	
	if os_family == "CentOS":
		temp_os = "CentOS"
		os_family = "rhel"

	for i in range(len(arg)):
		if ((os_family + os_release) in arg[i]) and (mongodb_version in arg[i]):			
			return "Required OS version: " + temp_os + ", OS release: " + os_release + ", mongodb version: " + mongodb_version + \
			".  RECOMMENDED MONGODB RELEASE :  " + arg[i]		



class FilterModule(object):
	def filters(self):
		return {
			'get_mongo_src': get_list,
				}


