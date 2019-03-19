package com.github.dljulong.cloud.smartauth.scheduler;

import com.github.dljulong.cloud.smartauth.mq.Sender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Processor;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

/**
 * Title: MqScheduler
 * <p>Description: </p>
 *
 * @author lijinliang
 * Date: 2019/3/18 16:26
 */
@EnableBinding(Processor.class)
@EnableScheduling
public class MqScheduler {
    @Autowired
	private Sender sender;
	@Scheduled(cron = "1 */1 * * * ?")
	public void testMq1(){
		System.out.println("");
		sender.sendString();
	}
}
