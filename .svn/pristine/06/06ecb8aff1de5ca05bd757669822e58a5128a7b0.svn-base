package internal.qaauto.inrunning.tom.betslip;

import internal.qaauto.framework.testCase.webTestsCase.BaseTestCase;
import internal.qaauto.inrunning.tom.InRunningComponent;
import internal.qaauto.inrunning.tom.Utilties.QBMStatus;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * Created by Harish Renukunta on 30/10/2014.
 */
public class QuickBetModeImpl extends InRunningComponent implements
        QuickBetMode {

    private static final String BUTTON_TAG = "button";

    private static final String INPUT_TAG = "input";

    private static final String STAKE_SELECTOR_CSS = "li>button";

    private static final String VALUE_ATTRIBUTE = "value";

    private static final String CLASS_ATTRIBUTE = "class";

    private static final String SELECTED = "selected";

    private static final String SWITCH_BTN_OFF = "switch-btn-off";

    private static final int SELECTION_INDEX = 0;

    private static final String MANUAL_STAKE_CLASS = "manual-stake";

    private static final String UP = "UP";

    private static final String DOWN = "DOWN";

    private final By arrowsLocator = new By.ByTagName(BUTTON_TAG);

    private final By qbmStakeLocator = new By.ByCssSelector(STAKE_SELECTOR_CSS);

    private final By stakeLocator = By.tagName(INPUT_TAG);

    private final By qbmButtonLocator = new By.ByCssSelector(BUTTON_TAG);

    private final By manualStakeLocator = new By.ByClassName(MANUAL_STAKE_CLASS);

    public QuickBetModeImpl(final WebElement quickBetModeWebElement) {
        setComponent(quickBetModeWebElement);
    }

    public void enable() {
        final WebElement qbmButton = getQBMButton();
        if (qbmButton != null) {
            if (!isActive()) {
                qbmButton.click();
            }
        }
    }
    public void clickQBM(){
        final WebElement qbmButton = getQBMButton();
        if (qbmButton != null) {
                qbmButton.click();
        }
    }

    public void disable() {
        WebElement qbmButton = getQBMButton();
        if (qbmButton != null) {
            if (isActive()) {
                qbmButton.click();
            }
        }
    }

    public boolean isActive() {
        WebElement qbmButton = getQBMButton();
        if (qbmButton == null) {
            return false;
        }
        String qbmStatus = qbmButton.getAttribute(CLASS_ATTRIBUTE).contains(
                SWITCH_BTN_OFF) ? QBMStatus.Off.getStatus() : QBMStatus.On
                .getStatus();
        return QBMStatus.On.getStatus().equals(qbmStatus);
    }

    @Override
    public String getStake() {
        final String stakeValue = getWebElement().findElement(stakeLocator)
                .getAttribute(VALUE_ATTRIBUTE);
        return stakeValue;
    }

    @Override
    public void setStake(final String value) {
        final WebElement stakeValue = getWebElement().findElement(stakeLocator);
        stakeValue.clear();
        stakeValue.sendKeys(value);
    }

    @Override
    public String getHighlightedStake() {
        final List<WebElement> stakeSelectors = getWebElement().findElements(qbmStakeLocator);
        if (stakeSelectors == null) {
            return null;
        }
        String highlightedStake = StringUtils.EMPTY;
        for (WebElement stake : stakeSelectors) {
            if (stake.getAttribute(CLASS_ATTRIBUTE).contains(SELECTED)) {
                highlightedStake = stake.getText();
            }
        }
        return highlightedStake;
    }

    @Override
    public boolean isDefaultStakeSelectorDisplayed() {
        final List<WebElement> defaultStakeSelector = getWebElement().findElements(By.className("default-stake-selector"));
        if (defaultStakeSelector.size() == 0) {
            return false;
        }
        final boolean stakeSelector = defaultStakeSelector.get(SELECTION_INDEX).isDisplayed();
        return stakeSelector;
    }

    @Override
    public void clickOn(final int amount) {
        final List<WebElement> defaultStakes = getWebElement().findElements(
                qbmStakeLocator);
        for (WebElement defaultStake : defaultStakes) {
            final int stakeAmount = Integer.parseInt(defaultStake.getText());
            if (stakeAmount == amount) {
                defaultStake.click();
                return;
            }

        }
    }

    private WebElement getQBMButton() {
        List<WebElement> qbmWebElements = getWebElement().findElements(
                qbmButtonLocator);
        if (qbmWebElements == null || qbmWebElements.size() == 0) {
            return null;
        }
        return qbmWebElements.get(SELECTION_INDEX);
    }

    @Override
    public QBMStatus getStatus() {
        final WebElement qbmButton = getQBMButton();
        if (qbmButton == null) {
            return null;
        }
        QBMStatus qbmStatus = qbmButton.getAttribute(CLASS_ATTRIBUTE).contains(
                SWITCH_BTN_OFF) ? QBMStatus.Off : QBMStatus.On;
        return qbmStatus;
    }

    public boolean isEnabled() {
        final WebElement qbmButton = getQBMButton();
        final QBMStatus currentStatus = getStatus();
        qbmButton.click();
        final QBMStatus updatedStatus = getStatus();
        if (!updatedStatus.equals(currentStatus)) {
            qbmButton.click();
        }
        return !currentStatus.equals(updatedStatus);
    }

    @Override
    public void click(String arrow) {
        final WebElement manualStake = getWebElement().findElement(manualStakeLocator);
        final List<WebElement> arrows = manualStake.findElements(arrowsLocator);
        if (arrows.size() == 2) {
            if (arrow.equals(UP)) {
                arrows.get(SELECTION_INDEX).click();
            } else if (arrow.equals(DOWN)) {
                arrows.get(1).click();
            }
        } else {
            BaseTestCase.reporter.info("No Arrows are displayed");
            return;
        }
    }

}
