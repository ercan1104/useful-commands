#!/bin/sh
curl -fsS 'https://cityquiz.io/api/sessions/get-saved?pk=2388991' -o /tmp/cityquiz-session.json && python3 - <<'PY'
import json
from pathlib import Path
p=Path('/tmp/cityquiz-session.json')
data=json.loads(p.read_text())
cities=data['cities']
print('cities:', len(cities))
print('with coords:', sum(c.get('latitude') is not None and c.get('longitude') is not None for c in cities))
print('first:', [(c['name'], c['latitude'], c['longitude']) for c in cities[:3]])

from xml.sax.saxutils import escape
out=Path('***REMOVED***.gpx')
lines=['<?xml version="1.0" encoding="UTF-8"?>','<gpx version="1.1" creator="Copilot" xmlns="http://www.topografix.com/GPX/1/1">','  <metadata>','    <name>Asia cities - CityQuiz share 2388991</name>',f'    <desc>{len(cities)} cities</desc>','  </metadata>']
for c in cities:
    lat=c.get('latitude'); lon=c.get('longitude')
    if lat is None or lon is None: continue
    name=c['name']
    parts=[c.get('state'), c.get('country')]
    desc=', '.join(x for x in parts if x)
    lines += ['  <wpt lat="{:.6f}" lon="{:.6f}">'.format(lat,lon),f'    <name>{escape(name)}</name>']
    if desc: lines.append(f'    <desc>{escape(desc)}</desc>')
    lines.append('  </wpt>')
lines.append('</gpx>')
out.write_text('\n'.join(lines)+'\n')
print('wrote:', out)
PY
python3 - <<'PY'
from xml.etree import ElementTree as ET
p='***REMOVED***.gpx'
root=ET.parse(p).getroot()
ns='{http://www.topografix.com/GPX/1/1}'
print('GPX waypoints:', len(root.findall(ns+'wpt')))
PY
ls -lh ***REMOVED***.gpx