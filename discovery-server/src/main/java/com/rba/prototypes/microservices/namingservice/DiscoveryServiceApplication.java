package com.rba.prototypes.microservices.namingservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * @author Adam Johnson <Adam.Johnson@rbaconsulting.com>
 * @since 11/7/2018
 */
@EnableEurekaServer
@SpringBootApplication
public class DiscoveryServiceApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(DiscoveryServiceApplication.class, args);
    }
}
