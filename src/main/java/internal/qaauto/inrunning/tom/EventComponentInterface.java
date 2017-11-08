package internal.qaauto.inrunning.tom;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

/**
 * Created by Harish Renukunta on 15/10/2014.
 */
public interface EventComponentInterface {

    public WebElement getWebElement();

    public WebElement getChildWebElement(By childElementByObject);
}
