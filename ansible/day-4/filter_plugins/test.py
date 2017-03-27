from __future__ import (absolute_import, division, print_function)
_metaclass_ = type
from ansible import errors

def get_list(arg, os_family, os_release, mongodb_version):
	if os_family == "CentOS":
		os_family = "rhel"

	for i in range(len(arg)):
		if ((os_family + os_release) in arg[i]) and (mongodb_version in arg[i]):			
			return "Required OS version: " + os_family + ", os release: " + os_release + ", mongodb version: " + mongodb_version + ". Required mongodb release : " + arg[i]		

class FilterModule(object):
	def filters(self):
		return {
			'get_mongo_src': get_list,
				}