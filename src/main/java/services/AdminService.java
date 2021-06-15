package services;

import javax.validation.constraints.Pattern;
import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Path("/adminservice")
public class AdminService {
	
//	Private
	@GET
	@Path("/read")
	public String readAdmin() {
		return "";
	}
	
}
