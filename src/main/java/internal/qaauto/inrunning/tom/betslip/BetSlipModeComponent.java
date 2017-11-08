package internal.qaauto.inrunning.tom.betslip;

import internal.qaauto.inrunning.tom.MyBets.MyBets;
import internal.qaauto.inrunning.tom.leftnav.LeftNavMenuComponent;

/**
 * Created by Harish Renukunta on 13/10/2014.
 */

public interface BetSlipModeComponent extends LeftNavMenuComponent {

    String getErrorMessage();

    String getGeneralQBMErrorMessage();

    String getGeneralErrorMessage();

    String getMessage();

    int getBetslipCountFromHeader();

    MyBets getMyBets();

    void goToMyBets();

    boolean isFreeBetTextDisplayed();

    boolean isFreeBetBalanceDisplayed();
}
