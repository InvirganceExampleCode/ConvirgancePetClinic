# Spring Pet Clinic: Convirgance Edition

The [Spring Pet Clinic](https://github.com/spring-projects/spring-petclinic) example application ported from SpringMVC to 
Convirgance (Web Services) technology. Ironically, Spring XML IoC container is used by Convirgance (Web Services), so
this is still a Spring application!

![Pet Clinic Screenshot](https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png)

## Status

The backend has been ported and reduced to only configuration files. All Java code has disappeared from the project. This is due
the simplicity of the Pet Clinic example. Real-world applications would have _some_ Java code. Even if it's a lot less than a
typical application.

The front-end is intact and ported to JSP + Vanilla Javascript. The rendered pages were basically copied as-is rather than porting
the Thymeleaf templates. This makes the HTML a bit bigger than the original, even though it produces the same rendered code. (More 
or less.) The front-end will be a point of focus in the future to see how that can be reduced, but for now it's a pretty naive
port.

# Requirements

Convirgance (Web Services) is not yet in release or pre-release. So if you want to build this, you'll need to download and build
the [convirgance-web](https://github.com/InvirganceOpenSource/convirgance-web) project. 

You'll also need a Servlet 3.0 compliant application server. Only Glassfish has been tested so far. However, Tomcat and others
should work just fine.

# More Info

You can learn more about Convirgance at: https://www.convirgance.com
