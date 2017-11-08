package internal.qaauto.inrunning.tom;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * Created by Harish Renukunta on 15/10/2014.
 */
public class EventComponent implements EventComponentInterface {

    WebElement couponComponent;

    public EventComponent(final WebElement couponArea){
        couponComponent = couponArea;
    }

    @Override
    public WebElement getWebElement() {
        return couponComponent;
    }

    @Override
    public WebElement getChildWebElement(final By childElementByObject) {
        List<WebElement> childWebElements = couponComponent.findElements(childElementByObject);
        if(childWebElements == null || childWebElements.size() == 0){
            return null;
        }
        return childWebElements.get(0);
    }
}
