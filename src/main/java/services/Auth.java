package services;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dao.DaoS;
import model.Admin;


/**
 * 
 * @author rhexa
 * Authentication and authorization services
 */
@Path("/auth")
public class Auth {

	DaoS dao = new DaoS();
	
	@POST
	@Path("/login")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response doLogin(Admin adm) {	
		return dao.login(adm);
	}
	
	@Path("/fetch")
	public String updateToken() {
		return "";
	}
}
