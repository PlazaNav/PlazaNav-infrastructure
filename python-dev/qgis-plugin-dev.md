# QGIS Plugin Dev Setup
## Requirements
- PyQt4
- Qt-Creator (beinhaltet Qt-Designer)
- make

## Setup
- Virtualenv erstellen
- `pip install -r requirements-dev.txt`
- Um tests auszuführen: `make test`

## In QGIS installieren
- `make deploy` kopiert das Plugin in QGIS
- In QGIS muss es im Plugin-Manager noch aktiviert werden
- Das Plugin `Plugin Reloader` installieren, um nicht immer QGIS neustarten zu müssen, wenn das Plugin neu deployed wird

## Debugging mit PyCharm
- Diesen Code in `plaza_route.py` platzieren
```python
# Pfad anpassen
pycharm_egg = '/opt/pycharm/debug-eggs/pycharm-debug.egg'
if pycharm_egg not in sys.path:
    sys.path.append(pycharm_egg)
import pydevd
pydevd.settrace('localhost', port=53100, stdoutToServer=True, stderrToServer=True)
```

- In PyCharm Debugging einrichten
    - `Run` - `Edit Configurations` - `Add new Configuration`
    - Typ: `Python Remote Debug`
    - Port: `53100`
- Nun normal das Plugin deployen: `make deploy`
- Den Debugger starten und im QGIS das Plugin neu laden