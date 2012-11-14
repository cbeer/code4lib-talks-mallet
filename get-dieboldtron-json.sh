#!/bin/bash

mkdir data/json
curl -o 'data/json/code4lib-2008-portland-or.json' http://vote.code4lib.org/election/results/2.json
curl -o 'data/json/code4lib-2009-providence-ri.json' http://vote.code4lib.org/election/results/7.json
curl -o 'data/json/code4lib-2010-asheville-nc.json' http://vote.code4lib.org/election/results/13.json
curl -o 'data/json/code4lib-2011-bloomington-in.json' http://vote.code4lib.org/election/results/17.json
curl -o 'data/json/code4lib-2012-seattle-wa.json' http://vote.code4lib.org/election/results/21.json
curl -o 'data/json/code4lib-2013-chicago-il.json' http://vote.code4lib.org/election/results/24.json