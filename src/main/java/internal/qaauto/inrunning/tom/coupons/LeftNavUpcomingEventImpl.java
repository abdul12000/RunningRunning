package internal.qaauto.inrunning.tom.coupons;

import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Harish Renukunta on 06/10/2014.
 */
public class LeftNavUpcomingEventImpl extends LeftNavEventImpl implements LeftNavUpcomingEvent {

    private final static String TIME_SELECTOR = ":scope>p";

    private By timeLocator = new By.ByCssSelector(TIME_SELECTOR);

    public LeftNavUpcomingEventImpl(final WebElement couponWebElement) {
        setComponent(couponWebElement);
    }

    @Override
    public String getTitle() {
        return getWebElement().getText();
    }

    @Override
    public String getTime() {
        final List<WebElement> timeWebElements = getWebElement().findElements(timeLocator);
        if (timeWebElements == null || timeWebElements.isEmpty()) {
            return StringUtils.EMPTY;
        }
        return timeWebElements.get(0).getText();
    }

    @Override
    public boolean isTextDisplayedInBottomRow(String message) {
        final String messageRegex = "[01]?[0-9]:[0-5][0-9][pa] " + message;
        final Pattern messagePattern = Pattern.compile(messageRegex);
        final Matcher messageMatcher = messagePattern.matcher(getTime());
        boolean messageDisplayed = Boolean.FALSE;
        if (messageMatcher.find()) {
            messageDisplayed = Boolean.TRUE;
        }
        return messageDisplayed;
    }

}
