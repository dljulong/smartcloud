package com.github.dljulong.cloud.smartadmin.mq;

import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.cloud.stream.messaging.Processor;
import org.springframework.cloud.stream.messaging.Sink;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.MessageChannel;

/**
 * Title: StreamConfigutation
 * <p>Description: </p>
 *
 * @author lijinliang
 * Date: 2019/3/14 10:24
 */
//@EnableBinding(Processor.class)
public class StreamConfigutation {
	@StreamListener(Processor.INPUT)
	public void handle(String s) {
		System.out.println("Received: " + s);
	}


}
