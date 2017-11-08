package internal.qaauto.inrunning.tom.betslip;

import internal.qaauto.inrunning.tom.InRunningComponentInterface;
import internal.qaauto.inrunning.tom.Utilties.QBMStatus;

/**
 * Created by Harish Renukunta on 30/10/2014.
 */
public interface QuickBetMode extends InRunningComponentInterface {

    void enable();

    void clickQBM();

    void disable();

    boolean isActive();

    QBMStatus getStatus();

    String getStake();

    void setStake(final String value);

    void clickOn(final int amount);

    String getHighlightedStake();

    boolean isDefaultStakeSelectorDisplayed();

    boolean isEnabled();

    void click(String arrow);

}