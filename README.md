# README

EL link de la pagina es www.juanpabloensegundos.cl (tiene ese nombre extraño porque hize uso de un dominio que mi polola compro hace un tiempo y nunca uso)
 
 
 DEPLOYMENT
  Fue subido a heroku junto a las contraseñas de paypal y mailgun que fueron guardadas en la aplicacion
  
  Ya que tengo instalado YARN, cree buildpacks de nodejs y de ruby (en ese orden)
  
  Fue creado el siguiente stack: heroku stack:set heroku-18
  
  El dominio fue comprado en nic.cl
  
  Los links de la pagina estan alojados en cloudflare
  
  --------------------------------------------------------------------------------------------------------------------------------------
  
  COnfiguracion y puesta en marcha: En la configuracion estan agregados los servicios de paypal y mailgun. Tanto en desarrollo como produccion. Las variables de entorno estan guardadas en heroku y en .profile (sudo nano ~/.profile)
  
  Los servidores de cloudflare estan alojados en: brynne.ns.cloudflare.com y craig.ns.cloudflare.com
