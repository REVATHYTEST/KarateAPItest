package com.tests;
import com.intuit.karate.junit5.Karate;
public class TestRunner {
  @Karate.Test
  Karate geAPITest() {
	  return Karate.run("newAssessment").relativeTo(getClass());
  }
  
}
