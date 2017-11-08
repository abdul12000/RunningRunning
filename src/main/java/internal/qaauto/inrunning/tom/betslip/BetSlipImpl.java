package internal.qaauto.inrunning.tom.betslip;

import internal.qaauto.framework.Assert;
import internal.qaauto.framework.testCase.webTestsCase.BaseTestCase;
import internal.qaauto.inrunning.tom.InRunningComponent;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Harish Renukunta on 15/10/2014.
 */
public class BetSlipImpl extends InRunningComponent implements BetSlip {

    private static final String BET_SELECTOR = "li";

    private static final String FREE_BET_TEXT_XPATH = "form/dl/dt[4]";

    private static final String FREE_BET_AMOUNT_XPATH = "form/dl/dd[4]";

    private static final String FREE_BET_BALANCE = "Free Bet Balance:";

    private final By betLocator = new By.ByCssSelector(BET_SELECTOR);

    private static final int SELECTION_INDEX = 0;

    private static final String PLACING_CSS = "p";

    private final By messageLocator = new By.ByTagName(PLACING_CSS);

    private static final String PLACE_BET_BUTTON_CSS = "#live-betslip>form[name='liveBetSlip']>button";

    private final By placeBetLocator = new By.ByCssSelector(PLACE_BET_BUTTON_CSS);

    private static final String ACCOUNT_BALANCE_TEXT_CSS = ".footer :nth-child(5)";

    private static final By accountBalanceTextLocator = new By.ByCssSelector(ACCOUNT_BALANCE_TEXT_CSS);

    private static final String ERROR_MSG_SELECTOR = "p.no-header-error";

    private final By errorMsgLocator = new By.ByCssSelector(ERROR_MSG_SELECTOR);

    private final By freeBetTextLocator = new By.ByXPath(FREE_BET_TEXT_XPATH);

    private final By freeBetAmountLocator = new By.ByXPath(FREE_BET_AMOUNT_XPATH);

    public BetSlipImpl(final WebElement betSlip) {
        setComponent(betSlip);
    }

    @Override
    public int getSelectionCount() {
        List<WebElement> bets = getWebElement().findElements(betLocator);
        if (bets == null) {
            return 0;
        }
        return bets.size();

    }

    @Override
    public void placeBets() {
        final List<WebElement> placeBetWebElement = getWebElement().findElements(placeBetLocator);
        final WebElement placeBetsButton = placeBetWebElement.get(SELECTION_INDEX);
        if (!placeBetsButton.isDisplayed()) {
            Assert.fail("Place bets button is not displayed");
        }
        placeBetWebElement.get(SELECTION_INDEX).click();

    }

    @Override
    public boolean isPlaceBetButtonDisabled() {
        final List<WebElement> placeBetWebElement = getWebElement().findElements(placeBetLocator);
        if (placeBetWebElement.isEmpty()) {
            return false;
        }
        return (placeBetWebElement.get(SELECTION_INDEX).isEnabled() == false);
    }

    @Override
    public boolean isFreeBetBalanceDisplayed() {
        final List<WebElement> freeBetAmountWebElement = getWebElement().findElements(freeBetAmountLocator);
        if (freeBetAmountWebElement.isEmpty()) {
            return false;
        }
        return freeBetAmountWebElement.get(SELECTION_INDEX).isDisplayed();
    }

    @Override
    public boolean isFreeBetTextDisplayed() {
        final List<WebElement> freeBetTextWebElement = getWebElement().findElements(freeBetTextLocator);
        if (freeBetTextWebElement.isEmpty()) {
            return false;
        }
        final String freeBetText = freeBetTextWebElement.get(SELECTION_INDEX).getText();
        return freeBetText.equals(FREE_BET_BALANCE);
    }

    @Override
    public String getMessage() {
        final WebElement messageWebElement =getChildWebElement(messageLocator) ;
        return messageWebElement.getText();
    }

    @Override
    public String getAccountBalance() {
        final List<WebElement> accBalanceWebElement = getWebElement().findElements(By.cssSelector(".footer :nth-child(6)"));
        if (accBalanceWebElement.isEmpty()) {
            BaseTestCase.reporter.info("Balance is not displayed");
            return null;
        }
        final String balanceAmount = accBalanceWebElement.get(SELECTION_INDEX).getText();
        return balanceAmount;
    }

    @Override
    public boolean isAccountBalanceTextDisplayed() {
        final List<WebElement> accBalanceWebElement = getWebElement().findElements(accountBalanceTextLocator);
        if (accBalanceWebElement.isEmpty()) {
            return false;
        }
        final boolean isAccountBalanceTextDisplayed = accBalanceWebElement.get(SELECTION_INDEX).isDisplayed();
        return isAccountBalanceTextDisplayed;
    }

    public List<BetSlipSelection> getBetslipSelections() {
        final List<BetSlipSelection> currentSelections = new LinkedList<>();
        final List<WebElement> betsContainer = getWebElement().findElements(betLocator);
        for (final WebElement selection : betsContainer) {
            currentSelections.add(new BetSlipSelectionImpl(selection));
        }
        return currentSelections;
    }

    public BetSlipSelection getSelectionByPosition(int selectionPosition) {
        final List<BetSlipSelection> betSlipSelections = getBetslipSelections();
        if (betSlipSelections.size() == 0) {
            return null;
        }
        return betSlipSelections.get(selectionPosition);
    }

    @Override
    public BetSlipSelection getSelectionByDescription(final String desc) {
        final List<BetSlipSelection> betSlipSelections = getBetslipSelections();
        for (final BetSlipSelection selection : betSlipSelections) {
            final String selectionDesc = selection.getDescription();
            if (selectionDesc.equalsIgnoreCase(desc)) {
                return selection;
            }
        }
        return null;
    }

    @Override
    public String getTotalStake() {
        List<WebElement> stakeWebElement = getWebElement().findElements(By.tagName("dd"));
        final String stake = stakeWebElement.get(0).getText();
        final String totalStakeRegex = "[US$]";
        final String totalStake = stake.replaceAll(totalStakeRegex, "").trim();
        return totalStake;

    }

    @Override
    public boolean isBetslipModeActive() {
        return true;
    }

    @Override
    public String getErrorMessage() {
        final List<WebElement> errorMessageWebElements = getWebElement().findElements(errorMsgLocator);
        if (errorMessageWebElements == null || errorMessageWebElements.size() == 0) {
            return null;
        }
        return errorMessageWebElements.get(0).getText();
    }

}
