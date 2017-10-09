# Apuntes sobre la charla

## Prueba de Wannacry en maquina virtual windows.  

- Enseñar los archivos sin encriptar.
- Enseñar la carpeta temporal de Windows con el script de Telefónica.
- Cambiar la execution policy:  
   ```ps1
      Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
   ```
- Ejecutar Wannacry.  
- Ver que los archivos se han encriptado.
- Ejecutar el script de Telefónica.

### Explicación script Telefónica
El script se copia en la carpeta de archivos temporales del usuario donde deben encontrarse los archivos renombrados por Wannacry.  
En este punto los archivos no están realmente encriptados sino que se les ha cambiado el formato a un archivo con extensión WNRY. Cuando ejecutamos el script de Telefónica, éste se limita a comprobar la cabecera de los archivos para identificar el tipo de archivo que era y restaurar así sus propiedades para que queden libres.

## Funcionamiento detallado de Wannacry
