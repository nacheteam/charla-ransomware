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
Es importante el hecho de que la infección comenzó un viernes.  
Comienza la infección de cualquier modo. Sólo se necesita una persona infectada en la red para que comience la infección de todo el mundo gracias a eternalblue.  
El killswitch: http://iuqerfsodp9ifjaposdfjhgosurijfaewrwergwea.com/  
Tor: rphjmypwmfvx6v2e.onion
     sqjolphimrr7jqw6.onion
     gx7ekbenv2riucmf.onion
     57g7spgrzlojinas.onion
     xxlvbrloxvriy2c5.onion
     76jdd2ir2embyv47.onion
     cwwnhwhlz52maqm7.onion

Se genera un par de claves RSA 2048 bits que son para el cliente (C_priv,C_pub). En el binario está la clave pública del servidor "hardcodeada" (S_pub).  
El servidor central que controla los pagos y envía las claves para desencriptar es un tor hidden service.  
C_priv es encriptada con S_pub. Se genera una clave AES K_f que se usa para encriptar los archivos y posteriormente se encipta con C_pub.  
Cada archivo tiene su propia K_f y se almacena el archivo y la clave K_f encriptada con C_pub como una pareja para poder revertir el proceso.
La única manera de revertir el proceso sería tener C_priv y es para eso para lo que se pide pagar el ransomware.  
AES es capaz de encriptar 700MB/sec por lo que sería tan rápido que no nos daría tiempo a parar el proceso si no lo sabemos de antemano.

## EternalBlue
La vulnerabilidad se basa en un fallo del protocolo SMB que sirve para compartir ficheros entre máquinas Windows (no exclusivamente). La vulnerabilidad comienza cuando un atacante manda una transacción de tamaño enorme llena de NOPs (0000xF). De esta forma el protocolo lo divide en varias transacciones ya que no puede operar con mensajes tan largos. Estas transacciones secundarias están mal formadas y no siguen el protocolo debido al mensaje inicial. En la cabecera de dichos mensajes (que es leida y ejecutada) se coloca de forma artificial el código del malware con lo que la máquina que lea el mensaje también será infectada.
