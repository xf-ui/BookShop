package czu.qty.bookshop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan(basePackages = "czu.qty.bookshop.mapper")
@SpringBootApplication
public class BookshopApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(BookshopApplication.class, args);
    }



}
