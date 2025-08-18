# Spring Pet Clinic: Convirgance Edition

The [Spring Pet Clinic](https://github.com/spring-projects/spring-petclinic) example application ported from SpringMVC to 
[Convirgance (Web Services)](https://github.com/InvirganceOpenSource/convirgance-web/) technology.

<img width="2090" height="1244" alt="Pet Clinic Screenshot" src="https://github.com/user-attachments/assets/aaa86140-1d21-47bb-8f29-ea7a33da020c" />

## Status

The backend has been ported and reduced to only configuration files. All Java code has disappeared from the project. This is due
the simplicity of the Pet Clinic example. Real-world applications would have _some_ Java code. Even if it's a lot less than a
typical application.

The front-end is intact and ported from Thymeleaf to JSP pages and a Hypermedia Application (HDA) view for the REST components.

## Try It

You can try it online at https://examples.convirgance.com/clinic/

## Requirements

You'll need a Servlet 3.0 compliant application server to deploy the `.war` version. 

Alternatively, you can run the Convirgance (Boot) version by running `java -jar target/ConvirgancePetClinic.jar`. Pass `-p <port>` if port `8080` is unavailable.

# Docker Deployment

After building the Java version, you can build the Docker Container by running `docker build .`

## More Info

You can learn more about Convirgance at: https://www.convirgance.com
