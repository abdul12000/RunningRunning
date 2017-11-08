package internal.qaauto.inrunning.tom.coupons;

import internal.qaauto.inrunning.tom.InRunningComponent;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * Created by Harish Renukunta on 06/10/2014.
 */
public abstract class LeftNavEventImpl extends InRunningComponent implements LeftNavEvent {

    public static final String H5_TAG = "h5";

    private By nameLocator = new By.ByCssSelector(H5_TAG);

    @Override
    public String getSport() {
        return null;
    }

    @Override
    public String getLeftNavEventDescription() {
        List<WebElement> descriptionWebElements = getWebElement().findElements(nameLocator);
        if(descriptionWebElements == null){
        	return null;
        }
        return descriptionWebElements.get(0).getText();
    }

    @Override
    public void collapse() {

    }

    @Override
    public void expand() {

    }

    @Override
    public boolean isCollapsed() {
        return false;
    }

    @Override
    public String getName(){
        List<WebElement> nameWebElements = getWebElement().findElements(nameLocator);
        if(nameWebElements == null || nameWebElements.size() == 0){
            return StringUtils.EMPTY;
        }
        return nameWebElements.get(0).getText();
    }

    @Override
    public void select(){
        getWebElement().click();
    }

    @Override
    public boolean isHighlighted(){
        return getWebElement().getAttribute("class").contains("selected");
    }

}
