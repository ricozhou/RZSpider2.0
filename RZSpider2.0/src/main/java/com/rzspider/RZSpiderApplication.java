package com.rzspider;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 启动程序
 * 
 * @author ricozhou
 */
@SpringBootApplication
@EnableTransactionManagement
@MapperScan("com.rzspider.*.*.*.mapper")
public class RZSpiderApplication {
	public static void main(String[] args) {
		SpringApplication.run(RZSpiderApplication.class, args);
		System.out.println(" 瑞Spider启动成功 \n" 
				+"  .---------.                .-----------.              .-----------.                   \n"
				+" |           \\               | _ _ __    |              |   _ _ _ _ |                  \n"
				+" |    ---     \\                      /  /               |  |                           \n"
				+" |   ( ' )    |                     /  /                |  |                            \n"
				+" |  (_ o _)   /                    /  /                 |  |_ _ _ _                     \n"
				+" |   (_,_) . '   __               /  /                  | _ _ _ _   |                   \n"
				+" |   |  \\  \\    |  |             /  /                            |  |                 \n"
				+" |   |   \\  \\   /  /            /  /                             |  |                 \n"
				+" |   |    \\  \\ /  /            /  /                              |  |                 \n"
				+" |   |     \\  `  /            /  /_ _ _ __              .--------'  |                  \n"
				+" ''-''      `'-'             |_ _ _ _ _ __|             |_ _ _ _ _ _|                    ");
				 

	}
}