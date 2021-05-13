package com.teamfive.nettest;

import com.teamfive.nettest.configuration.property.SystemConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author TeamFive|LYL\LMX\GYD
 */
@SpringBootApplication
@EnableTransactionManagement
@EnableConfigurationProperties(value = { SystemConfig.class})
@EnableCaching
public class LoaderApplication {

    public static void main(String[] args) {

        SpringApplication.run(LoaderApplication.class, args);
    }
}
