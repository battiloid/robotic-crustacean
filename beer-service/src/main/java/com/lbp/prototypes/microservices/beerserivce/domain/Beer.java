package com.lbp.prototypes.microservices.beerserivce.domain;

import org.springframework.data.annotation.Id;

/**
 * @author Adam Johnson <Adam.Johnson@rbaconsulting.com>
 * @since 11/13/2018
 */

public class Beer
{
    private Long id;
    private String beerName;
    private Long beerMakerId;

    public Beer(Long id, String beerName, Long beerMakerId)
    {
        this.id = id;
        this.beerName = beerName;
        this.beerMakerId = beerMakerId;
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getBeerName()
    {
        return beerName;
    }

    public void setBeerName(String beerName)
    {
        this.beerName = beerName;
    }

    public Long getBeerMakerId()
    {
        return beerMakerId;
    }

    public void setBeerMakerId(Long beerMakerId)
    {
        this.beerMakerId = beerMakerId;
    }
}
