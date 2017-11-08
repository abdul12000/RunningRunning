package internal.qaauto.inrunning.tom.leftnav;

import com.google.common.base.Function;
import internal.qaauto.inrunning.tom.InRunningComponent;
import internal.qaauto.inrunning.tom.coupons.*;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;

import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Harish Renukunta on 07/10/2014.
 */

public abstract class SportImpl extends InRunningComponent implements Sport {

    private static final String COUPON_SELECTOR = ":scope>ul>li";

    private By couponLocator = new By.ByCssSelector(COUPON_SELECTOR);

    private static final String TITLE_SELECTOR = "h4";

    private By titleLocator = new By.ByCssSelector(TITLE_SELECTOR);

    private static final String EVENT_COUNT_REGEX = "(\\d+)";

    @Override
    public String getTitle() {
        String title = getHeader();
        if (title.indexOf("(") > 0) {
            title = title.substring(0, title.indexOf("(") - 1);
        }
        return title;
    }

    private String getHeader() {
        List<WebElement> titleWebElements = getWebElement().findElements(titleLocator);
        if (titleWebElements == null || titleWebElements.size() == 0) {
            return StringUtils.EMPTY;
        }
        return titleWebElements.get(0).getText();
    }

    @Override
    public List<LeftNavEvent> getEvents() {
        final WebElement sportContainerWebElement = getWebElement();
        final List<WebElement> couponWebElements = sportContainerWebElement.findElements(couponLocator);

        if (couponWebElements == null || couponWebElements.size() == 0) {
            return null;
        }
        final List<LeftNavEvent> sportContainerCoupons = new LinkedList<LeftNavEvent>();
        for (WebElement couponWebElement : couponWebElements) {
            sportContainerCoupons.add(newLeftNavEvent(couponWebElement));
        }
        return sportContainerCoupons;
    }

    public abstract LeftNavEventImpl newLeftNavEvent(WebElement couponWebElement);

    @Override
    public void collapse() {
        if (isCollapsed() == Boolean.FALSE) {
            getTitleWebElement().click();
        }
    }

    @Override
    public void expand() {
        if (isCollapsed()) {
            getTitleWebElement().click();
        }
    }

    private WebElement getTitleWebElement() {
        return getWebElement().findElement(titleLocator);
    }

    @Override
    public boolean isCollapsed() {
        List<LeftNavEvent> leftNavEvents = getEvents();
        if (leftNavEvents == null) {
            return Boolean.TRUE;
        }
        for (LeftNavEvent leftNavEvent : leftNavEvents) {
            if (leftNavEvent.getWebElement().isDisplayed() == Boolean.TRUE) {
                return Boolean.FALSE;
            }
        }
        return Boolean.TRUE;
    }

    @Override
    public LeftNavEvent getLeftNavEventByName(final String name) {
        expand();
        List<LeftNavEvent> leftNavEvents = getEvents();
        if (leftNavEvents == null) {
            return null;
        }
        for (LeftNavEvent leftNavEvent : leftNavEvents) {
            if (name.equals(leftNavEvent.getName())) {
                return leftNavEvent;
            }
        }
        return null;
    }

    public LeftNavLiveNowEvent getLiveNowEventByName(final String name) {
        FluentWait<String> fWait = new FluentWait<String>(name);
        fWait.pollingEvery(500, TimeUnit.MILLISECONDS)
                .withTimeout(5, TimeUnit.SECONDS);
        LeftNavEvent leftNavEvent = fWait.until(new Function<String, LeftNavEvent>() {
            @Override
            public LeftNavEvent apply(final String name) {
                System.out.println("Explicit Wait");
                final LeftNavEvent navEvent = getLeftNavEventByName(name);
                if (navEvent != null && navEvent.getWebElement().isDisplayed()) {
                    return navEvent;
                }
                return null;
            }
        });
        if (leftNavEvent == null) {
            return null;
        }
        if (leftNavEvent instanceof LeftNavLiveNowEventImpl) {
            return (LeftNavLiveNowEventImpl) leftNavEvent;
        }
        return null;
    }

    public LeftNavUpcomingEvent getUpcomingEventByName(final String name) {
        LeftNavEvent leftNavEvent = getLeftNavEventByName(name);
        if (leftNavEvent == null) {
            return null;
        }
        if (leftNavEvent instanceof LeftNavUpcomingEventImpl) {
            return (LeftNavUpcomingEventImpl) leftNavEvent;
        }
        return null;
    }

    public List<LeftNavLiveNowEvent> getLiveNowEvents() {
        List<LeftNavEvent> coupons = getEvents();
        if ((coupons == null) || (coupons.size() == 0) || (coupons.get(0) instanceof LeftNavUpcomingEventImpl)) {
            return null;
        }
        return (List<LeftNavLiveNowEvent>) (List<?>) coupons;
    }

    public List<LeftNavUpcomingEvent> getUpcomingEvents() {
        List<LeftNavEvent> navEvents = getEvents();
        if ((navEvents == null) || (navEvents.size() == 0) || (navEvents.get(0) instanceof LeftNavLiveNowEventImpl)) {
            return null;
        }
        return (List<LeftNavUpcomingEvent>) (List<?>) navEvents;
    }

    public int getEventsCountFromHeader() {
        final String title = getHeader();
        final String regEx = EVENT_COUNT_REGEX;
        final Pattern pattern = Pattern.compile(regEx);
        final Matcher matches = pattern.matcher(title);
        final int eventCount;
        if (matches.find()) {
            eventCount = Integer.parseInt(matches.group(0));
        } else {
            eventCount = -1;
        }
        return eventCount;
    }

}
