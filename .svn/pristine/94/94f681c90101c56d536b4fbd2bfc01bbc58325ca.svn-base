package internal.qaauto.inrunning.tom.markets;

import internal.qaauto.inrunning.tom.InRunningComponentInterface;

import java.util.List;

/**
 * Created by Harish Renukunta and rkora
 */
public interface Market extends InRunningComponentInterface {

    public String getMarketTitle();

    public List<MarketOutcome> getOutcomes();

    public MarketOutcome getOutcomeByPosition(final int pos);

    MarketOutcome getOutcomeByDescription(final String desc);

    void clickOnOutcomeByDescription(final String desc);

    public void collapse();

    public void expand();

    public boolean isCollapsed();

    public boolean isSuspended();

    boolean isTwoColumnLayoutDisplayed();

    boolean isThreeColumnLayoutDisplayed();

    boolean isColumnLayoutDisplayed(final String columnLayout);

}
