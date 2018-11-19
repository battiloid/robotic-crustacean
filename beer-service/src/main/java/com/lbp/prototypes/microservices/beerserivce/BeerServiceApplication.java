package com.lbp.prototypes.microservices.beerserivce;

import com.lbp.prototypes.microservices.beerserivce.domain.Beer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;


@SpringBootApplication
@EnableDiscoveryClient
@RestController
@RequestMapping("/beers")
public class BeerServiceApplication
{

    public static void main(String[] args)
    {
        SpringApplication.run(BeerServiceApplication.class, args);
    }

    private List<Beer> beerList = Arrays.asList(
            new Beer(1L, "Darkness", 11L), //
            new Beer(2L, "War and Peace", 12L), //
            new Beer(3L, "Ten-Fiddy", 13L), //
            new Beer(4L, "Trogdor The Burninator", 14L) //
    );

    @GetMapping("")
    public List<Beer> all() {
        return beerList;
    }

    @GetMapping("/{beerId}")
    public Beer findById(@PathVariable Long beerId) {
        return beerList.stream().filter(b -> b.getId().equals(beerId)).findFirst().orElse(null);
    }

}


