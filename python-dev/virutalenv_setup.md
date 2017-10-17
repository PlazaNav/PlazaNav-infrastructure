# Virtualenv setup
- Virtualenv muss installiert sein
```bash
pip3 install virtualenv
```
- Virtualenv im Verzeichnis aktivieren, dann ist es in der aktuellen Shell aktiv
```bash
source venv/bin/activate

# deaktivieren
deactivate
```
- Requirements installieren
```bash
pip3 install -r requirements.txt
```

## iPython Notebook mit virtualenv
Quelle: <http://help.pythonanywhere.com/pages/IPythonNotebookVirtualenvs>

Alles im aktivieren virtualenv:

```bash
pip3 install ipykernel
python3 -m ipykernel install --user --name=venv
```

In einem offenen iPython Notebook kann man nun den Kernel auf `venv` ändern
