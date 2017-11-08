package internal.qaauto.inrunning.tom.MyBets;

import internal.qaauto.inrunning.tom.InRunningComponent;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * @author rkora on 13/01/2015.
 */
public class MyBetsImpl extends InRunningComponent implements MyBets {

    private static final String MESSAGE_CSS = ".header>p";

    private static final int INDEX = 0;

    private static final String BETS_SELECTOR_CSS = ".bets-selector";

    private static final String LI_TAG = "li";

    private static final String EMPTY_MSG_CSS = "p.empty-msg";

    private By messageLocator = new By.ByCssSelector(MESSAGE_CSS);

    private By betTypeLocator = new By.ByCssSelector(BETS_SELECTOR_CSS);

    private By betTypesLocators = new By.ByTagName(LI_TAG);

    private By betTypeMsgLocator = new By.ByCssSelector(EMPTY_MSG_CSS);

    public MyBetsImpl(final WebElement component) {
        setComponent(component);
    }

    @Override
    public String getMessage() {
        final List<WebElement> messageWebElement = getWebElement().findElements(messageLocator);
        if (messageWebElement.isEmpty()) {
            return StringUtils.EMPTY;
        }
        final String message = messageWebElement.get(INDEX).getText();
        return message;
    }

    @Override
    public void selectBetType(String betType) {

        final List<WebElement> betTypeWebElement = getWebElement().findElements(betTypeLocator);
        if (betTypeWebElement.isEmpty()) {
            return;
        }
        final WebElement betTypeDropdown = betTypeWebElement.get(INDEX);
        betTypeDropdown.click();
        final List<WebElement> betTypesWebElements = betTypeDropdown.findElements(betTypesLocators);
        switch (betType) {
        case "All Bets":
            betTypesWebElements.get(0).click();
            break;
        case "Open Bets":
            betTypesWebElements.get(1).click();
            break;
        case "Settled Bets":
            betTypesWebElements.get(2).click();
            break;
        }
    }

    @Override
    public String getBetTypeMessage() {
        final List<WebElement> msgWebElement = getWebElement().findElements(betTypeMsgLocator);
        if (msgWebElement.isEmpty()) {
            return StringUtils.EMPTY;
        }
        final String message = msgWebElement.get(0).getText();
        return message;
    }
}
