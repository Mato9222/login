package com.teamtodev;

import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.transaction.annotation.Transactional;

// /groobear/src/main/resources/com/teamtodev/spring/conf/aop-context.xml
@SpringJUnitWebConfig(locations = "file:src/main/resources/com/teamtodev/spring/conf/*-context.xml")
public abstract class AbstractRootContextTest {

}
