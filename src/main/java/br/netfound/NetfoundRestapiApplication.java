package br.netfound;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @author marcony.souza
 *
 */

@SpringBootApplication
public class NetfoundRestapiApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(NetfoundRestapiApplication.class, args);
	}

}
