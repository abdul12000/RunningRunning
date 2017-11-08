package internal.qaauto.inrunning.tom;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * Created by Harish Renukunta on 15/10/2014.
 */
public abstract class InRunningComponent implements InRunningComponentInterface {

    private WebElement component;

    @Override
    public WebElement getWebElement() {
        return component;
    }

    @Override
    public WebElement getChildWebElement(By childWebElementByObject) {
        final List<WebElement> childWebElements = component.findElements(childWebElementByObject);
        if(childWebElements == null || childWebElements.size() == 0){
            return null;
        }
        return childWebElements.get(0);
    }

    protected void setComponent(final WebElement component){
        this.component = component;
    }

    protected WebElement getComponent(){
        return component;
    }
}
