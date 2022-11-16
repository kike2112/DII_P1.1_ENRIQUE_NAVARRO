He creado tres vistas:
1. LOGIN
2. REGISTRO	-	
3. BIENVENIDA

Cosas a destacar de cada vista:

1. LOGIN
	- Muestra alerta cuando:
		· Los campos no están rellenos e intentas acceder.
		· Cuando el usuario no existe.
		· Cuando la contraseña es inválida
		· Cuando las contraseñas no coinciden.
	- Se permiten 3 intentos para acceder a la página antes de ser bloqueado, salvo en el caso del admin, que no lo bloquea. Estos intentos no se modifican en caso de que las contraseñas no coincidan.
	- Permiten cancelar el logueo sin almacenar los parámetros
	- Dispone de un enlace a la página de registro.
	
2. REGISTRO
	- Si entras después de un acceso denegado porque el usuario no existe mantiene en el formulario el nombre del intento anterior. Si entras directamente no solo muestra el placehorder.
	- Puedes volver a la página de inicio en cualquier momento.
	- Todos los campos son requeridos para el registro.
	- Muestra alerta cuando: 
		· Los campos no están rellenos.
		· Cuando el usuario ya existe.
		· Cuando las contraseñas no coinciden.
	- Almacena los datos en un objeto usuario.
	- Incluye otro campo fecha de nacimiento. Para permitir el registro solo a mayores de edad.

3. BIENVENIDA
	- Al acceder se le pasa un usuario y mustra el saludo con su nombre.
	- Se llega aquí tras un Login o Registro exitosos.



Cosas a destacar de la práctica en general:
	- He creado una constante accesible a todos sus métodos dentro del Servlet, que he utilizado para rellenarla con usuarios predefinidos al iniciar el programa.
	- En un principio había creado dos Servlets, uno para el Login y otro para el registro, pero tenía problemas para consultar la Base de Datos y modificarla desde ambos y opté por unificar todo desde el mismo Servlet. Posiblemente hubiera sido mejor creando un fichero, pero se acercaba mucho a la práctica de ADD y quise probar otra forma.
	- Al final lo he gestionado todo desde un solo controlador, que actúa según la opción solicitada. A través de la url le paso la opción elegida según el botón que pulse.
	- He utilizado CSS para todas las vistas.
	- He añadido las posibilidad de bloquear usuarios y el registro.
	
