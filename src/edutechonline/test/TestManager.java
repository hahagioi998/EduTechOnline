package edutechonline.test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

import org.apache.log4j.Logger;

import edutechonline.test.suites.UserTests;

/***
 * Originally written for the Starexec project
 * @author: Eric Burns
 */

/**
 * This class maintains a list of all TestSequences and handles requests
 * for running those sequences. It prevents multiple instances of the same
 * TestSequence from being run simultaneously.
 * @author Eric Burns
 *
 */
public class TestManager {
	private static final Logger log = Logger.getLogger(TestManager.class);
	private final static AtomicBoolean isRunning=new AtomicBoolean(false);
	private final static AtomicBoolean isRunningStress=new AtomicBoolean(false);
	//this should never be modified outside of the initializeTests method
	private final static List<TestSets> tests=new ArrayList<TestSets>();
	//all test sequences need to be initialized here
	public static void initializeTests() {
		tests.add(new UserTests());
	}
	
	public static boolean areTestsRunning() {
		return isRunning.get();
	}
	
	public static boolean isStressTestRunning() {
		return isRunningStress.get();
	}
	
	/**
	 * Executes every test sequence in tests
	 * @return True if the tests were started, and false if they were not for some reason
	 */
	public static boolean executeAllTestSequences() {
		
		//don't do anything if the tests are already running
		if (!isRunning.compareAndSet(false, true)) {
			return false;
		}
		final ExecutorService threadPool = Executors.newCachedThreadPool();
		
		
		//we want to return here, not wait until all the tests finish, which is why we spin off a new threads
		threadPool.execute(new Runnable() {
			@Override
			public void run(){
				
				//we want to clear all the results first, so it's obvious to the user what is left to be run
				for (TestSets t : tests) {
					t.clearResults();
				}
				
				for (TestSets t : tests) {
					t.execute();
				}
				isRunning.set(false);
				reportResults();
			}
		});	
		return true;
	}
	
	public static List<TestSets> getAllTestSequences() {
		return tests;
	}
	public static List<TestResult> getAllTestResults(String sequenceName) {
		return TestManager.getTestSequence(sequenceName).getTestResults();
	}
	/**
	 * Executes the test that has the given name. If no such test exists, 
	 * returns false
	 * @param testName The name of the test that should be run
	 * @return True if the test could be found, false otherwise
	 */
	public static boolean executeTest(String testName) {
		
		//don't run anything if we are already going
		if (!isRunning.compareAndSet(false, true)) {
			return false;
		}
		final String t=testName;
		final ExecutorService threadPool = Executors.newCachedThreadPool();
		//we want to return here, not wait until all the tests finish, which is why we spin off a new thread
		threadPool.execute(new Runnable() {
			@Override
			public void run(){
				
				
				TestSets test = getTestSequence(t);
				test.clearResults();

				executeTest(test);
				isRunning.set(false);
			}
		});	
		
		return true;
	}
	
	
	/**
	 * Executes the given test sequence
	 * @param test
	 */
	public static void executeTest(TestSets test) {
		test.execute();
	}
	
	/**
	 * Returns the names of all TestSequences known to the manager
	 * @return
	 */
	public static List<String> getTestNames() {
		List<String> names=new ArrayList<String>();
		for (TestSets t : tests) {
			names.add(t.getName());
		}
		return names;
	}
	
	/**
	 * Gets the status of a TestSequence given its name
	 * @param testName The name of the TestSequence of interest
	 * @return
	 */
	public static TestStatus getTestStatus(String testName) {
		TestSets t = getTestSequence(testName);
		if (t==null) {
			return null;
		}
		return t.getStatus();
	}
	
	/**
	 * Gets back the message contained by a given TestSequence
	 * @param testName
	 * @return
	 */
	public static String getTestMessage(String testName) {
		TestSets t = getTestSequence(testName);
		if (t==null) {
			return null;
		}
		return t.getMessage();
	}
	
	/**
	 * Returns a TestSequence object 
	 * @param name
	 * @return
	 */
	private static TestSets getTestSequence(String name) {		
		for (TestSets t : tests) {
			if (t.getName().equals(name)) {
				return t;
			}
		}
		return null;
	}
	
	/**
	 * Writes out a report of every test sequence to the given file. File will be created if it doesn't exist.
	 * @param outputFile
	 */
	private static void reportResults() {
		
	}
}
