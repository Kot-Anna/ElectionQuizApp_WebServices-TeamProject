package services;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Path("/test")
public class test {

	@GET
	public String test() {
		return "Only testing";
	}
}
