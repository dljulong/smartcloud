package com.julong.cloud.module_auth;

import java.util.concurrent.*;

public class ThreadPoolExecutorTest {
 public static void main(String[] args) {
      test1();
 }
 public static void test2() {
  ScheduledExecutorService scheduledThreadPool = Executors.newScheduledThreadPool(5);
  scheduledThreadPool.schedule(new Runnable() {
   public void run() {
    System.out.println("delay 3 seconds");
   }
  }, 3, TimeUnit.SECONDS);
 }


 public static void test1() {
  ExecutorService fixedThreadPool = Executors.newFixedThreadPool(3);
 final CountDownLatch countDownLatch = new CountDownLatch(10);
  for (int i = 0; i < 10; i++) {
   final int index = i;
   fixedThreadPool.execute(new Runnable() {
    public void run() {
     try {
      System.out.println(index);
      Thread.sleep(2000);
      countDownLatch.countDown();
     } catch (InterruptedException e) {
      e.printStackTrace();
     }
    }
   });
  }
  try {
   countDownLatch.await();
  } catch (InterruptedException e) {
   e.printStackTrace();
  }
  fixedThreadPool.shutdown();
 }


}

