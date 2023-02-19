package com.solvd.citytransportationsystemproject.myBatisRunner;

import java.io.IOException;
import java.io.Reader;
import java.util.logging.Logger;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class MyBatisRunner {
    static Logger logger = Logger.getLogger(MyBatisRunner.class.getName());
    private static SqlSessionFactory sqlSessionFactory;
    static {
        try {
            String resource = "/TransportionSystem/src/main/resources/config.xml";
            Reader reader = Resources.getResourceAsReader(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            logger.info(String.valueOf(e));
        }
    }
    public static SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }
}
