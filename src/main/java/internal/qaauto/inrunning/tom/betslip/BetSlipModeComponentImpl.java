package internal.qaauto.inrunning.tom.betslip;

import internal.qaauto.inrunning.tom.MyBets.MyBets;
import internal.qaauto.inrunning.tom.MyBets.MyBetsImpl;
import internal.qaauto.inrunning.tom.leftnav.LeftNavMenuComponentImpl;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * Created by Harish Renukunta on 13/10/2014.
 */

public class BetSlipModeComponentImpl extends LeftNavMenuComponentImpl implements BetSlipModeComponent {

    private static final String ERROR_MSG_SELECTOR = ".qbm-error-msg";

    private static final String HEADER_CSS = ".header>h3";

    private static final String LIVE_MY_BETS_ID = "live-my-bets";

    private static final String MESSAGE_SELECTOR = "div[@class='header']/div[contains(@class,'betting-mode')]/p";

    private static final String FREE_BET_TEXT_XPATH = "dl/dt[2]";

    private static final String FREE_BET_AMOUNT_XPATH = "dl/dd[2]";

    private static final String FREE_BET_BALANCE = "Free Bet Balance:";

    private static final String GENERAL_ERROR_MESSAGE_CSS = ".general-error-msg > p";

    private By messageLocator = new By.ByXPath(MESSAGE_SELECTOR);

    private By liveMyBetsLocator = new By.ById(LIVE_MY_BETS_ID);

    private By myBetsLocator = new By.ByCssSelector(HEADER_CSS);

    private By errorMsgLocator = new By.ByCssSelector(ERROR_MSG_SELECTOR);

    private static final String GENERAL_QBM_ERROR_MSG_SELECTOR = ".qbm-errors-container";

    private By generalQBMErrorMsgLocator = new By.ByCssSelector(GENERAL_QBM_ERROR_MSG_SELECTOR);

    private static final String BETS_COUNT_CSS = ".active > span";

    private final By betsCountLocator = new By.ByCssSelector(BETS_COUNT_CSS);

    private final By freeBetTextLocator = new By.ByXPath(FREE_BET_TEXT_XPATH);

    private final By freeBetAmountLocator = new By.ByXPath(FREE_BET_AMOUNT_XPATH);

    private static final int SELECTION_INDEX = 0;

    private final By generalErrorMsgLocator = new By.ByCssSelector(GENERAL_ERROR_MESSAGE_CSS);

    public BetSlipModeComponentImpl(final WebElement component) {
        setComponent(component);
    }

    @Override
    public String getErrorMessage() {
        final WebElement betSlipModeWebElement = getWebElement();
        final List<WebElement> errorMessages = betSlipModeWebElement.findElements(errorMsgLocator);
        if (errorMessages == null || errorMessages.size() == 0) {
            return null;
        }
        return errorMessages.get(0).getText();
    }

    //please make sure while refactoring is it working for QBM and betslip general error message
    @Override
    public String getGeneralQBMErrorMessage() {
        final WebElement betSlipModeWebElement = getWebElement();
        final List<WebElement> errorMessages = betSlipModeWebElement.findElements(generalQBMErrorMsgLocator);
        if (errorMessages == null || errorMessages.size() == 0) {
            return null;
        }
        return errorMessages.get(0).getText();
    }
    @Override
    public String getGeneralErrorMessage() {
        final WebElement betSlipModeWebElement = getWebElement();
        final List<WebElement> errorMessages = betSlipModeWebElement.findElements(generalErrorMsgLocator);
        if (errorMessages == null || errorMessages.size() == 0) {
            return null;
        }
        return errorMessages.get(0).getText();
    }

    @Override
    public int getBetslipCountFromHeader() {
        List<WebElement> bets = getWebElement().findElements(betsCountLocator);
        if (bets.isEmpty()) {
            return 0;
        }
        final int betsCount = Integer.parseInt(bets.get(SELECTION_INDEX).getText());
        return betsCount;

    }

    @Override
    public MyBets getMyBets() {
        final List<WebElement> myBetsLocator = getWebElement().findElements(liveMyBetsLocator);
        if (myBetsLocator.isEmpty()) {
            return null;
        }
        final WebElement myBets = myBetsLocator.get(0);
        return new MyBetsImpl(myBets);
    }

    @Override
    public void goToMyBets() {
        final List<WebElement> rightNavHeader = getWebElement().findElements(myBetsLocator);
        if (rightNavHeader.isEmpty()) {
            return;
        }
        final WebElement myBetsComponent = rightNavHeader.get(1);
        myBetsComponent.click();
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
        final List<WebElement> messageWebElements = getWebElement().findElements(messageLocator);
        if (messageWebElements.isEmpty()) {
            return StringUtils.EMPTY;
        }
        return messageWebElements.get(0).getText();

    }

}
