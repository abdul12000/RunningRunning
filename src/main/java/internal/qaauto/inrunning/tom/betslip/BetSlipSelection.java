package internal.qaauto.inrunning.tom.betslip;

import internal.qaauto.inrunning.tom.InRunningComponentInterface;

/**
 * @author rkora on 30/10/2014.
 */
public interface BetSlipSelection extends InRunningComponentInterface {

    String getDescription();

    String getPrice();

    void delete();

    boolean isDisplayed();

    void setRiskAmount(final String amount);

    String getToWinValue();

    void setToWinAmount(String amount);

    String getRiskValue();

    String getSelectionEventDescription();

    String getMarketTitle();

    String getMessage();

    String getDisplayedArrow();

    boolean isSelectionSuspended();

    boolean isElipsesApplied();

    String getMessageBorderColor();
}
