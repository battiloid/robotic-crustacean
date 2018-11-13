package com.lbp.prototypes.microservices.bookserver.domain;

/**
 * @author Adam Johnson <Adam.Johnson@rbaconsulting.com>
 * @since 11/13/2018
 */
public class Book {
    private Long id;
    private String author;
    private String title;

    public Book(Long id, String author, String title)
    {
        this.id = id;
        this.author = author;
        this.title = title;
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getAuthor()
    {
        return author;
    }

    public void setAuthor(String author)
    {
        this.author = author;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }
}
