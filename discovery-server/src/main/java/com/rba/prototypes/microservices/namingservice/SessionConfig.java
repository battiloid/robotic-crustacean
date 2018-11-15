package com.rba.prototypes.microservices.namingservice;

import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.session.web.context.AbstractHttpSessionApplicationInitializer;

/**
 * @author Adam Johnson <Adam.Johnson@rbaconsulting.com>
 * @since 11/13/2018
 */
@EnableRedisHttpSession
public class SessionConfig extends AbstractHttpSessionApplicationInitializer
{
}
