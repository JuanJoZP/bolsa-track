# Bolsa Track

### Herramienta de filtración, búsqueda y analisis simple de acciones, para una mejor toma de decisiones en el mundo de las inversiones. [Documento del proyecto](https://docs.google.com/document/d/e/2PACX-1vQzJl3uQGNAI6XQxwH4lfCOflyYzW3lcW7k0ESsl4JBdMdEIeIWIV4KNBE4zLcR6Jid4I1ZDoibcoEQ/pub)

## Instalación Rapida

- Clonar el repositorio `git clone https://github.com/JuanJoZP/bolsa-track`
- Instalar las librerias requeridas `pip install requirements.txt`
- Copiar la carpeta `datos_estaticos` y pegarla en `C:\`
- Crear una base de datos en postgresql que se llame `bolsa-track`
- Ejecutar `creacion.sql` en la base de datos
- Ejecutar `carga_masiva.sql` en la base de datos
- Ejecutar en consola `python main.py conectar postgres CONTRASEÑA`
- Ejecutar en consola `python main.py consultar --help`
