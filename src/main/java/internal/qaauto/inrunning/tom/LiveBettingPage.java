package internal.qaauto.inrunning.tom;

import internal.qaauto.inrunning.tom.Utilties.LeftNavComponents;
import internal.qaauto.inrunning.tom.betslip.BetSlip;
import internal.qaauto.inrunning.tom.betslip.BetSlipModeComponent;
import internal.qaauto.inrunning.tom.betslip.QuickBetMode;
import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavLiveNowEvent;
import internal.qaauto.inrunning.tom.leftnav.LeftNavEventsComponent;
import internal.qaauto.inrunning.tom.leftnav.LeftNavMenu;
import internal.qaauto.inrunning.tom.leftnav.LiveNowEventsComponent;
import internal.qaauto.inrunning.tom.leftnav.UpcomingEventsComponent;
import internal.qaauto.inrunning.tom.markets.Market;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * Created by Harish Renukunta on 03/10/2014.
 */
public interface LiveBettingPage {

    LeftNavMenu getLeftNav();

    LiveNowEventsComponent getLiveNowCouponsComponent();

    LeftNavLiveNowEvent getLiveNowEventByName(final String sport, final String eventName);

    LeftNavEvent getUpcomingEventByName(final String sport, final String eventName);

    UpcomingEventsComponent getUpcomingEventsComponent();

    EventComponentInterface getEventsComponent();

    List<Market> getMarkets();

    Market getMarketByTitle(final String title);

    BetSlipModeComponent getBetSlipModeComponent();

    BetSlip getBetSlip();

    WebElement getChildWebElement(By childElement);

    void setOddsFormat(final String oddsFormat);

    void go();

    void refresh();

    void goToEvent(final String gameId);

    QuickBetMode getQuickBetMode();

    String getTimeZone();

    List<LeftNavLiveNowEvent> getLiveNowEventsBySport(final String sport);

    void login(final String uname, final String pwd);
    
    void login();

    void loginInPageHeader(final String uname, final String pwd);

    boolean logout();

    String getPageURL();

    String getAccountBalance();

    LeftNavEventsComponent getLeftNavEventsComponent(final LeftNavComponents eventsComponent);

    String getCurrentURL();

    LeftNavEvent getFirstLeftNavEvent();
}
