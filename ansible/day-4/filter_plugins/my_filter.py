from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from ansible import errors

import re

dict = {'RedHat': 'rhel'}

def get_mongo_src(arg, os_family, major_v, mongo_v):	
    result = []

    for i in range(len(arg)):
        if ((dict[os_family] + major_v) in arg[i]) and (str(mongo_v) in arg[i]):
            result.append(arg[i])
    return "Recomended versions of MongoDB for {}: {}".format(os_family, result)
  

class FilterModule(object):

    def filters(self):
        return {
            'get_mongo_src': get_mongo_src,
        }

