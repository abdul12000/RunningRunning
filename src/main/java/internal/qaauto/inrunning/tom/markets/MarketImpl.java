package internal.qaauto.inrunning.tom.markets;

import internal.qaauto.framework.testCase.webTestsCase.BaseTestCase;
import internal.qaauto.inrunning.tom.InRunningComponent;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Harish Renukunta adn rkora
 */
public class MarketImpl extends InRunningComponent implements Market {

    private static final String TITLE_SELECTOR = "h4";

    private final By titleLocator = new By.ByCssSelector(TITLE_SELECTOR);

    private static final String UL_TAG = "ul";

    private final By twoColumnLayoutLocator = new By.ByCssSelector(UL_TAG);

    private static final String LI_TAG = "li";

    private static final String LAYOUT_CSS = UL_TAG + ">" + LI_TAG;

    private final By threeColumnLayoutLocator = new By.ByCssSelector(LAYOUT_CSS);

    private final static String OUTCOME_SELECTOR = "button";

    private final By outcomeLocator = new By.ByTagName(OUTCOME_SELECTOR);

    private static final String CLASS_ATTRIBUTE = "class";

    private static final String SUSPENDED = "suspended";

    private static final String HOME_AWAY_PROP = "home-away-prop";

    private static final String HOME_DRAW_AWAY_PROP = "home-draw-away-prop";

    public MarketImpl(final WebElement market) {
        setComponent(market);
    }

    @Override
    public String getMarketTitle() {
        final List<WebElement> marketTitle = getWebElement().findElements(titleLocator);
        if (marketTitle.isEmpty()) {
            return StringUtils.EMPTY;
        }
        return marketTitle.get(0).getText();
    }

    @Override
    public List<MarketOutcome> getOutcomes() {
        final List<WebElement> marketOutcomeWebElements = getWebElement().findElements(outcomeLocator);
        if (marketOutcomeWebElements.size() == 0) {
            return null;
        }
        final List<MarketOutcome> marketOutcomes = new LinkedList<MarketOutcome>();
        for (WebElement marketOutcomeWebElement : marketOutcomeWebElements) {
            marketOutcomes.add(new MarketOutcomeImpl(marketOutcomeWebElement));
        }
        return marketOutcomes;
    }

    @Override
    public MarketOutcome getOutcomeByPosition(int pos) {
        List<MarketOutcome> marketOutcomes = getOutcomes();
        if (marketOutcomes.size() == 0) {
            return null;
        }
        return marketOutcomes.get(pos);
    }

    @Override
    public MarketOutcome getOutcomeByDescription(final String desc) {
        List<MarketOutcome> marketOutcomes = getOutcomes();
        for (MarketOutcome marketOutcome : marketOutcomes) {
            if (marketOutcome.getDescription().startsWith(desc)) {
                return marketOutcome;
            }
        }
        return null;
    }

    @Override
    public void clickOnOutcomeByDescription(final String desc) {
        List<MarketOutcome> marketOutcomes = getOutcomes();
        if (marketOutcomes == null) {
            BaseTestCase.reporter.info("Outcome is not Displayed");
        }
        for (MarketOutcome marketOutcome : marketOutcomes) {
            if (marketOutcome.getOutcomeDescription().equalsIgnoreCase(desc)) {
                marketOutcome.getWebElement().click();
            }
        }
    }

    @Override
    public void collapse() {
        if (!isCollapsed()) {
            final List<WebElement> marketTitle = getWebElement().findElements(titleLocator);
            if (marketTitle != null && marketTitle.size() != 0) {
                marketTitle.get(0).click();
            }
        }
    }

    @Override
    public void expand() {
        if (isCollapsed()) {
            final List<WebElement> markets = getWebElement().findElements(titleLocator);
            if (markets.size() != 0) {
                markets.get(0).click();
            }
        }
    }

    @Override
    public boolean isCollapsed() {
        final List<MarketOutcome> outcomes = getOutcomes();
        final boolean collapseStatus =
                (outcomes == null || outcomes.size() == 0 || !outcomes.get(0).getWebElement().isDisplayed());
        return collapseStatus;
    }

    @Override
    public boolean isSuspended() {
        final String marketAttribute = getWebElement().getAttribute(CLASS_ATTRIBUTE);
        if (!marketAttribute.contains(SUSPENDED)) {
            BaseTestCase.reporter.info("Market is not suspended");
            return false;
        }
        return true;
    }

    @Override
    public boolean isTwoColumnLayoutDisplayed() {
        int columnSize = getWebElement().findElements(twoColumnLayoutLocator).size();
        boolean columnLayout = Boolean.FALSE;
        if (columnSize == 2) {
            columnLayout = Boolean.TRUE;
        } else {
            BaseTestCase.reporter.info("Two Column layout is not displayed");
        }
        return columnLayout;
    }

    @Override
    public boolean isThreeColumnLayoutDisplayed() {
        int columnSize = getWebElement().findElements(threeColumnLayoutLocator).size();
        boolean columnLayout = Boolean.FALSE;
        if (columnSize == 3) {
            columnLayout = Boolean.TRUE;
        } else {
            BaseTestCase.reporter.info("Three Column layout is not displayed");
        }
        return columnLayout;
    }

    @Override
    public boolean isColumnLayoutDisplayed(final String columnLayout) {

        boolean columnLayoutDisplayed = Boolean.FALSE;
        List<WebElement> columns = getWebElement().findElements(By.cssSelector("li." + columnLayout + ">ul"));
        if (columns.size() == 1) {
            columnLayoutDisplayed = Boolean.TRUE;
        } else if (columnLayout.equals(HOME_AWAY_PROP) && columns.size() == 2) {
            columnLayoutDisplayed = Boolean.TRUE;
        } else if (columnLayout.equals(HOME_DRAW_AWAY_PROP) && columns.size() == 3) {
            columnLayoutDisplayed = Boolean.TRUE;
        }
        return columnLayoutDisplayed;
    }

}
