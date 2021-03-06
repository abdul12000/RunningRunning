package internal.qaauto.inrunning.tom.markets;

import internal.qaauto.framework.testCase.webTestsCase.BaseTestCase;
import internal.qaauto.inrunning.tom.InRunningComponent;
import internal.qaauto.inrunning.tom.Utilties.OutcomeStatus;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Harish Renukunta and rkora
 */
public class MarketOutcomeImpl extends InRunningComponent implements MarketOutcome {

    private static final String SPAN_TAG = "span";

    public static final String ELLIPSIS_OVERFLOW_CLASS = "ellipsis-overflow";

    private final By elipsesLocator = new By.ByClassName(ELLIPSIS_OVERFLOW_CLASS);

    private By priceLocator = new By.ByTagName(SPAN_TAG);

    private static final String DISABLED_ATTRIBUTE = "disabled";

    private static final String CLASS_ATTRIBUTE = "class";

    private static final String SUSPENDED_CLASS = "suspended";

    private static final String HIGHLIGHTED_CLASS = "selected";

    public MarketOutcomeImpl(final WebElement marketOutcome) {
        setComponent(marketOutcome);
    }

    @Override
    public String getDescription() {
        return getWebElement().getText();
    }

    @Override
    public String getPrice() {
        final List<WebElement> selectionWebElement = getWebElement().findElements(priceLocator);
        final WebElement priceWebElement = selectionWebElement.get(1);
        if (!priceWebElement.isDisplayed()) {
            BaseTestCase.reporter.info("Price is not displayed");
            return StringUtils.EMPTY;
        }
        final String price = priceWebElement.getText();
        return price;
    }

    @Override
    public String getArrowDetail() {
        return null;
    }

    @Override
    public String getOutcomeDescription() {
        final String description = getDescription();
        String outcomeDescription = StringUtils.EMPTY;
        final String outcomeDescriptionRegex = "([+-]?\\d+[\\u00BD\\u00BC\\u00BE]?)";//"([a-zA-Z]+)";
        outcomeDescription = description.replaceAll(outcomeDescriptionRegex, "").trim();
        if (outcomeDescription.contains("Pick")) {
            outcomeDescription = outcomeDescription.replace("Pick", "").trim();
        }
        if (outcomeDescription.contains("EVEN")) {
            outcomeDescription = outcomeDescription.replace("EVEN", "").trim();
        }
        return outcomeDescription;
    }

    @Override
    public String getHandicapValue() {
        final String description = getDescription();
        if (description.contains("Pick")) {
            return "Pick";
        }
        final String handicapRegex = "[+-]?([a-zA-Z]*)[\\+\\-]?[0-9\\./]+";
        final String handicapFractionRegex = "[\\u00BD\\u00BC\\u00BE]";
        final Pattern handicapPattern = Pattern.compile(handicapRegex);
        final Pattern handicapFractionPattern = Pattern.compile(handicapFractionRegex);
        final Matcher handicapMatches = handicapPattern.matcher(description);
        final Matcher handicapFractionMatches = handicapFractionPattern.matcher(description);
        String handicapValue = StringUtils.EMPTY;
        String handicapFraction = StringUtils.EMPTY;
        if (handicapMatches.find()) {
            handicapValue = handicapMatches.group(0);
            handicapValue = handicapValue.replaceAll("[+-]", "");
            if ((handicapValue.isEmpty())) {
                BaseTestCase.reporter.info("Handicap is not displayed");
            }
        }
        if (handicapFractionMatches.find()) {
            handicapFraction = handicapFractionMatches.group(0);
        }

        return handicapValue + handicapFraction;
    }

    @Override
    public boolean isGreyedOut() {
        final String isDisabledValue = getWebElement().getAttribute(DISABLED_ATTRIBUTE);
        if (!Boolean.parseBoolean(isDisabledValue)) {
            return false;
        }
        return true;
    }
    @Override
    public boolean isVisible() {
        final boolean outcomeDisplayed=getWebElement().isDisplayed();
        return outcomeDisplayed;
    }

    @Override
    public boolean isQBMBetPlaced() {
        boolean isBetPlaced = Boolean.FALSE;
        final OutcomeStatus selectionStatus = getStatus();
        if (OutcomeStatus.ACCEPTED.equals(selectionStatus) || OutcomeStatus.REJECTED.equals(selectionStatus)) {
            isBetPlaced = Boolean.TRUE;
        }
        return isBetPlaced;
    }

    @Override
    public OutcomeStatus getStatus() {
        final String selectionStatus = getWebElement().getAttribute(CLASS_ATTRIBUTE);
        final OutcomeStatus status;
        if (selectionStatus.contains(OutcomeStatus.ACCEPTED.getStatusLabel())) {
            status = OutcomeStatus.ACCEPTED;
        } else if (selectionStatus.contains(OutcomeStatus.REJECTED.getStatusLabel())) {
            status = OutcomeStatus.REJECTED;
        } else if (selectionStatus.contains(OutcomeStatus.PENDING.getStatusLabel())) {
            status = OutcomeStatus.PENDING;
        } else {
            status = OutcomeStatus.IDLE;
        }
        return status;
    }

    @Override
    public String getDisplayedArrow() {
        final List<WebElement> priceDecreaseWebElement = getWebElement().findElements(By.className("price-decrease"));
        final List<WebElement> priceIncreaseWebElement = getWebElement().findElements(By.className("price-increase"));
        String priceChange = StringUtils.EMPTY;
        if (!priceDecreaseWebElement.isEmpty()) {
            priceChange = "red";
        } else if (!priceIncreaseWebElement.isEmpty()) {
            priceChange = "green";
        }
        return priceChange;
    }

    @Override
    public boolean isSuspended() {
        return getWebElement().getAttribute("class").contains(SUSPENDED_CLASS);

    }

    @Override
    public boolean isHighlighted() {
        return getWebElement().getAttribute("class").contains(HIGHLIGHTED_CLASS);
    }

    @Override
    public void select() {
        getWebElement().click();

    }

    @Override
    public boolean isElipsesApplied(String outcomeDesc) { // isElipsesApplied("3")
        final List<WebElement> elipsesWebElement = getWebElement().findElements(elipsesLocator);
        if (elipsesWebElement.isEmpty()) {
            return false;
        }
        final String outcomeTextLocator =
                "jQuery('#coupon > ul > li > ul > li > button > span.ellipsis-overflow:contains(" + outcomeDesc + ")')";
        final boolean isElipsesDisplayed = (Boolean) BaseTestCase.webDriver.executeJavascript(
                "return " + outcomeTextLocator + ".width() < " + outcomeTextLocator + "[0].scrollWidth;");
        return isElipsesDisplayed;
    }

}
