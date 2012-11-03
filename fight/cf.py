#! /usr/bin/env python

import sys

sys.path.append('/Users/Aphrodite/program/arena/libs/src/python')

from grab_codeforces_input import main

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print 'usage: cf.py codeforcd_problem_url'
        sys.exit(1)
    url = sys.argv[1]
    main(url)
