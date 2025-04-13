# Spring Pet Clinic: Convirgance Edition

The [Spring Pet Clinic](https://github.com/spring-projects/spring-petclinic) example application ported from SpringMVC to 
Convirgance (Web Services) technology. Ironically, Spring XML IoC container is used by Convirgance (Web Services), so
this is still a Spring application!

![Pet Clinic Screenshot](https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png)

## Status

The backend has been ported and reduced to only configuration files. All Java code has disappeared from the project. This is due
the simplicity of the Pet Clinic example. Real-world applications would have _some_ Java code. Even if it's a lot less than a
typical application.

The front-end is intact and ported from Thymeleaf to JSP + Vanilla Javascript.

# Try It

You can try it online at https://examples.convirgance.com/clinic/

# Requirements

You'll need a Servlet 3.0 compliant application server to install. Only Glassfish and Tomcat have been tested so far. However, other Jakarta EE compliant servers should work just fine.

# More Info

You can learn more about Convirgance at: https://www.convirgance.com
