package com.lbp.prototypes.microservices.ratingserver;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * @author Adam Johnson <Adam.Johnson@rbaconsulting.com>
 * @since 11/13/2018
 */
@Configuration
@EnableWebSecurity
@Order(1)
public class SecurityConfig extends WebSecurityConfigurerAdapter
{

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception
    {
        auth.inMemoryAuthentication()
                .withUser("user")
                .password("password")
                .roles("USER")
                .and()
                .withUser("admin")
                .password("admin")
                .roles("ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception
    {
        http.httpBasic()
                    .disable()
                .authorizeRequests()
                    .antMatchers("/ratings")
                    .hasRole("USER")
                    .antMatchers("/ratings/all")
                    .hasAnyRole("USER", "ADMIN")
                    .anyRequest()
                    .authenticated()
                    .and()
                .csrf()
                    .disable();
    }
}