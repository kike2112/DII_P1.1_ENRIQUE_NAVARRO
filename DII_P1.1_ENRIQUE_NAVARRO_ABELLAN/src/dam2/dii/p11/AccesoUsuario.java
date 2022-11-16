package dam2.dii.p11;

import java.io.IOException;
import java.util.HashMap;
import java.util.Scanner;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AccesoUsuario
 */
@WebServlet("/AccesoUsuario")
public class AccesoUsuario extends HttpServlet {
	
	private static final HashMap<String, Usuario> BDD = new HashMap<String, Usuario>(); // Creo una Base de Datos accesible a todas las funciones

	private static final long serialVersionUID = 1L;
	
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccesoUsuario() {
        super();
		BDD.put("admin", new Usuario("admin","admin",3)); // Se rellena la Base de Datos (nombre, contraseña e intentos)
		BDD.put("a", new Usuario("a","a",3));
		BDD.put("b", new Usuario("b","b",3));
		BDD.put("c", new Usuario("c","c",3));
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario user = null;
		String nombre = request.getParameter("nombre");
		String pass = request.getParameter("pass");
		String pass2 = request.getParameter("pass2");
		String opcion = request.getParameter("opcion");
		if (opcion == null) {
			opcion = "";
		}	
		if (opcion.equals("registro")){ //Deriva a la vista de registro
			if (!nombre.equals("null")) {
				request.setAttribute("nombre", nombre);
			}
			request.getRequestDispatcher("/jsp/registro.jsp").forward(request, response);
		} else if (opcion.equals("agregar")) { //Formaliza el registro y lo añade a la Base de Datos, luego la manda a la vista de bienvenida.
			if (!BDD.containsKey(nombre)) {	
				if (pass.equals(pass2)) {
					user = new Usuario(nombre, pass, 3);
					BDD.put(user.getNombre(), user);
					request.setAttribute("user", user);
					request.getRequestDispatcher("/jsp/bienvenida.jsp").forward(request, response);
				} else {
					request.setAttribute("error_pass", "No coinciden las contraseñas.");
					request.getRequestDispatcher("/jsp/registro.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("error_nombre", "El nombre \"" + nombre + "\" ya está registrado");
				request.getRequestDispatcher("/jsp/registro.jsp").forward(request, response);
			}
		} else { //El apartado de Login. Hace comprovaciones y hasta que de loguea correctamente o lo manda al registro
			nombre = request.getParameter("nombre");
			request.setAttribute("nombre", nombre);				
			if (existeNombreEnBdd(nombre, BDD) && estaBloqueado(nombre, BDD)) {
				request.setAttribute("error_nombre", "El usuario \"" + nombre + "\" está bloqueado.");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else if (existeNombreEnBdd(nombre, BDD) && !pass.equals(pass2)) {
				request.setAttribute("error_pass", "No coinciden las contraseñas.");
				request.getRequestDispatcher("/index.jsp").forward(request, response);		
			} else if (existeNombreEnBdd(nombre, BDD) && pass.equals(pass2)) {
				if (claveCoincide(nombre, pass, BDD)) {
					user = new Usuario(nombre, pass, 3);
					request.setAttribute("user", user);
					request.getRequestDispatcher("/jsp/bienvenida.jsp").forward(request, response);
				} else {
					if (!nombre.equals("admin")) {
						BDD.get(nombre).setIntentos(BDD.get(nombre).getIntentos()-1);
					}	
					if (BDD.get(nombre).getIntentos() == 0) {
						request.setAttribute("error_nombre", "Usuario \""+ nombre +"\" bloqueado.");
					} else if (BDD.get(nombre).getIntentos() > 0) {
						request.setAttribute("error_pass", "Incorrecto. Le quedan "+ BDD.get(nombre).getIntentos() +" intentos.");
					}
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
			} else if (nombre.length() > 0) {
				request.setAttribute("error_nombre", "No existe el usuario \"" + nombre + "\".");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				request.setAttribute("error_nombre", "Introduce un usuario.");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		}
	}
	
	private boolean existeNombreEnBdd(String nombre, HashMap<String, Usuario> bdd) {
		boolean existe_nombre = bdd.containsKey(nombre);
		return existe_nombre;
	}
	private boolean claveCoincide(String nombre, String pass, HashMap<String, Usuario> bdd) {
		boolean coincide = false;
		if (pass.equals(bdd.get(nombre).getPass())) {
			coincide = true;
		}
		return coincide;
	}
	private static boolean estaBloqueado(String nombre, HashMap<String, Usuario> bdd) {
		boolean esta_bloqueado = false;
		esta_bloqueado = bdd.get(nombre).getIntentos() <= 0;
		return esta_bloqueado;
	}
}
