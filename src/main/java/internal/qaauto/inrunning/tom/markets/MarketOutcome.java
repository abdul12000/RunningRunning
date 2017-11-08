package internal.qaauto.inrunning.tom.markets;

import internal.qaauto.inrunning.tom.InRunningComponentInterface;
import internal.qaauto.inrunning.tom.Utilties.OutcomeStatus;

/**
 * Created by Harish Renukunta on 06/10/2014.
 */
public interface MarketOutcome extends InRunningComponentInterface {

    public String getDescription();

    public String getPrice();

    public String getArrowDetail();

    String getOutcomeDescription();

    String getHandicapValue();

    boolean isGreyedOut();

    boolean isVisible();

    boolean isQBMBetPlaced();

    OutcomeStatus getStatus();

    String getDisplayedArrow();

    boolean isSuspended();

    public void select();

    boolean isElipsesApplied(final String outcomePosition);

    boolean isHighlighted();
}