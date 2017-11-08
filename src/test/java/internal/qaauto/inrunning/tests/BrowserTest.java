package internal.qaauto.inrunning.tests;

import internal.qaauto.framework.drivers.browserDriver.BrowserDriverFactory;
import internal.qaauto.framework.drivers.browserDriver.interfaces.BrowserDriver;
import org.testng.annotations.Test;



public class BrowserTest {

    @Test
    public void browserTest() throws Exception {
        final BrowserDriver browser = BrowserDriverFactory.getDriver("gc");
        browser.get("http://www.google.co.uk");
        Thread.sleep(10000);
    }

}